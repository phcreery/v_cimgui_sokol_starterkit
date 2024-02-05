# Cross Platform Makefile
# Tested on Windows 10 (msys2 mingw64)

OBJS = thirdparty/cimgui/libcimgui.o
OBJS += thirdparty/sokol/sokol_glue.h
OBJS += thirdparty/sokol/util/sokol_imgui.h

# CXXFLAGS=-O2 -fno-exceptions -fno-rtti -fno-threadsafe-statics

UNAME_S := $(shell uname -s)

app: $(OBJS)
	v -cc cc -showcc .\src

imgui:
	cd thirdparty && git clone --recursive https://github.com/cimgui/cimgui.git
	cd thirdparty/cimgui && $(MAKE) static
# FOR SHARED DLL INSTEAD OF STATIC
# copy dll to ./src
# cp ./thirdparty/cimgui/libcimgui.dll ./src

sokol:
	cd thirdparty && git clone https://github.com/floooh/sokol

clean:
	rm -f $(OBJS)
