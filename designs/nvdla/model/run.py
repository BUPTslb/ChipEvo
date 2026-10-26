from pathlib import Path
import argparse,sys
root=Path(__file__).resolve().parents[3]
sys.path.insert(0,str(root))
from chipevo.eda.simulation import nvdla_regression
p=argparse.ArgumentParser(description="Explicit current-reference SDP/PDP/CDP regression")
p.add_argument('--run-eda',action='store_true');p.add_argument('--output',required=True);a=p.parse_args()
if not a.run_eda:p.error('Explicit --run-eda required; nothing launched')
r=nvdla_regression(root,root/a.output)
print('PASS' if r['passed'] else 'FAILED');raise SystemExit(0 if r['passed'] else 1)
