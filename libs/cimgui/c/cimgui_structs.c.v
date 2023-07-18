module c

[typedef]
pub struct C.ImVec2 {
pub mut:
	x f32
	y f32
}

pub type ImVec2 = C.ImVec2

// [typedef]
// pub struct C.sapp_range {
// pub:
// 	ptr  voidptr
// 	size usize
// }

// pub type Range = C.sapp_range

pub struct C.ImVec4 {
pub mut:
	x f32
	y f32
	z f32
	w f32
}

// pub struct C.ImDrawChannel {
// pub mut:
// 	_CmdBuffer voidptr // ImVector<ImDrawCmd>
// 	_IdxBuffer voidptr // ImVector<ImDrawIdx>
// }

// pub struct C.ImDrawCmd {
// pub mut:
// 	ElemCount u32
// 	ClipRect  C.ImVec4

// 	TextureId        voidptr
// 	VtxOffset        u32
// 	IdxOffset        u32
// 	UserCallback     fn (&C.ImDrawList, &C.ImDrawCmd)
// 	UserCallbackData voidptr
// }

pub struct C.ImGuiContext {
}
