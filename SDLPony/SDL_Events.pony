use "collections"

use @SDL_PollEvent[I32](event: SDLPtrEvent)
use @SDL_WaitEvent[I32](event: SDLPtrEvent)


type SDLJoystickID is I32
type SDLTouchID is I64
type SDLFingerID is I64
type SDLGestureID is I64

struct SDLKeysym
	var scancode: SDLScancode = 0
	var sym: SDLKeycode = 0
	var mod: U16 = 0
	var unused: U32 = 0


primitive FIRSTEVENT
	fun apply(): U32 => 0
primitive QUIT
	fun apply(): U32 => 256
primitive APPTERMINATING
	fun apply(): U32 => 257
primitive APPLOWMEMORY
	fun apply(): U32 => 258
primitive APPWILLENTERBACKGROUND
	fun apply(): U32 => 259
primitive APPDIDENTERBACKGROUND
	fun apply(): U32 => 260
primitive APPWILLENTERFOREGROUND
	fun apply(): U32 => 261
primitive APPDIDENTERFOREGROUND
	fun apply(): U32 => 262
primitive WINDOWEVENT
	fun apply(): U32 => 512
primitive SYSWMEVENT
	fun apply(): U32 => 513
primitive KEYDOWN
	fun apply(): U32 => 768
primitive KEYUP
	fun apply(): U32 => 769
primitive TEXTEDITING
	fun apply(): U32 => 770
primitive TEXTINPUT
	fun apply(): U32 => 771
primitive KEYMAPCHANGED
	fun apply(): U32 => 772
primitive MOUSEMOTION
	fun apply(): U32 => 1024
primitive MOUSEBUTTONDOWN
	fun apply(): U32 => 1025
primitive MOUSEBUTTONUP
	fun apply(): U32 => 1026
primitive MOUSEWHEEL
	fun apply(): U32 => 1027
primitive JOYAXISMOTION
	fun apply(): U32 => 1536
primitive JOYBALLMOTION
	fun apply(): U32 => 1537
primitive JOYHATMOTION
	fun apply(): U32 => 1538
primitive JOYBUTTONDOWN
	fun apply(): U32 => 1539
primitive JOYBUTTONUP
	fun apply(): U32 => 1540
primitive JOYDEVICEADDED
	fun apply(): U32 => 1541
primitive JOYDEVICEREMOVED
	fun apply(): U32 => 1542
primitive CONTROLLERAXISMOTION
	fun apply(): U32 => 1616
primitive CONTROLLERBUTTONDOWN
	fun apply(): U32 => 1617
primitive CONTROLLERBUTTONUP
	fun apply(): U32 => 1618
primitive CONTROLLERDEVICEADDED
	fun apply(): U32 => 1619
primitive CONTROLLERDEVICEREMOVED
	fun apply(): U32 => 1620
primitive CONTROLLERDEVICEREMAPPED
	fun apply(): U32 => 1621
primitive FINGERDOWN
	fun apply(): U32 => 1792
primitive FINGERUP
	fun apply(): U32 => 1793
primitive FINGERMOTION
	fun apply(): U32 => 1794
primitive DOLLARGESTURE
	fun apply(): U32 => 2048
primitive DOLLARRECORD
	fun apply(): U32 => 2049
primitive MULTIGESTURE
	fun apply(): U32 => 2050
primitive CLIPBOARDUPDATE
	fun apply(): U32 => 2304
primitive DROPFILE
	fun apply(): U32 => 4096
primitive DROPTEXT
	fun apply(): U32 => 4097
primitive DROPBEGIN
	fun apply(): U32 => 4098
primitive DROPCOMPLETE
	fun apply(): U32 => 4099
primitive AUDIODEVICEADDED
	fun apply(): U32 => 4352
primitive AUDIODEVICEREMOVED
	fun apply(): U32 => 4353
primitive RENDERTARGETSRESET
	fun apply(): U32 => 8192
primitive RENDERDEVICERESET
	fun apply(): U32 => 8193
primitive USEREVENT
	fun apply(): U32 => 32768
primitive LASTEVENT
	fun apply(): U32 => 65535


