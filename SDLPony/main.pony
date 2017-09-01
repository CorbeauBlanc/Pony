use "collections"
use "strings"
use "lib:SDL2"

use @SDL_BlitSurface[I64](src: SDLSurface, srcrect: SDLRect, dst: SDLSurface, dstrect: SDLSurface)
use @SDL_CreateRGBSurface[SDLSurface](flags: U32, width: I64, height: I64, depth: I64,
																			rMask: U32, gMask: U32, bMask: U32, aMask: U32)
use @SDL_CreateWindow[SDLWindow]	(title: Pointer[U8] tag, x: I64, y: I64, w: I64, h: I64, flags: U32)
use @SDL_Delay[None](ms: U32)
use @SDL_DestroyWindow[None](window: SDLWindow)
use @SDL_FillRect[I64](dst: SDLSurface, rect: SDLRect, color: U32)
use @SDL_FreeSurface[None](surface: SDLSurface)
use @SDL_GetClipRect[None](surface: SDLSurface, rect: SDLRect)
use @SDL_GetError[Pointer[U8]]()
use @SDL_HideWindow[None](window: SDLWindow)
use @SDL_LoadBMP[SDLSurface](file: Pointer[U8] tag)
use @SDL_LockSurface[I64](surface: SDLSurface)
use @SDL_Init[I64](flags: U32)
use @SDL_MaximizeWindow[None](window: SDLWindow)
use @SDL_MinimizeWindow[None](window: SDLWindow)
use @SDL_Quit[None]()
use @SDL_RaiseWindow[None](window: SDLWindow)
use @SDL_RestoreWindow[None](window: SDLWindow)
use @SDL_SetClipRect[U8](surface: SDLSurface, rect: SDLRect)
use @SDL_SetSurfaceAlphaMod[I64](surface: SDLSurface, alpha: U8)
use @SDL_SetSurfaceBlendMode[I64](surface: SDLSurface, blendMode: SDLFlag)
use @SDL_SetSurfaceColorMod[I64](surface: SDLSurface, r: U8, g: U8, b: U8)
use @SDL_SetWindowFullscreen[I64](window: SDLWindow, flags: U32)
use @SDL_SetWindowPosition[None](window: SDLWindow, x: I64, y: I64)
use @SDL_SetWindowSize[None](window: SDLWindow, w: I64, h: I64)
use @SDL_ShowWindow[None](window: SDLWindow)
use @SDL_UnlockSurface[I64](surface: SDLSurface)


actor Main

	fun blit_surface(src: SDLSurface, srcrect: SDLRect, dst: SDLSurface, dstrect: SDLSurface): I64 =>
		@SDL_BlitSurface(src, srcrect, dst, dstrect)

	fun create_RGB_surface(flags: SDLFlag, width: I64, height: I64, depth: I64,
												rMask: U32, gMask: U32, bMask: U32, aMask: U32): Pointer[_Surface] =>
		@SDL_CreateRGBSurface(flags.value(), width, height, depth, rMask, gMask, bMask, aMask)

	fun create_window(title: String, x: I64, y: I64, w: I64, h: I64, flags: SDLFlag): SDLWindow =>
		@SDL_CreateWindow(title.cstring(), x, y, w, h, flags.value())

	fun delay(ms: U32) =>
		@SDL_Delay(ms)

	fun destroy_window(window: SDLWindow) =>
		@SDL_DestroyWindow(window)

	fun fill_rect(dst: SDLSurface, rect: SDLRect, color: U32): I64 =>
		@SDL_FillRect(dst, rect, color)

	fun free_surface(surface: SDLSurface) =>
		@SDL_FreeSurface(surface)

	fun get_error(): String box =>
		recover String.from_cstring(@SDL_GetError()) end

	fun get_clip_rect(surface: SDLSurface, rect: SDLRect) =>
		@SDL_GetClipRect(surface, rect)

	fun hide_window(window: SDLWindow) =>
		@SDL_HideWindow(window)

	fun init(flags: SDLFlag val): I64 =>
		@SDL_Init(flags.value())

	fun load_BMP(file: String): SDLSurface =>
		@SDL_LoadBMP(file.cstring())

	fun lock_surface(surface: SDLSurface) =>
		@SDL_LockSurface(surface)

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

	fun set_clip_rect(surface: SDLSurface, rect: SDLRect): Bool =>
		if @SDL_SetClipRect(surface, rect) == 1 then
			true
		else
			false
		end

	fun set_surface_alpha_mod(surface: SDLSurface, alpha: U8) =>
		@SDL_SetSurfaceAlphaMod(surface, alpha)

	fun set_surface_blend_mode(surface: SDLSurface, blendMode: SDLFlag) =>
		@SDL_SetSurfaceBlendMode(surface, blendMode.value())

	fun set_surface_color_mod(surface: SDLSurface, r: U8, g: U8, b: U8) =>
		@SDL_SetSurfaceColorMod[I64](surface, r, g, b)

	fun set_window_fullscreen(window: SDLWindow, flags: SDLFlag) =>
		@SDL_SetWindowFullscreen(window, flags.value())

	fun set_window_position(window: SDLWindow, x: I64, y: I64) =>
		@SDL_SetWindowPosition(window, x, y)

	fun set_window_size(window: SDLWindow, w: I64, h: I64) =>
		@SDL_SetWindowSize(window, w, h)

	fun show_window(window: SDLWindow) =>
		@SDL_ShowWindow(window)

	fun unlock_surface(surface: SDLSurface) =>
		@SDL_UnlockSurface(surface)

	new create(env: Env) =>
		init(VIDEO or AUDIO)
		let win = create_window("test", 0, 0, 500, 500, UdefSDLFlag(0))
		var surf: SDLSurface = create_RGB_surface(UdefSDLFlag(0), 10, 10, 32, 0, 0, 0, 0)
		var rect: SDLRect = SDLRect
		set_clip_rect(surf, rect)
		rect.x = 5
		env.out.print(rect.x.string())
		get_clip_rect(surf, rect)
		env.out.print(rect.x.string())
		delay(1000)
		destroy_window(win)
		quit()
