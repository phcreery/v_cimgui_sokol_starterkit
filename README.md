# V implementation of https://github.com/floooh/cimgui-sokol-starterkit

## Compiling

Compile https://github.com/floooh/cimgui-sokol-starterkit the recommended way to obtain static lib. See Makefile for more information

```
cd 'v_cimgui_sokol_starterkit'
make sokol
make cimgui
```

this gives us `libcimgui.a` (cimgui static lib)

See changes in `libs\imgui\c\declaration.c.v` for the importing of the sokol_glue.h, cimgui.h, sokol_imgui.h and precompiled libs

### Windows

Works with MSVC/w64devkit

```
v -cc cc -showcc run .\src
```

### Linux

If you are using OpenGL < 3, you may have to enable software rendering with `export LIBGL_ALWAYS_SOFTWARE=1`

```
v -cc gcc -showcc run .\src
```

### WASM

- cimgui library first needs to be compiled with emscripten
- then:
  ```
  v -showcc -os wasm32_emscripten .
  ```

## References

- sokol implementation inspired from
  - https://github.com/vlang/v/tree/master/vlib/sokol
  - https://github.com/vlang/v/blob/master/examples/sokol/fonts.v
- cimgui implementation inspired from:
  - https://github.com/cimgui/cimgui
  - https://github.com/prime31/via/tree/master/libs/imgui
- DLLs info: https://nullprogram.com/blog/2021/05/31/
