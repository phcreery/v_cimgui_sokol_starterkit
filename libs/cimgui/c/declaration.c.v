module c

pub const (
	used_import = 1
)

#flag -DCIMGUI_DEFINE_ENUMS_AND_STRUCTS=1
#flag -DIMGUI_DISABLE_OBSOLETE_FUNCTIONS=1
// #flag -DIMGUI_IMPL_API=

#flag -DSOKOL_GLCORE33
// #flag -DSOKOL_GLES3
// #flag -DSOKOL_GLES2
// #flag -DSOKOL_WGPU
// #flag -DSOKOL_NO_ENTRY

// ----- sokol_imgui.h/sokol_glue.h -----
#flag -I @VMODROOT/thirdparty/sokol
#flag -I @VMODROOT/thirdparty/sokol/util

// ----- cimgui.h -----
#flag -I @VMODROOT/thirdparty/cimgui
// #flag -I @VMODROOT/thirdparty/cimgui-good-bkup

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

#flag linux -lGL -lstdc++
// #flag linux -lX11 -lGL -lXcursor -lXi -lpthread -lstdc++
// #flag linux -lstdc++ -lGL -lGLU -lglfw -lrt -lm -ldl -lX11
#flag darwin -framework OpenGL -framework Cocoa -framework IOKit -framework CoreVideo `sdl2-config --libs`
#flag darwin -lm -lc++
#flag windows -lstdc++
// #flag windows -lstdc++ -lgcc_s -lgcc_s -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32

#include "sokol_glue.h"

#define CIMGUI_DEFINE_ENUMS_AND_STRUCTS
#include "cimgui.h"

#define SOKOL_IMGUI_IMPL
#include "sokol_imgui.h"
