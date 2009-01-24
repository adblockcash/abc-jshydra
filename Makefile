INCLUDE = -I/src/build/trunk/browser/dist/include/js/ \
		  -I/src/build/trunk/browser/dist/include/nspr/ -DXP_UNIX \
	  -I/src/trunk/mozilla/js/src/
LINK := -L/src/build/trunk/browser/dist/lib -lnspr4 -lm

OBJS := jsapi.o jsarena.o jsarray.o jsatom.o jsbool.o jscntxt.o jsdate.o \
	jsdbgapi.o jsdhash.o jsdtoa.o jsemit.o jsexn.o jsfun.o jsgc.o jshash.o \
	jsinterp.o jsinvoke.o jsiter.o jslock.o jslog2.o jslong.o jsmath.o jsnum.o \
   	jsobj.o json.o jsopcode.o jsparse.o jsprf.o jsregexp.o jsscan.o jsscope.o \
	jsscript.o jsstr.o jsutil.o jsxdrapi.o jsxml.o prmjtime.o jstracer.o \
	Assembler.o Fragmento.o LIR.o RegAlloc.o avmplus.o Nativei386.o jsbuiltins.o

OBJS := $(addprefix /src/build/trunk/browser/js/src/, $(OBJS))

jshydra: jshydra.o jshydra_funcs.o jshydra_bridge.o
	g++ -o jshydra jshydra.o jshydra_funcs.o jshydra_bridge.o $(OBJS) $(LINK)

jshydra.o: jshydra.c
	gcc -o jshydra.o -g $(INCLUDE) -c jshydra.c

jshydra_funcs.o: jshydra_funcs.c
	gcc -o jshydra_funcs.o -g $(INCLUDE) -c jshydra_funcs.c
jshydra_bridge.o: jshydra_bridge.c
	gcc -o jshydra_bridge.o -g $(INCLUDE) -c jshydra_bridge.c