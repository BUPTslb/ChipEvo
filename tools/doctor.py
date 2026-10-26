#!/usr/bin/env python3
from pathlib import Path
import sys,json
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from chipevo.toolchain import doctor
if __name__=='__main__':print(json.dumps(doctor(Path(__file__).resolve().parents[1]),indent=2))
