use "collections"

type SDLJoystickID is I32
type SDLTouchID is I64
type SDLFingerID is I64
type SDLGestureID is I64


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

struct SDLJoyAxisEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var which: SDLJoystickID = 0
	var axis: U8 = 0
	var padding1: U8 = 0
	var padding2: U8 = 0
	var padding3: U8 = 0
	var value: I16 = 0
	var padding4: U16 = 0

struct SDLJoyBallEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var which: SDLJoystickID = 0
	var ball: U8 = 0
	var padding1: U8 = 0
	var padding2: U8 = 0
	var padding3: U8 = 0
	var xrel: I16 = 0
	var yrel: I16 = 0

struct SDLJoyHatEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var which: SDLJoystickID = 0
	var hat: U8 = 0
	var value: U8 = 0
	var padding1: U8 = 0
	var padding2: U8 = 0

struct SDLJoyButtonEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var which: SDLJoystickID = 0
	var button: U8 = 0
	var state: U8 = 0
	var padding1: U8 = 0
	var padding2: U8 = 0

struct SDLJoyDeviceEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var which: I32 = 0


struct SDLControllerAxisEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var which: SDLJoystickID = 0
	var axis: U8 = 0
	var padding1: U8 = 0
	var padding2: U8 = 0
	var padding3: U8 = 0
	var value: I16 = 0
	var padding4: U16 = 0


struct SDLControllerButtonEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var which: SDLJoystickID = 0
	var button: U8 = 0
	var state: U8 = 0
	var padding1: U8 = 0
	var padding2: U8 = 0


struct SDLControllerDeviceEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var which: I32 = 0

struct SDLAudioDeviceEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var which: U32 = 0
	var iscapture: U8 = 0
	var padding1: U8 = 0
	var padding2: U8 = 0
	var padding3: U8 = 0


struct SDLTouchFingerEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var touchId: SDLTouchID = 0
	var fingerId: SDLFingerID = 0
	var x: F32 = 0
	var y: F32 = 0
	var dx: F32 = 0
	var dy: F32 = 0
	var pressure: F32 = 0


struct SDLMultiGestureEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var touchId: SDLTouchID = 0
	var dTheta: F32 = 0
	var dDist: F32 = 0
	var x: F32 = 0
	var y: F32 = 0
	var numFingers: U16 = 0
	var padding: U16 = 0


struct SDLDollarGestureEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var touchId: SDLTouchID = 0
	var gestureId: SDLGestureID = 0
	var numFingers: U32 = 0
	var error: F32 = 0
	var x: F32 = 0
	var y: F32 = 0


struct SDLDropEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var file: Pointer[U8] = Pointer[U8]
	var windowID: U32 = 0


struct SDLQuitEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0

struct SDLOSEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0

struct SDLUserEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var windowID: U32 = 0
	var code: I32 = 0
	var data1: Pointer[U8] = Pointer[U8]
	var data2: Pointer[U8] = Pointer[U8]






struct SDLEvent
	var evt_type: U32 = 0
	var _common: SDLCommonEvent = SDLCommonEvent
