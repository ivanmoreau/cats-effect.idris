# Cats effect for Idris JVM

## Instructions (Test Main)

Use the flake with all compilers included:

```bash
nix develop
```

or, if you prefer direnv

```bash
direnv allow
```

Build idris project

```bash
idris2 --build catsEffect.ipkg
```

then build the wrapper jar with mill and copy it to the same folder as the output from idris

```bash
mill catsEffectIdris.assembly
cp out/catsEffectIdris/assembly.dest/out.jar build/exec/test_app/
```

Finally we can execute the sample app:

```bash
./build/exec/test
```