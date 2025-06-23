OUT = a.wasm
OPT = wasm-opt $(OUT) --enable-bulk-memory -o $(OUT) -Oz && wasm-strip $(OUT)
SRCS = main.c
FLAGS = -std=c99 -nostdlib -Wl,--export-all -Wl,--allow-undefined $(SRCS)

all:
	clang $(FLAGS) --target=wasm32 -g -mbulk-memory -o $(OUT)

opt:
	clang $(FLAGS) --target=wasm32 -Oz -flto -o $(OUT)
	$(OPT)

wcc:
	../xcc/wcc $(FLAGS) --verbose

wcc-opt: wcc
	$(OPT)

decomp:
	wasm-decompile $(OUT)

objdump:
	wasm-objdump $(OUT) -x

serve:
	python3 -m http.server
