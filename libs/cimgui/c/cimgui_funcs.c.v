module c

// pub struct C.ImVec2_Simple {
// pub:
// 	x f32
// 	y f32
// }

// pub type ImVec2 = C.ImVec2

// pub struct C.ImVec4_Simple {
// pub:
// 	x f32
// 	y f32
// 	z f32
// 	w f32
// }

// pub struct C.ImColor_Simple {
// pub:
// 	Value C.ImVec4_Simple
// }

fn C.ImVec2ToSimple(vec C.ImVec2) C.ImVec2
fn C.ImVec4ToSimple(vec C.ImVec4) C.ImVec4

// fn C.ImColorToSimple(col C.ImColor) C.ImColor

fn C.igBegin(name &char, p_open &bool, flags int) bool
fn C.igEnd()

fn C.igCreateContext(shared_font_atlas &C.ImFontAtlas) &C.ImGuiContext
fn C.igDestroyContext(ctx &C.ImGuiContext)
fn C.igGetCurrentContext() &C.ImGuiContext
fn C.igSetCurrentContext(ctx &C.ImGuiContext)

fn C.igSetNextWindowPos(pos C.ImVec2, cond int, pivot C.ImVec2)
fn C.igSetNextWindowSize(size C.ImVec2, cond int)

fn C.igColorEdit3(label byteptr, col &f32, flags int) bool
