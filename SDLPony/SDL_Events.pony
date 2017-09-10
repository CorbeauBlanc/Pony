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
	var scancode: SDLScancode = 0
	var sym: SDLKeycode = 0
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
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var windowID: U32 = 0
	var which: U32 = 0
	var state: U32 = 0
	var x: I32 = 0
	var y: I32 = 0
	var xrel: I32 = 0
	var yrel: I32 = 0

struct SDLMouseButtonEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var windowID: U32 = 0
	var which: U32 = 0
	var button: U8 = 0
	var state: U8 = 0
	var clicks: U8 = 0
	var padding1: U8 = 0
	var x: I32 = 0
	var y: I32 = 0

struct SDLMouseWheelEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var windowID: U32 = 0
	var which: U32 = 0
	var x: I32 = 0
	var y: I32 = 0
	var direction: U32 = 0



struct SDLEvent
	var evt_type: U32 = 0
	var _common: SDLCommonEvent = SDLCommonEvent
