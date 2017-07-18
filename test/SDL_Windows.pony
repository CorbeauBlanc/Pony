use "collections"
use "strings"
use "lib:SDL2"

primitive SDLWin
type SdlWindow is Pointer[SDLWin]

/*
	Window flags
*/
primitive WFULLSCREEN is SdlFlag
	fun value(): U32 => 0x00000001
primitive WOPENGL is SdlFlag
	fun value(): U32 => 0x00000002
primitive WSHOWN is SdlFlag
	fun value(): U32 => 0x00000004
primitive WHIDDEN is SdlFlag
	fun value(): U32 => 0x00000008
primitive WBORDERLESS is SdlFlag
	fun value(): U32 => 0x00000010
primitive WRESIZABLE is SdlFlag
	fun value(): U32 => 0x00000020
primitive WMINIMIZED is SdlFlag
	fun value(): U32 => 0x00000040
primitive WMAXIMIZED is SdlFlag
	fun value(): U32 => 0x00000080
primitive WINPUTGRABBED is SdlFlag
	fun value(): U32 => 0x00000100
primitive WINPUTFOCUS is SdlFlag
	fun value(): U32 => 0x00000200
primitive WMOUSEFOCUS is SdlFlag
	fun value(): U32 => 0x00000400
primitive WFULLSCREENDESKTOP is SdlFlag
	fun value(): U32 => WFULLSCREEN.value() or 0x00001000
primitive WFOREIGN is SdlFlag
	fun value(): U32 => 0x00000800
primitive WALLOWHIGHDPI is SdlFlag
	fun value(): U32 => 0x00002000
primitive WMOUSECAPTURE is SdlFlag
	fun value(): U32 => 0x00004000
primitive WALWAYSONTOP is SdlFlag
	fun value(): U32 => 0x00008000
primitive WSKIPTASKBAR is SdlFlag
	fun value(): U32 => 0x00010000
primitive WUTILITY is SdlFlag
	fun value(): U32 => 0x00020000
primitive WTOOLTIP is SdlFlag
	fun value(): U32 => 0x00040000
primitive WPOPUPMENU is SdlFlag
	fun value(): U32 => 0x00080000
