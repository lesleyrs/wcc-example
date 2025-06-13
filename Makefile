all:
	clang --target=wasm32 -std=c99 main.c -g -nostdlib -Wl,--no-entry -Wl,--export-all -Wl,--allow-undefined -mbulk-memory -o a.wasm

opt:
	clang --target=wasm32 main.c -Oz -flto -nostdlib -Wl,--no-entry -Wl,--export-all -Wl,--allow-undefined -o a.wasm && wasm-opt a.wasm -o a.wasm -Oz && wasm-strip a.wasm

wcc:
	../xcc/wcc --verbose -std=c99 main.c -nostdlib --entry-point= -e=init -e=strlen

wcc-opt:
	../xcc/wcc --verbose -std=c99 main.c -nostdlib --entry-point= -e=init -e=strlen && wasm-opt a.wasm -o a.wasm -Oz && wasm-strip a.wasm

decomp:
	wasm-decompile a.wasm

objdump:
	wasm-objdump a.wasm -x

serve:
	python3 -m http.server
