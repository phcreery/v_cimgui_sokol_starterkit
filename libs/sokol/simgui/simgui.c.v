module simgui

// import libs.sokol.c
// import libs.sokol.gfx
import sokol.sapp

// pub const used_import = c.used_import

[inline]
pub fn setup(desc &C.simgui_desc_t) {
	C.simgui_setup(desc)
}

[inline]
pub fn new_frame(desc &C.simgui_frame_desc_t) {
	C.simgui_new_frame(desc)
}

[inline]
pub fn render() {
	C.simgui_render()
}

[inline]
pub fn handle_event(ev &sapp.Event) bool {
	return C.simgui_handle_event(ev)
}

[inline]
pub fn map_keycode(keycode sapp.KeyCode) int {
	return C.simgui_map_keycode(keycode)
}

[inline]
pub fn shutdown() {
	C.simgui_shutdown()
}
