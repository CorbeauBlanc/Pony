use "collections"
use "strings"
use "lib:SDL2"

use @SDL_AllocFormat[SDLPixelFormat](pixel_format: U32)
use @SDL_BlitSurface[I64](src: SDLSurface, srcrect: SDLPtrRect,
													dst: SDLSurface, dstrect: SDLPtrRect)
use @SDL_CreateRenderer[SDLRenderer](window: SDLWindow, index: I64, flags: U32)
use @SDL_CreateRGBSurface[SDLSurface](flags: U32, width: I64, height: I64, depth: I64,
																			rMask: U32, gMask: U32, bMask: U32, aMask: U32)
use @SDL_CreateTexture[SDLTexture](renderer: SDLRenderer, format: U32, access: U32, w: I64, h: I64)
use @SDL_CreateTextureFromSurface[SDLTexture](renderer: SDLRenderer, surface: SDLSurface)
use @SDL_CreateWindow[SDLWindow](title: Pointer[U8] tag, x: I64, y: I64, w: I64, h: I64, flags: U32)
use @SDL_Delay[None](ms: U32)
use @SDL_DestroyRenderer[None](renderer: SDLRenderer)
use @SDL_DestroyTexture[None](texture: SDLTexture)
use @SDL_DestroyWindow[None](window: SDLWindow)
use @SDL_FillRect[I64](dst: SDLSurface, rect: SDLPtrRect, color: U32)
use @SDL_FreeFormat[None](format: SDLPixelFormat)
use @SDL_FreeSurface[None](surface: SDLSurface)
use @SDL_GetClipRect[None](surface: SDLSurface, rect: SDLRect)
use @SDL_GetError[Pointer[U8]]()
use @SDL_GetWindowPixelFormat[U32](window: SDLWindow)
use @SDL_GetWindowSurface[SDLSurface](window: SDLWindow)
use @SDL_HideWindow[None](window: SDLWindow)
use @SDL_LoadBMP_RW[SDLSurface](src: SDLRWops, freesrc: I64)
use @SDL_LockSurface[I64](surface: SDLSurface)
use @SDL_Init[I64](flags: U32)
use @SDL_MapRGB[U32](format: SDLPixelFormat, r: U8, g: U8, b: U8)
use @SDL_MapRGBA[U32](format: SDLPixelFormat, r: U8, g: U8, b: U8, a: U8)
use @SDL_MaximizeWindow[None](window: SDLWindow)
use @SDL_MinimizeWindow[None](window: SDLWindow)
use @SDL_Quit[None]()
use @SDL_RaiseWindow[None](window: SDLWindow)
use @SDL_RenderCopy[I64](renderer: SDLRenderer, texture: SDLTexture,
												rcrect: SDLPtrRect val, dstrect: SDLPtrRect)
use @SDL_RenderCopyEx[I64](renderer: SDLRenderer, texture: SDLTexture,
													srcrect: SDLPtrRect val, dstrect: SDLPtrRect val,
													angle: F64 val, center: SDLPtrPoint val, flip: U32)
use @SDL_RenderPresent[None](renderer: SDLRenderer)
use @SDL_RWFromFile[SDLRWops](file: Pointer[U8] tag, mode: Pointer[U8] tag)
use @SDL_RestoreWindow[None](window: SDLWindow)
use @SDL_SetClipRect[U8](surface: SDLSurface, rect: SDLRect)
use @SDL_SetSurfaceAlphaMod[I64](surface: SDLSurface, alpha: U8)
use @SDL_SetSurfaceBlendMode[I64](surface: SDLSurface, blendMode: U32)
use @SDL_SetSurfaceColorMod[I64](surface: SDLSurface, r: U8, g: U8, b: U8)
use @SDL_SetTextureAlphaMod[I64](texture: SDLTexture, alpha: U8)
use @SDL_SetTextureBlendMode[I64](texture: SDLTexture, blendMode: U32)
use @SDL_SetTextureColorMod[I64](texture: SDLTexture,r: U8, g: U8, b: U8)
use @SDL_SetWindowFullscreen[I64](window: SDLWindow, flags: U32)
use @SDL_SetWindowPosition[None](window: SDLWindow, x: I64, y: I64)
use @SDL_SetWindowSize[None](window: SDLWindow, w: I64, h: I64)
use @SDL_ShowWindow[None](window: SDLWindow)
use @SDL_UnlockSurface[I64](surface: SDLSurface)


