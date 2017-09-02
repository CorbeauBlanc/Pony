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

primitive FLIPNONE is SDLFlag
	fun value(): U32 => 0x00000000
primitive FLIPHORIZONTAL is SDLFlag
	fun value(): U32 => 0x00000001
primitive FLIPVERTICAL is SDLFlag
	fun value(): U32 => 0x00000002


primitive _Texture
type SDLTexture is Pointer[_Texture]

primitive TEXTUREACCESSSTATIC is SDLFlag
	fun value(): U32 => 0
primitive TEXTUREACCESSSTREAMING is SDLFlag
	fun value(): U32 => 1
primitive TEXTUREACCESSTARGET is SDLFlag
	fun value(): U32 => 2
