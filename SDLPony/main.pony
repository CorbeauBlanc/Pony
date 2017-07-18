use "collections"
use "strings"
use "lib:SDL2"

use @SDL_BlitSurface[U64](src: SDLSurface, srcrect: SDLRect val, dst: SDLSurface, dstrect: SDLSurface)
use @SDL_CreateRGBSurface[Pointer[_Surface]](flags: U32, width: U64, height: U64, depth: U64,
																						rMask: U32, gMask: U32, bMask: U32, aMask: U32)
use @SDL_CreateWindow[SDLWindow(title: Pointer[U8] tag, x: U64, y: U64, w: U64, h: U64, flags: U32)
use @SDL_Delay[None](ms: U32)
use @SDL_DestroyWindow[None](window: SDLWindow)
use @SDL_GetError[Pointer[U8]]()
use @SDL_HideWindow[None](window: SDLWindow)
use @SDL_Init[U64](flags: U32)
use @SDL_MaximizeWindow[None](window: SDLWindow)
use @SDL_MinimizeWindow[None](window: SDLWindow)
use @SDL_Quit[None]()
use @SDL_RaiseWindow[None](window: SDLWindow)
use @SDL_RestoreWindow[None](window: SDLWindow)
use @SDL_SetClipRect[U8](surface: SDLSurface, rect: SDLRect val)
use @SDL_SetWindowFullscreen[U64](window: SDLWindow, flags: U32)
use @SDL_SetWindowPosition[None](window: SDLWindow, x: U64, y: U64)
use @SDL_SetWindowSize[None](window: SDLWindow, w: U64, h: U64)
use @SDL_ShowWindow[None](window: SDLWindow)

actor Main

	fun blit_surface(src: SDLSurface, srcrect: SDLRect val, dst: SDLSurface, dstrect: SDLSurface): U64 =>
		@SDL_BlitSurface(src, srcrect, dst, dstrect)

	fun create_RGB_surface(flags: SDLFlag, width: U64, height: U64, depth: U64,
												rMask: U32, gMask: U32, bMask: U32, aMask: U32): Pointer[_Surface] =>
		@SDL_CreateRGBSurface(flags.value(), width, height, depth, rMask, gMask, bMask, aMask)

	fun create_window(title: String val, x: U64, y: U64, w: U64, h: U64, flags: SDLFlag): SDLWindow =>
		@SDL_CreateWindow(title.cstring(), x, y, w, h, flags.value())

	fun delay(ms: U32 val) =>
		@SDL_Delay(ms)

	fun destroy_window(window: SDLWindow) =>
		@SDL_DestroyWindow(window)

	fun get_error(): String val =>
		recover String.from_cstring(@SDL_GetError()) end

	fun hide_window(window: SDLWindow) =>
		@SDL_HideWindow(window)

	fun init(flags: SDLFlag val): U64 =>
		@SDL_Init(flags.value())

	fun maximize_window(window: SDLWindow) =>
		@SDL_MaximizeWindow(window)

	fun minimize_window(window: SDLWindow) =>
		@SDL_MinimizeWindow(window)

	fun quit() =>
		@SDL_Quit()

	fun raise_window(window: SDLWindow) =>
		@SDL_RaiseWindow(window)

	fun restore_window(window: SDLWindow) =>
		@SDL_RestoreWindow(window)

	fun set_clip_rect(surface: SDLSurface, rect: SDLRect val): Bool =>
		if @SDL_SetClipRect(surface, rect) == 1 then
			true
		else
			false
		end

	fun set_window_fullscreen(window: SDLWindow, flags: SDLFlag val) =>
		@SDL_SetWindowFullscreen(window, flags.value())

	fun set_window_position(window: SDLWindow, x: U64, y: U64) =>
		@SDL_SetWindowPosition(window, x, y)

	fun set_window_size(window: SDLWindow, w: U64, h: U64) =>
		@SDL_SetWindowSize(window, w, h)

	fun show_window(window: SDLWindow) =>
		@SDL_ShowWindow(window)

	new create(env: Env) =>
		init(VIDEO or AUDIO)
		let win = create_window("test", 0, 0, 500, 500, UndefinedSDLFlag(0))

		delay(3000)
		destroy_window(win)
		quit()