actor Main

	fun sdl_AllocFormat(pixel_format: U32): SDLPixelFormat =>
		@SDL_AllocFormat(pixel_format)

	fun sdl_BlitSurface(src: SDLSurface, srcrect: SDLPtrRect, dst: SDLSurface, dstrect: SDLPtrRect): I64 =>
		@SDL_BlitSurface(src, srcrect, dst, dstrect)

	fun sdl_CreateRenderer(window: SDLWindow, index: I64, flags: SDLFlag val): SDLRenderer =>
		@SDL_CreateRenderer(window, index, flags.value())

	fun sdl_CreateRGBSurface(width: I64, height: I64, depth: I64,
												rMask: U32, gMask: U32, bMask: U32, aMask: U32): Pointer[_Surface] =>
		@SDL_CreateRGBSurface(0, width, height, depth, rMask, gMask, bMask, aMask)

	fun sdl_CreateTexture(renderer: SDLRenderer, format: U32, access: U32, w: I64, h: I64): SDLTexture =>
		@SDL_CreateTexture(renderer, format, access, w, h)

	fun sdl_CreateTextureFromSurface(renderer: SDLRenderer, surface: SDLSurface): SDLTexture =>
		@SDL_CreateTextureFromSurface(renderer, surface)

	fun sdl_CreateWindow(title: String, x: I64, y: I64, w: I64, h: I64, flags: SDLFlag val): SDLWindow =>
		@SDL_CreateWindow(title.cstring(), x, y, w, h, flags.value())

	fun sdl_Delay(ms: U32) =>
		@SDL_Delay(ms)

	fun sdl_DestroyRenderer(renderer: SDLRenderer) =>
		@SDL_DestroyRenderer(renderer)

	fun sdl_DestroyTexture(texture: SDLTexture) =>
		@SDL_DestroyTexture(texture)

	fun sdl_DestroyWindow(window: SDLWindow) =>
		@SDL_DestroyWindow(window)

	fun sdl_FillRect(dst: SDLSurface, rect: SDLPtrRect, color: U32): I64 =>
		@SDL_FillRect(dst, rect, color)

	fun sdl_FreeFormat(format: SDLPixelFormat) =>
		@SDL_FreeFormat(format)

	fun sdl_FreeSurface(surface: SDLSurface) =>
		@SDL_FreeSurface(surface)

	fun sdl_GetError(): String box =>
		recover String.from_cstring(@SDL_GetError()) end

	fun sdl_GetWindowPixelFormat(window: SDLWindow): U32 =>
		@SDL_GetWindowPixelFormat(window)

	fun sdl_GetWindowSurface(window: SDLWindow): SDLSurface =>
		@SDL_GetWindowSurface(window)

	fun sdl_HideWindow(window: SDLWindow) =>
		@SDL_HideWindow(window)

	fun sdl_Init(flags: SDLFlag val): I64 =>
		@SDL_Init(flags.value())

	fun sdl_LoadBMP(file: String): SDLSurface =>
		let mode: String = "rb"
		@SDL_LoadBMP_RW(@SDL_RWFromFile(file.cstring(), mode.cstring()), 1)

	fun sdl_LockSurface(surface: SDLSurface) =>
		@SDL_LockSurface(surface)

	fun sdl_MapRGB(format: SDLPixelFormat, r: U8, g: U8, b:U8): U32 =>
		@SDL_MapRGB(format, r, g, b)

	fun sdl_MapRGBA(format: SDLPixelFormat, r: U8, g: U8, b:U8, a: U8): U32 =>
		@SDL_MapRGBA(format, r, g, b, a)

	fun sdl_MaximizeWindow(window: SDLWindow) =>
		@SDL_MaximizeWindow(window)

	fun sdl_MinimizeWindow(window: SDLWindow) =>
		@SDL_MinimizeWindow(window)

	fun sdl_Quit() =>
		@SDL_Quit()

	fun sdl_RaiseWindow(window: SDLWindow) =>
		@SDL_RaiseWindow(window)

	fun sdl_RenderCopy(renderer: SDLRenderer, texture: SDLTexture,
											srcrect: SDLPtrRect val, dstrect: SDLPtrRect): I64 =>
		@SDL_RenderCopy(renderer, texture, srcrect, dstrect)

	fun sdl_RenderCopyEx(renderer: SDLRenderer, texture: SDLTexture,
											srcrect: SDLPtrRect val, dstrect: SDLPtrRect val, angle: F64 val,
											center: SDLPtrPoint val, flip: SDLFlag val): I64 =>
		@SDL_RenderCopyEx(renderer, texture, srcrect, dstrect, angle, center, flip.value())

	fun sdl_RenderPresent(renderer: SDLRenderer) =>
		@SDL_RenderPresent(renderer)

	fun sdl_RestoreWindow(window: SDLWindow) =>
		@SDL_RestoreWindow(window)

	fun sdl_SetClipRect(surface: SDLSurface, rect: SDLRect): Bool =>
		if @SDL_SetClipRect(surface, rect) == 1 then
			true
		else
			false
		end

	fun sdl_SetSurfaceAlpha_mod(surface: SDLSurface, alpha: U8) =>
		@SDL_SetSurfaceAlphaMod(surface, alpha)

	fun sdl_SetSurfaceBlend_mode(surface: SDLSurface, blendMode: SDLFlag) =>
		@SDL_SetSurfaceBlendMode(surface, blendMode.value())

	fun sdl_SetSurfaceColorMod(surface: SDLSurface, r: U8, g: U8, b: U8) =>
		@SDL_SetSurfaceColorMod[I64](surface, r, g, b)

	fun sdl_SetTextureAlphaMod(texture: SDLTexture, alpha: U8): I64 =>
		@SDL_SetTextureAlphaMod(texture, alpha)

	fun sdl_SetTextureBlendMode(texture: SDLTexture, blendMode: SDLFlag) =>
		@SDL_SetTextureBlendMode(texture, blendMode.value())

	fun sdl_SetTextureColorMod(texture: SDLTexture, r: U8, g: U8, b: U8) =>
		@SDL_SetTextureColorMod(texture, r, g, b)

	fun sdl_set_WindowFullscreen(window: SDLWindow, flags: SDLFlag) =>
		@SDL_SetWindowFullscreen(window, flags.value())

	fun sdl_set_WindowPosition(window: SDLWindow, x: I64, y: I64) =>
		@SDL_SetWindowPosition(window, x, y)

	fun sdl_set_WindowSize(window: SDLWindow, w: I64, h: I64) =>
		@SDL_SetWindowSize(window, w, h)

	fun sdl_ShowWindow(window: SDLWindow) =>
		@SDL_ShowWindow(window)

	fun sdl_UnlockSurface(surface: SDLSurface) =>
		@SDL_UnlockSurface(surface)

	new create(env: Env) =>
		sdl_Init(VIDEO or AUDIO)
		let win = sdl_CreateWindow("test", 0, 0, 500, 500, NULLFLAG)
		let ren = sdl_CreateRenderer(win, -1, RENDERERACCELERATED)
		var surf: SDLSurface = sdl_LoadBMP("pony_id.bmp")
/*		var surf: SDLSurface = sdl_CreateRGBSurface(200, 200, 32, 0, 0, 0, 0)
		sdl_FillRect(surf, SDLPtrRect.none(), 12)*/

		var text = sdl_CreateTextureFromSurface(ren, surf)

		sdl_RenderCopy(ren, text, recover SDLPtrRect.none() end, recover SDLPtrRect.none() end)
		sdl_RenderPresent(ren)

		sdl_Delay(1000)
		sdl_DestroyWindow(win)
		sdl_Quit()
