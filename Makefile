.PHONY: _default
_default:
	fasm src/convert.asm build/convert.o
	gcc -O0 -L./convert_includes.h -no-pie -g -Xlinker -z noexecstack src/main.c build/convert.o -o build/main
	./build/main
