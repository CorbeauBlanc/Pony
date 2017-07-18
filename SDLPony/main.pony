use "collections"
use "strings"
use "lib:SDL2"

use @SDL_CreateWindow[Pointer[SDLWin]](title: Pointer[U8] tag, x: U64, y: U64, w: U64, h: U64, flags: U32)
use @SDL_Delay[None](ms: U32)
use @SDL_DestroyWindow[None](window: Pointer[SDLWin])
use @SDL_GetError[Pointer[U8]]()
use @SDL_HideWindow[None](window: Pointer[SDLWin])
use @SDL_Init[U64](flags: U32)
use @SDL_MaximizeWindow[None](window: Pointer[SDLWin])
use @SDL_MinimizeWindow[None](window: Pointer[SDLWin])
use @SDL_Quit[None]()
use @SDL_RaiseWindow[None](window: Pointer[SDLWin])
use @SDL_RestoreWindow[None](window: Pointer[SDLWin])
use @SDL_SetWindowFullscreen[U64](window: Pointer[SDLWin], flags: U32)
use @SDL_SetWindowPosition[None](window: Pointer[SDLWin], x: U64, y: U64)
use @SDL_SetWindowSize[None](window: Pointer[SDLWin], w: U64, h: U64)
use @SDL_ShowWindow[None](window: Pointer[SDLWin])

actor Main

	fun create_window(title: String val, x: U64, y: U64, w: U64, h: U64, flags: SdlFlag): SdlWindow =>
		@SDL_CreateWindow(title.cstring(), x, y, w, h, flags.value())

	fun delay(ms: U32 val) =>
		@SDL_Delay(ms)

	fun destroy_window(window: SdlWindow) =>
		@SDL_DestroyWindow(window)

	fun get_error(): String val =>
		recover String.from_cstring(@SDL_GetError()) end

	fun hide_window(window: SdlWindow) =>
		@SDL_HideWindow(window)

	fun init(flags: SdlFlag val): U64 =>
		@SDL_Init(flags.value())

	fun maximize_window(window: SdlWindow) =>
		@SDL_MaximizeWindow(window)

	fun minimize_window(window: SdlWindow) =>
		@SDL_MinimizeWindow(window)

	fun quit() =>
		@SDL_Quit()

	fun raise_window(window: SdlWindow) =>
		@SDL_RaiseWindow(window)

	fun restore_window(window: SdlWindow) =>
		@SDL_RestoreWindow(window)

	fun set_window_fullscreen(window: SdlWindow, flags: SdlFlag val) =>
		@SDL_SetWindowFullscreen(window, flags.value())

	fun set_window_position(window: SdlWindow, x: U64, y: U64) =>
		@SDL_SetWindowPosition(window, x, y)

	fun set_window_size(window: SdlWindow, w: U64, h: U64) =>
		@SDL_SetWindowSize(window, w, h)

	fun show_window(window: SdlWindow) =>
		@SDL_ShowWindow(window)

	new create(env: Env) =>
		init(VIDEO or AUDIO)
		let win = create_window("test", 0, 0, 500, 500, UndefinedSdlFlag(0))
		delay(3000)
		destroy_window(win)
		quit()
