# V implementation of https://github.com/floooh/cimgui-sokol-starterkit

sokol implementation inspired from

- https://github.com/vlang/v/tree/master/vlib/sokol
- https://github.com/vlang/v/blob/master/examples/sokol/fonts.v

cimgui implementation inspired from:

- https://github.com/cimgui/cimgui
- https://github.com/prime31/via/tree/master/libs/imgui

## Compiling

Compile https://github.com/floooh/cimgui-sokol-starterkit the recommended way to obtain

- libcimgui.a
<!-- - libsokol.a -->

and then copy them into @VMODROOT

See changes in `libs\imgui\c\declaration.c.v` for the importing of the sokol_glue.h, cimgui.h, sokol_imgui.h and precompiled libs

```
v -cc C:\msys64\mingw64\bin\cc.exe -showcc -keepc run .\src
v -cc cc -showcc run .\src
```

```
cc.exe (Rev6, Built by MSYS2 project) 13.1.0
```

## References

- DLLs info: https://nullprogram.com/blog/2021/05/31/
