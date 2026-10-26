"""Evaluator maintenance only; never run from candidate-provided code."""
from pathlib import Path
import sys,argparse
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from chipevo.engine import asset_manifest
from chipevo.util import save
p=argparse.ArgumentParser();p.add_argument('--update',action='store_true');a=p.parse_args()
if not a.update:p.error('Use --update only after reviewing evaluator changes; this changes the trusted asset lock')
root=Path(__file__).resolve().parents[1]
save(root/'configs/assets.sha256.json',asset_manifest(root))
print('Updated trusted asset lock; rebuild grader bundle before use')
