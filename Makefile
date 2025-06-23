OUT = a.wasm
OPT = wasm-opt a.wasm --enable-bulk-memory -o a.wasm -Oz && wasm-strip a.wasm
FLAGS = -std=c99 -nostdlib -Wl,--export-all -Wl,--allow-undefined
# -Wl,--no-entry

all:
	clang --target=wasm32 main.c $(FLAGS) -g -mbulk-memory -o $(OUT)

opt:
	clang --target=wasm32 main.c $(FLAGS) -Oz -flto -o $(OUT)
	$(OPT)

wcc:
	../xcc/wcc main.c $(FLAGS) --verbose

wcc-opt: wcc
	$(OPT)

decomp:
	wasm-decompile $(OUT)

objdump:
	wasm-objdump $(OUT) -x

serve:
	python3 -m http.server
