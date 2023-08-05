# V implementation of https://github.com/floooh/cimgui-sokol-starterkit

sokol implementation inspired from

- https://github.com/vlang/v/tree/master/vlib/sokol
- https://github.com/vlang/v/blob/master/examples/sokol/fonts.v

cimgui implementation inspired from:

- https://github.com/cimgui/cimgui
- https://github.com/prime31/via/tree/master/libs/imgui

## Compiling

Add `CXXFLAGS=-O2 -fno-exceptions -fno-rtti -fno-threadsafe-statics` to cimgui Makefile
Compile https://github.com/floooh/cimgui-sokol-starterkit the recommended way to obtain

- libcimgui.a

See changes in `libs\imgui\c\declaration.c.v` for the importing of the sokol_glue.h, cimgui.h, sokol_imgui.h and precompiled libs

### Windows

MSVC has been tested

```
v -cc C:\msys64\mingw64\bin\cc.exe -showcc -keepc run .\src
v -cc cc -showcc run .\src
```

```
cc.exe (Rev6, Built by MSYS2 project) 13.1.0
```

### Linux

If you are using OpenGL <3, you may have to enable software rendering with `export LIBGL_ALWAYS_SOFTWARE=1`

```
v -cc gcc -showcc run .\src
```

### WASM

cimgui needs to be compiled with emscripten

```
v -showcc -os wasm32_emscripten .
```

## References

- DLLs info: https://nullprogram.com/blog/2021/05/31/
