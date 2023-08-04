module main

// import sokol
import sokol.sapp
import sokol.gfx
// import libs.sokol.glue
import libs.cimgui
// import libs.cimgui.C
import libs.sokol.simgui

$if emscripten ? {
	// #flag -DSOKOL_GLES3
	// Flag for Emscripten
	// Needed with WebGL 2 (GL ES 3.0)
	// #flag -sMAX_WEBGL_VERSION=2
	#flag -sUSE_WEBGL2=1
	// WASM+JS size optimizations
	// https://github.com/emscripten-core/emscripten/issues/19363
	// cimgui sokol starterkit flags -sNO_FILESYSTEM=1 -sASSERTIONS=0 -sMALLOC=emmalloc --closure=1
	#flag -sNO_FILESYSTEM=1
	// #flag -sASSERTIONS=0
	// #flag -sMALLOC=emmalloc
	#flag -s "MALLOC='emmalloc'"
	#flag --closure=1
	#flag -s ERROR_ON_UNDEFINED_SYMBOLS=1

	#flag -s MODULARIZE=0
	#flag -o @VMODROOT\build\wasm\vchip8.html

	// #flag emscripten -DSOKOL_NO_ENTRY

	// keep function names
	#flag -g3
	// #flag -cg

	#flag -O0
	// #flag -O3
	// #flag -s INITIAL_MEMORY=1000MB -s MAXIMUM_MEMORY=2000MB
	// #flag -s TOTAL_MEMORY=2048MB
	// #flag -s TOTAL_MEMORY=2GB
	// #flag -s BINARYEN_MEM_MAX=2147418112
	#flag -s ALLOW_MEMORY_GROWTH=1
	// #flag -s USE_PTHREADS=1
	// #flag -s SAFE_HEAP=1
	#flag -sASSERTIONS=1
	// #flag -sASSERTIONS=2
	// #flag -s STACK_SIZE=5MB
	#flag -sSTACK_SIZE=10MB
	// #flag -s WARN_UNALIGNED=1
	// #flag -s WASMFS=1
	// #flag -s LLD_REPORT_UNDEFINED
	// #flag -fsanitize=leak
	// #flag -fsanitize=address
	#flag -s WASM=1
	// #flag -s USE_PTHREADS=1 -s PTHREAD_POOL_SIZE=1
	// #flag -sABORTING_MALLOC=0

	// debugging
	// #flag -fno-inline -fno-inline-functions --profiling
	// #flag -s DEMANGLE_SUPPORT=1
}

// const (
// 	used_import = sokol.used_import
// )

struct AppState {
mut:
	pass_action gfx.PassAction
}

// fn my_log(message &char, user_data voidptr) {
// 	println(message)
// }

fn frame(mut state AppState) {
	desc := simgui.SimguiFrameDesc{
		width: sapp.width()
		height: sapp.height()
		delta_time: sapp.frame_duration()
		dpi_scale: sapp.dpi_scale()
	}
	simgui.new_frame(desc)

	//=== UI CODE STARTS HERE ===
	window_pos := cimgui.ImVec2{10, 10}
	window_pivot := cimgui.ImVec2{0, 0}
	// cimgui.create_context(unsafe { nil })
	// imgui.C.ImGuiCond_Once
	cimgui.set_next_window_pos(window_pos, 1 << 1, window_pivot)
	window_size := cimgui.ImVec2{400, 100}
	// imgui.C.ImGuiCond_Once = 1 << 1
	cimgui.set_next_window_size(window_size, 1 << 1)
	// imgui.C.ImGuiWindowFlags_None = 0
	p_open := false
	cimgui.begin('Hello Dear ImGui!', &p_open, 0)
	// ImGuiColorEditFlags_None = 0
	cimgui.color_edit3('Background', &state.pass_action.colors[0].value.r, 0)
	cimgui.end()
	//=== UI CODE ENDS HERE ===

	gfx.begin_default_pass(&state.pass_action, sapp.width(), sapp.height())
	simgui.render()
	gfx.end_pass()
	gfx.commit()
}

fn cleanup(mut state AppState) {
	simgui.shutdown()
	gfx.shutdown()
}

// fn event(ev &sapp.Event, mut state AppState) {
// 	simgui.handle_event(ev)
// }

fn init(mut state AppState) {
	// logger := gfx.Logger{
	// 	// log_cb: my_log
	// 	log_cb: memory.slog
	// 	// user_data: ...
	// }
	// desc := gfx.Desc{
	// 	context: glue.sgcontext()
	// 	// logger: logger
	// }
	desc := sapp.create_desc()
	gfx.setup(&desc)
	simgui_desc := simgui.SimguiDesc{}
	simgui.setup(&simgui_desc) // TODO

	// initial clear color
	mut colors := state.pass_action.colors
	colors[0] = gfx.ColorAttachmentAction{
		action: gfx.Action.clear
		value: gfx.Color{0.0, 0.5, 1.0, 1.0}
	}
	state.pass_action = gfx.PassAction{
		colors: colors
	}
}

fn main() {
	mut color_action := gfx.ColorAttachmentAction{
		action: .clear
		value: gfx.Color{
			r: 0.3
			g: 0.3
			b: 0.32
			a: 1.0
		}
	}
	mut pass_action := gfx.PassAction{}
	pass_action.colors[0] = color_action
	state := &AppState{
		pass_action: pass_action
		// pass_action: gfx.create_clear_pass(1, 0.1, 0.1, 1.0)
	}
	// title := 'V Metal/GL Text Rendering'

	desc := sapp.Desc{
		user_data: state
		init_userdata_cb: init
		frame_userdata_cb: frame
		cleanup_userdata_cb: cleanup
		// event_userdata_cb: event
		// window_title: title.str
		// html5_canvas_name: title.str
	}

	sapp.run(&desc)
}
