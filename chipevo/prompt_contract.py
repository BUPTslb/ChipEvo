"""Shared language rule and section boundary for generated model prompts."""
import re

LANGUAGE_RULE = 'Use English for all explanations, summaries, and new RTL comments. Do not use Chinese.'
BASELINE_SECTION = '\nFixed initial baseline metrics:\n'
_HAN = re.compile('[\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff\U00020000-\U000323af]')

def english_prompt(text):
    """Fail before inference if generated task instructions contain Chinese."""
    if _HAN.search(text):raise ValueError('Chinese text is not allowed in generated model prompts')
    return text
