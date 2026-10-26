from pathlib import Path
import json,tempfile,unittest
from unittest.mock import patch
from chipevo.prompt_contract import BASELINE_SECTION,LANGUAGE_RULE,english_prompt
from chipevo.study import fixed_prompt
from chipevo.prompting import render
from chipevo.rollout import SYSTEM_PROMPT,tools
from chipevo.context_manager import ContextManager
from chipevo.providers import payload
from chipevo.util import load

ROOT=Path(__file__).resolve().parents[1]

class PromptLanguageTests(unittest.TestCase):
    def evidence(self,objective):
        return {'design':'d','objective':objective,'strategy':'timing_module' if objective=='timing' else 'hierarchy_area',
                'task_period_ns':5.,'module_index':[{'module':'alu','protected':False}],
                'suggested_targets':[{'module':'alu','file':'rtl/alu.v'}]}

    def test_rollout_prompts_keep_goals_and_language_rule(self):
        cfg=load(ROOT/'configs/studies/example.json')
        for objective,period in [('timing',.1),('area',5.)]:
            text=fixed_prompt(cfg,'d',objective,{'period_ns':period,'scoring':{'max_area_ratio':1.05}},self.evidence(objective),{'total_area_um2':100.})
            self.assertEqual(english_prompt(text),text)
            self.assertIn(LANGUAGE_RULE,text);self.assertIn(BASELINE_SECTION,text)
            self.assertIn('128000 output tokens',text);self.assertIn('0',text)
            self.assertNotIn('2%',text);self.assertIn('Preserve functionality',text)
            if objective=='timing':self.assertIn('10000 MHz (0.1 ns)',text);self.assertIn('1.05 times',text)
            else:self.assertIn('200 MHz (5 ns)',text);self.assertIn('spend the initial timing margin',text)

    def test_standalone_real_templates_render_in_english(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);(root/'prompts').mkdir()
            for objective in ['timing','area']:
                (root/f'prompts/{objective}.md').write_text((ROOT/f'prompts/{objective}.md').read_text())
                cfg={'period_ns':5.,'scoring':{'delay_constraint':'period'}}
                with patch('chipevo.prompting.task',return_value=cfg),patch('chipevo.prompting.prepare_context',return_value=self.evidence(objective)):
                    text,_=render(root,'d',objective,1)
                english_prompt(text);self.assertNotIn('{{',text)
                self.assertIn('Do not use Chinese',text);self.assertIn('Fixed task configuration',text)

    def test_system_and_tool_descriptions_are_english(self):
        english_prompt(SYSTEM_PROMPT);self.assertIn(LANGUAGE_RULE,SYSTEM_PROMPT)
        english_prompt(json.dumps(tools(1),ensure_ascii=False))

    def test_chinese_generated_instructions_are_rejected(self):
        with self.assertRaisesRegex(ValueError,'Chinese text'):
            english_prompt('Optimize RTL. '+chr(0x4e2d))

    def test_all_provider_request_formats_keep_english_instructions(self):
        cfg=load(ROOT/'configs/studies/example.json')
        text=fixed_prompt(cfg,'d','timing',{'period_ns':.1,'scoring':{'max_area_ratio':1.05}},self.evidence('timing'),{})
        messages=[{'role':'system','content':SYSTEM_PROMPT},{'role':'user','content':text}]
        for protocol in ['openai_chat','openai_responses','anthropic_messages']:
            body=payload({'protocol':protocol,'model':'fixture'},messages,tools(1),8192)
            english_prompt(json.dumps(body,ensure_ascii=False))

    def test_english_baseline_boundary_keeps_evidence_offloading_working(self):
        cfg=load(ROOT/'configs/studies/example.json');budget={**cfg['budget'],'max_estimated_input_tokens':2000}
        archived={}
        def archive(text,kind):archived[kind]=text;return 'candidate-local-ref'
        manager=ContextManager({'protocol':'openai_chat','model':'fixture'},budget,archive)
        task='Optimize RTL. Use English only.'+BASELINE_SECTION+json.dumps({'large_evidence':'x'*30000})
        request,record=manager.prepare([{'role':'system','content':SYSTEM_PROMPT},{'role':'user','content':task}],[],{},lambda s:'English summary')
        self.assertEqual(archived['task-evidence'],task)
        self.assertIn('Optimize RTL.',request['messages'][1]['content'])
        self.assertIn('recall_history',request['messages'][1]['content'])
        english_prompt(json.dumps(request,ensure_ascii=False));self.assertLessEqual(manager.size(request),2000)
