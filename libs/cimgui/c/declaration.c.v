module c

pub const (
	used_import = 1
)

// See @VEXEROOT/vlib/sokol/c/declaration.c.v for more info on SOKOL declarations

#flag -DIMGUI_DISABLE_OBSOLETE_FUNCTIONS=1

$if emscripten ? {
	// #flag -DSOKOL_GLES2
	#flag -DSOKOL_GLES3

	// Flags for Emscripten
	// Needed with WebGL 2 (GL ES 3.0)
	// #flag -sMAX_WEBGL_VERSION=2
	#flag -sUSE_WEBGL2=1
	// WASM+JS size optimizations
	// https://github.com/emscripten-core/emscripten/issues/19363
	// #flag -sNO_FILESYSTEM=1 -sASSERTIONS=0 -sMALLOC=emmalloc --closure=1

	#flag -s ERROR_ON_UNDEFINED_SYMBOLS=1
	#flag -s ASSERTIONS=1
	// #flag -sWARN_ON_UNDEFINED_SYMBOLS=1
	#flag -s MODULARIZE=0
	#flag -o @VMODROOT\build\wasm\vchip8.html
	#flag --shell-file @VMODROOT\shell_minimal.html

	#flag @VMODROOT/thirdparty/cimgui/libcimgui.a
}

// ----- sokol_imgui.h/sokol_glue.h -----
#flag -I @VMODROOT/thirdparty/sokol
#flag -I @VMODROOT/thirdparty/sokol/util

// ----- cimgui.h -----
#flag -I @VMODROOT/thirdparty/cimgui

// both static and shared will work. if you use dynamic uncomment both lines below and comment this one out
// ----- static config -----
#flag darwin @VMODROOT/thirdparty/cimgui/libcimgui.a
#flag linux @VMODROOT/thirdparty/cimgui/libcimgui.a
#flag windows @VMODROOT/thirdparty/cimgui/libcimgui.a


// rpath is required for shared. for proper installs, -rpath should be relative to @executable_path/
// on windows the dll has to be copied to the same folder as the executable
// ----- shared config -----
// #flag darwin -rpath @VMODROOT/libs/imgui/thirdparty/macos
// #flag darwin @VMODROOT/libs/imgui/thirdparty/macos/cimgui.dylib
// this is where the dll is located
// #flag windows -L@VMODROOT/thirdparty/cimgui
// this is the dll name 'libcimgui.dll'
// #flag windows -lcimgui
// NOTE: if you use shared, you will need to copy the dll to the same folder as the executable

// #flag darwin -framework OpenGL -framework Cocoa -framework IOKit -framework CoreVideo `sdl2-config --libs`

// this is needed for cimgui
#flag windows -lstdc++
// #flag windows -lstdc++ -lgcc_s -lgcc_s -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32
#flag linux -lstdc++
// #flag linux -lGLU -lglfw -lrt -lm -ldl -lX11
#flag darwin -lm -lc++

#include "sokol_glue.h"

#define CIMGUI_DEFINE_ENUMS_AND_STRUCTS
#include "cimgui.h"

// #define SOKOL_IMGUI_IMPL
#include "sokol_imgui.h"
