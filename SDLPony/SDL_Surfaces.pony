use "collections"

primitive _SDLRect
struct SDLRect
	var x: I32 = 0
	var y: I32 = 0
	var w: I32 = 0
	var h: I32 = 0
	new create(x': I32, y': I32, w': I32, h': I32) =>
		x = x'
		y = y'
		w = w'
		h = h'

type SDLPtrRect is MaybePointer[SDLRect]

primitive _SDLPoint
struct SDLPoint
	var x: I32 = 0
	var y: I32 = 0
type SDLPtrPoint is MaybePointer[SDLPoint]

primitive _BlitMap
primitive _Surface
struct Surface
	var _flags: U32 = 0
	var format: Pointer[_PixelFormat] box = Pointer[_PixelFormat]
	var w: I32 box = 0
	var h: I32 box = 0
	var pitch: I32 box = 0
	var pixels: Pointer[U8] = Pointer[U8]
	var userdata: Pointer[U8] = Pointer[U8]
	var _locked: I32 = 0
	var _lock_data: Pointer[U8] = Pointer[U8]
	var clip_rect: Pointer[_SDLRect] = Pointer[_SDLRect]
	var _map: Pointer[_BlitMap] = Pointer[_BlitMap]
	var refcount: I32 = 0

type SDLSurface is Pointer[_Surface]

primitive _SDLRWops
type SDLRWops is Pointer[_SDLRWops]
