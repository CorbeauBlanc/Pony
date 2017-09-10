use "collections"
use "strings"

primitive _Window
type SDLWindow is Pointer[_Window]

/*
	Window flags
*/
primitive WFULLSCREEN is SDLFlag
	fun value(): U32 => 0x00000001
primitive WOPENGL is SDLFlag
	fun value(): U32 => 0x00000002
primitive WSHOWN is SDLFlag
	fun value(): U32 => 0x00000004
primitive WHIDDEN is SDLFlag
	fun value(): U32 => 0x00000008
primitive WBORDERLESS is SDLFlag
	fun value(): U32 => 0x00000010
primitive WRESIZABLE is SDLFlag
	fun value(): U32 => 0x00000020
primitive WMINIMIZED is SDLFlag
	fun value(): U32 => 0x00000040
primitive WMAXIMIZED is SDLFlag
	fun value(): U32 => 0x00000080
primitive WINPUTGRABBED is SDLFlag
	fun value(): U32 => 0x00000100
primitive WINPUTFOCUS is SDLFlag
	fun value(): U32 => 0x00000200
primitive WMOUSEFOCUS is SDLFlag
	fun value(): U32 => 0x00000400
primitive WFULLSCREENDESKTOP is SDLFlag
	fun value(): U32 => WFULLSCREEN.value() or 0x00001000
primitive WFOREIGN is SDLFlag
	fun value(): U32 => 0x00000800
primitive WALLOWHIGHDPI is SDLFlag
	fun value(): U32 => 0x00002000
primitive WMOUSECAPTURE is SDLFlag
	fun value(): U32 => 0x00004000
primitive WALWAYSONTOP is SDLFlag
	fun value(): U32 => 0x00008000
primitive WSKIPTASKBAR is SDLFlag
	fun value(): U32 => 0x00010000
primitive WUTILITY is SDLFlag
	fun value(): U32 => 0x00020000
primitive WTOOLTIP is SDLFlag
	fun value(): U32 => 0x00040000
primitive WPOPUPMENU is SDLFlag
	fun value(): U32 => 0x00080000