struct SDLCommonEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var _padding: U32 = 0
	var _padding2: U8 = 0
	var _padding3: U8 = 0
	var _padding4: U8 = 0
	var _padding5: U8 = 0
	var _padding6: U8 = 0
	var _padding7: U16 = 0
	var _padding8: I32 = 0


struct SDLWindowEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var windowID: U32 = 0
	var event: U8 = 0
	var _padding: U8 = 0
	var data1: I32 = 0
	var data2: I32 = 0
	var _padding2: U8 = 0
	var _padding3: U16 = 0
	var _padding4: I32 = 0


struct SDLKeyboardEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var windowID: U32 = 0
	var state: U8 = 0
	var krepeat: U8 = 0
	var _padding: U8 = 0
	var _padding2: U8 = 0
	var keysym: SDLKeysym = SDLKeysym
	var _padding3: U16 = 0
	var _padding4: I32 = 0


struct SDLTextEditingEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var windowID: U32 = 0
	var text: Pointer[U8] = Pointer[U8]
	var start: I32 = 0
	var length: I32 = 0
	var _padding: U8 = 0
	var _padding2: U8 = 0
	var _padding3: U16 = 0
	var _padding4: I32 = 0


struct SDLTextInputEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var windowID: U32 = 0
	var text: Pointer[U8] = Pointer[U8]
	var _padding: U8 = 0
	var _padding2: U8 = 0
	var _padding3: U8 = 0
	var _padding4: U8 = 0
	var _padding5: U16 = 0
	var _padding6: I32 = 0


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
	var _padding: I32 = 0


struct SDLMouseButtonEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var windowID: U32 = 0
	var which: U32 = 0
	var button: U8 = 0
	var state: U8 = 0
	var clicks: U8 = 0
	var _padding: U8 = 0
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
	var _padding: U8 = 0
	var _padding2: U16 = 0
	var _padding3: I32 = 0


struct SDLJoyAxisEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var which: SDLJoystickID = 0
	var axis: U8 = 0
	var _padding: U8 = 0
	var _padding2: U8 = 0
	var _padding3: U8 = 0
	var value: I16 = 0
	var _padding4: U16 = 0
	var _padding5: I32 = 0


struct SDLJoyBallEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var which: SDLJoystickID = 0
	var ball: U8 = 0
	var _padding: U8 = 0
	var _padding2: U8 = 0
	var _padding3: U8 = 0
	var xrel: I16 = 0
	var yrel: I16 = 0
	var _padding4: I32 = 0


struct SDLJoyHatEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var which: SDLJoystickID = 0
	var hat: U8 = 0
	var value: U8 = 0
	var _padding: U8 = 0
	var _padding2: U8 = 0
	var _padding3: U8 = 0
	var _padding4: U16 = 0
	var _padding5: I32 = 0


struct SDLJoyButtonEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var which: SDLJoystickID = 0
	var button: U8 = 0
	var state: U8 = 0
	var _padding: U8 = 0
	var _padding2: U8 = 0
	var _padding3: U8 = 0
	var _padding4: U16 = 0
	var _padding5: I32 = 0


struct SDLJoyDeviceEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var which: I32 = 0
	var _padding: U8 = 0
	var _padding2: U8 = 0
	var _padding3: U8 = 0
	var _padding4: U8 = 0
	var _padding5: U8 = 0
	var _padding6: U16 = 0
	var _padding7: I32 = 0


struct SDLControllerAxisEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var which: SDLJoystickID = 0
	var axis: U8 = 0
	var _padding: U8 = 0
	var _padding2: U8 = 0
	var _padding3: U8 = 0
	var value: I16 = 0
	var _padding4: U16 = 0
	var _padding5: I32 = 0


struct SDLControllerButtonEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var which: SDLJoystickID = 0
	var button: U8 = 0
	var state: U8 = 0
	var _padding: U8 = 0
	var _padding2: U8 = 0
	var _padding3: U8 = 0
	var _padding4: U16 = 0
	var _padding5: I32 = 0


struct SDLControllerDeviceEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var which: I32 = 0
	var _padding: U8 = 0
	var _padding2: U8 = 0
	var _padding3: U8 = 0
	var _padding4: U8 = 0
	var _padding5: U8 = 0
	var _padding6: U16 = 0
	var _padding7: I32 = 0


