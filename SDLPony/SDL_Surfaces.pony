use "collections"

primitive _SDLRect
struct SDLRect
	var x: I64 = 0
	var y: I64 = 0
	var w: I64 = 0
	var h: I64 = 0
	new create(x': I64, y': I64, w': I64, h': I64) =>
		x = x'
		y = y'
		w = w'
		h = h'

type SDLPtrRect is MaybePointer[SDLRect]

primitive _SDLPoint
struct SDLPoint
	var x: I64 = 0
	var y: I64 = 0
type SDLPtrPoint is MaybePointer[SDLPoint]

primitive _BlitMap
primitive _Surface
struct Surface
	var _flags: U32 = 0
	var format: Pointer[_PixelFormat] box = Pointer[_PixelFormat]
	var w: I64 box = 0
	var h: I64 box = 0
	var pitch: I64 box = 0
	var pixels: Pointer[U8] = Pointer[U8]
	var userdata: Pointer[U8] = Pointer[U8]
	var _locked: I64 = 0
	var _lock_data: Pointer[U8] = Pointer[U8]
	var clip_rect: Pointer[_SDLRect] = Pointer[_SDLRect]
	var _map: Pointer[_BlitMap] = Pointer[_BlitMap]
	var refcount: I64 = 0

type SDLSurface is Pointer[_Surface]

primitive _SDLRWops
type SDLRWops is Pointer[_SDLRWops]
