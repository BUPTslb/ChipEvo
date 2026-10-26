import sys,runpy,faulthandler
faulthandler.enable()
faulthandler.dump_traceback_later(120,repeat=True)
sys.path.insert(0,'/openram')
sys.argv=['/openram/sram_compiler.py','-v','-v','-k',sys.argv[1]]
runpy.run_path('/openram/sram_compiler.py',run_name='__main__')