struct SDLAudioDeviceEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var which: U32 = 0
	var iscapture: U8 = 0
	var _padding: U8 = 0
	var _padding2: U8 = 0
	var _padding3: U8 = 0
	var _padding4: U8 = 0
	var _padding5: U16 = 0
	var _padding6: I32 = 0


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
	var _padding: I32 = 0


struct SDLMultiGestureEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var touchId: SDLTouchID = 0
	var dTheta: F32 = 0
	var dDist: F32 = 0
	var x: F32 = 0
	var y: F32 = 0
	var numFingers: U16 = 0
	var _padding: U16 = 0
	var _padding2: I32 = 0


struct SDLDollarGestureEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var touchId: SDLTouchID = 0
	var gestureId: SDLGestureID = 0
	var numFingers: U32 = 0
	var evt_error: F32 = 0
	var x: F32 = 0
	var y: F32 = 0
	var _padding: U16 = 0
	var _padding2: I32 = 0


struct SDLDropEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var file: Pointer[U8] = Pointer[U8]
	var windowID: U32 = 0
	var _padding: U8 = 0
	var _padding2: U8 = 0
	var _padding3: U8 = 0
	var _padding4: U8 = 0
	var _padding5: U16 = 0
	var _padding6: I32 = 0


struct SDLQuitEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var _padding: U32 = 0
	var _padding2: U8 = 0
	var _padding3: U8 = 0
	var _padding4: U8 = 0
	var _padding5: U8 = 0
	var _padding6: U8 = 0
	var _padding7: U16 = 0
	var _padding8: I32 = 0


struct SDLOSEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var _padding: U32 = 0
	var _padding2: U8 = 0
	var _padding3: U8 = 0
	var _padding4: U8 = 0
	var _padding5: U8 = 0
	var _padding6: U8 = 0
	var _padding7: U16 = 0
	var _padding8: I32 = 0


struct SDLUserEvent
	var evt_type: U32 = 0
	var timestamp: U32 = 0
	var windowID: U32 = 0
	var code: I32 = 0
	var data1: Pointer[U8] = Pointer[U8]
	var data2: Pointer[U8] = Pointer[U8]
	var _padding: U8 = 0
	var _padding2: U8 = 0
	var _padding3: U16 = 0
	var _padding4: I32 = 0


struct SDLEvent
	var evt_type: U32 = 0
	var axis: U8 = 0
	var ball: U8 = 0
	var button: U8 = 0
	var clicks: U8 = 0
	var code: I32 = 0
	var data1: (I32 | Pointer[U8]) = 0
	var data2: (I32 | Pointer[U8]) = 0
	var dDist: F32 = 0
	var direction: U32 = 0
	var dTheta: F32 = 0
	var dx: F32 = 0
	var dy: F32 = 0
	var event: U8 = 0
	var evt_error: F32 = 0
	var file: Pointer[U8] = Pointer[U8]
	var fingerId: SDLFingerID = 0
	var gestureId: SDLGestureID = 0
	var hat: U8 = 0
	var iscapture: U8 = 0
	var keysym: SDLKeysym = SDLKeysym
	var krepeat: U8 = 0
	var length: I32 = 0
	var mod: U16 = 0
	var numFingers: (U32 | U16) = U32(0)
	var pressure: F32 = 0
	var scancode: SDLScancode = 0
	var start: I32 = 0
	var state: (U8 | U32) = U32(0)
	var sym: SDLKeycode = 0
	var text: Pointer[U8] = Pointer[U8]
	var timestamp: U32 = 0
	var touchId: SDLTouchID = 0
	var unused: U32 = 0
	var value: (I16 | U8) = I16(0)
	var which: (I32 | U32 | SDLJoystickID) = I32(0)
	var windowID: U32 = 0
	var x: (F32 | I32) = F32(0)
	var xrel: (I16 | I32) = I32(0)
	var y: (I16 | I32) = I32(0)
	var yrel: (I16 | I32) = I32(0)


type SDLPtrEvent is MaybePointer[SDLEvent]
