import unittest
from chipevo.reasoning_evidence import observe,aggregate
from chipevo.study_metrics import normalize_usage

class EvidenceTests(unittest.TestCase):
    def test_missing_is_unknown(self):
        e=observe({'content':[]},{'request_options':{'output_config':{'effort':'high'}}})
        self.assertEqual(e['status'],'unconfirmed');self.assertIsNone(e['reasoning_tokens'])
        self.assertIsNone(aggregate([e])['reported_reasoning_tokens'])
    def test_usage_and_blocks(self):
        raw={'content':[{'type':'thinking','thinking':'test'}],'usage':{'input_tokens':3,'output_tokens':10,'output_tokens_details':{'thinking_tokens':7}}}
        self.assertEqual(normalize_usage(raw['usage'],'anthropic_messages')['reasoning_tokens'],7)
        e=observe(raw,{});self.assertEqual(e['status'],'observed')
        mixed=aggregate([e,observe({}, {})]);self.assertEqual(mixed['status'],'mixed');self.assertFalse(mixed['reasoning_usage_complete'])
    def test_empty_block_not_proof(self):
        self.assertEqual(observe({'content':[{'type':'thinking','thinking':''}]},{})['status'],'unconfirmed')

if __name__=='__main__':unittest.main()

