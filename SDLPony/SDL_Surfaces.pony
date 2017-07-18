use "collections"
use "lib:SDL2"

primitive _Rect
struct SDLRect
	var x: U64 = 0
	var y: U64 = 0
	var w: U64 = 0
	var h: U64 = 0

primitive _BlitMap
primitive _Surface
struct Surface
	var _flags: U32 = 0
	var format: Pointer[_PixelFormat] box = Pointer[_PixelFormat]
	var w: U64 box = 0
	var h: U64 box = 0
	var pitch: U64 box = 0
	var pixels: Pointer[U8] = Pointer[U8]
	var userdata: Pointer[U8] = Pointer[U8]
	var _locked: U64 = 0
	var _lock_data: Pointer[U8] = Pointer[U8]
	var clip_rect: Pointer[_Rect] = Pointer[_Rect]
	var _map: Pointer[_BlitMap] = Pointer[_BlitMap]
	var refcount: U64 = 0

type SDLSurface is Pointer[_Surface]
