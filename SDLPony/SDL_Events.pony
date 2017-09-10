use "collections"

struct SDLCommonEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0

struct SDLWindowEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var windowID: U32 = 0
	var event: U8 = 0
	var padding1: U8 = 0
	var padding2: U8 = 0
	var padding3: U8 = 0
	var data1: I32 = 0
	var data2: I32 = 0

struct SDLKeysym
{
	var scancode: SDLScancode: SDLScancode
	var sym: SDLKeycode: SDLKeycode
	var mod: U16 = 0
	var unused: U32 = 0

struct SDLKeyboardEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var windowID: U32 = 0
	var state: U8 = 0
	var krepeat: U8 = 0
	var padding2: U8 = 0
	var padding3: U8 = 0
	var keysym: SDLKeysym = SDLKeysym

struct SDLTextEditingEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var windowID: U32 = 0
	var text: Pointer[U8] = Pointer[U8]
	var start: I32 = 0
	var length: I32 = 0

struct SDLTextInputEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var windowID: U32 = 0
	var text: Pointer[U8] = Pointer[U8]

struct SDLMouseMotionEvent
{
	var evt_type: U32
	var timestamp: U32
	var windowID: U32
	var which: U32
	var state: U32
	var x: I32
	var y: I32
	var xrel: I32
	var yrel: I32

struct SDLMouseButtonEvent
	var evt_type: U32
	var timestamp: U32
	var windowID: U32
	var which: U32
	var button: U8
	var state: U8
	var clicks: U8
	var padding1: U8
	var x: I32
	var y: I32

struct SDLMouseWheelEvent
	var type: U32
	var timestamp: U32
	var windowID: U32
	var which: U32
	var x: I32
	var y: I32
	var direction: U32



struct SDLEvent
	type: U32 = 0
	_common: SDLCommonEvent = SDLCommonEvent
