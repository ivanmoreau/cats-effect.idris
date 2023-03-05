.PHONY: build

build:
	idris2 --build catsEffect.ipkg
	mill catsEffectIdris.assembly
	cp out/catsEffectIdris/assembly.dest/out.jar build/exec/test_app/