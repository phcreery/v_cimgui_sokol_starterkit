module glue

import sokol.gfx

@[inline]
pub fn sgcontext() gfx.ContextDesc {
	return C.sapp_sgcontext()
}
