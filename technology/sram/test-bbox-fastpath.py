import sys,time,json,numpy as np
sys.path.insert(0,'/openram')
from common import make_openram_package
make_openram_package()
from openram.gdsMill import gdsMill
results=[]
for name in ['probe_1rw','probe_1r1w']:
    values=[]
    for skip in [False,True]:
        layout=gdsMill.VlsiLayout()
        if skip: layout.processLabelPins=lambda *args, **kwargs:None
        start=time.monotonic()
        gdsMill.Gds2reader(layout).loadFromFile('/out/'+name+'/'+name+'.gds')
        values.append(np.asarray(layout.measureBoundary(layout.rootStructureName)))
        results.append(dict(name=name,skip_pin_labels=skip,seconds=time.monotonic()-start,bbox=values[-1].tolist()))
    assert np.array_equal(values[0],values[1]),name
print(json.dumps(results,indent=2))
print('PASS exact bounding boxes with and without pin-label discovery')
