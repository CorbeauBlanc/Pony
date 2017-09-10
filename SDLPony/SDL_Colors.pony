use "collections"

primitive _Color
struct SDLColor
	var r: U8 = 0
	var g: U8 = 0
	var b: U8 = 0
	var a: U8 = 0

primitive _Palette
struct SDLPalette
	var ncolors: I64 = 0
	var colors: Pointer[_Color] = Pointer[_Color]
	var version: U32 = 0
	var refcount: I64 = 0

primitive _PixelFormat
struct PixelFormat
	var format: U32 = 0
	var palette: Pointer[_Palette] = Pointer[_Palette]
	var bitsPerPixel: U8 = 0
	var bytesPerPixel: U8 = 0
	var rMask: U32 = 0
	var gMask: U32 = 0
	var bMask: U32 = 0
	var aMask: U32 = 0
	var _rLoss: U8 = 0
	var _gLoss: U8 = 0
	var _bLoss: U8 = 0
	var _aLoss: U8 = 0
	var _rShift: U8 = 0
	var _gShift: U8 = 0
	var _bShift: U8 = 0
	var _aShift: U8 = 0
	var _refcount: I64 = 0
	var _next: Pointer[_PixelFormat] = Pointer[_PixelFormat]
type SDLPixelFormat is Pointer[_PixelFormat]

primitive BLENDMODENONE is SDLFlag
	fun value(): U32 => 0x00000000
primitive BLENDMODEBLEND is SDLFlag
	fun value(): U32 => 0x00000001
primitive BLENDMODEADD is SDLFlag
	fun value(): U32 => 0x00000002
primitive BLENDMODEMOD is SDLFlag
	fun value(): U32 => 0x00000004
