use "collections"
use "lib:SDL2"

primitive _Renderer
type SDLRenderer is Pointer[_Renderer]

primitive RENDERERSOFTWARE is SDLFlag
	fun value(): U32 => 0x00000001
primitive RENDERERACCELERATED is SDLFlag
	fun value(): U32 => 0x00000002
primitive RENDERERPRESENTVSYNC is SDLFlag
	fun value(): U32 => 0x00000004
primitive RENDERERTARGETTEXTURE is SDLFlag
	fun value(): U32 => 0x00000008
