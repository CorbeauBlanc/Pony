use "collections"
use "strings"
use "lib:SDL2"

use @SDL_Delay[None](ms: U32)
use @SDL_GetError[Pointer[U8]]()
use @SDL_Init[I32](flags: U32 tag)
use @SDL_Quit[None]()
use @memcpy[SDLPtrEvent](ptr: MaybePointer[SDLEvent], ptr2: Pointer[U8], size: U32)


primitive SDL

	fun allocFormat(pixel_format: U32): SDLPixelFormat =>
		@SDL_AllocFormat(pixel_format)

	fun blitSurface(src: SDLSurface, srcrect: SDLPtrRect, dst: SDLSurface, dstrect: SDLPtrRect): I32 =>
		@SDL_UpperBlit(src, srcrect, dst, dstrect)

	fun createRenderer(window: SDLWindow, index: I32, flags: SDLFlag val): SDLRenderer =>
		@SDL_CreateRenderer(window, index, flags())

	fun createRGBSurface(width: I32, height: I32, depth: I32,
												rMask: U32, gMask: U32, bMask: U32, aMask: U32): Pointer[_Surface] =>
		@SDL_CreateRGBSurface(0, width, height, depth, rMask, gMask, bMask, aMask)

	fun createTexture(renderer: SDLRenderer, format: U32, access: U32, w: I32, h: I32): SDLTexture =>
		@SDL_CreateTexture(renderer, format, access, w, h)

	fun createTextureFromSurface(renderer: SDLRenderer, surface: SDLSurface): SDLTexture =>
		@SDL_CreateTextureFromSurface(renderer, surface)

	fun createWindow(title: String, x: I32, y: I32, w: I32, h: I32, flags: SDLFlag val): SDLWindow =>
		@SDL_CreateWindow(title.cstring(), x, y, w, h, flags())

	fun delay(ms: U32) =>
		@SDL_Delay(ms)

	fun destroyRenderer(renderer: SDLRenderer) =>
		@SDL_DestroyRenderer(renderer)

	fun destroyTexture(texture: SDLTexture) =>
		@SDL_DestroyTexture(texture)

	fun destroyWindow(window: SDLWindow) =>
		@SDL_DestroyWindow(window)

	fun fillRect(dst: SDLSurface, rect: SDLPtrRect, color: U32): I32 =>
		@SDL_FillRect(dst, rect, color)

	fun freeFormat(format: SDLPixelFormat) =>
		@SDL_FreeFormat(format)

	fun freeSurface(surface: SDLSurface) =>
		@SDL_FreeSurface(surface)

	fun getError(): String val =>
		recover String.from_cstring(@SDL_GetError()) end

	fun getWindowPixelFormat(window: SDLWindow): U32 =>
		@SDL_GetWindowPixelFormat(window)

	fun getWindowSurface(window: SDLWindow): SDLSurface =>
		@SDL_GetWindowSurface(window)

	fun hideWindow(window: SDLWindow) =>
		@SDL_HideWindow(window)

	fun init(flags: SDLFlag val): I32 =>
		@SDL_Init(flags())

	fun loadBMP(file: String): SDLSurface =>
		let mode: String = "rb"
		@SDL_LoadBMP_RW(@SDL_RWFromFile(file.cstring(), mode.cstring()), 1)

	fun lockSurface(surface: SDLSurface) =>
		@SDL_LockSurface(surface)

	fun mapRGB(format: SDLPixelFormat, r: U8, g: U8, b:U8): U32 =>
		@SDL_MapRGB(format, r, g, b)

	fun mapRGBA(format: SDLPixelFormat, r: U8, g: U8, b:U8, a: U8): U32 =>
		@SDL_MapRGBA(format, r, g, b, a)

	fun maximizeWindow(window: SDLWindow) =>
		@SDL_MaximizeWindow(window)

	fun minimizeWindow(window: SDLWindow) =>
		@SDL_MinimizeWindow(window)

	fun quit() =>
		@SDL_Quit()

	fun raiseWindow(window: SDLWindow) =>
		@SDL_RaiseWindow(window)

	fun renderClear(renderer: SDLRenderer): I32 =>
		@SDL_RenderClear(renderer)

	fun renderCopy(renderer: SDLRenderer, texture: SDLTexture,
											srcrect: SDLPtrRect, dstrect: SDLPtrRect): I32 =>
		@SDL_RenderCopy(renderer, texture, srcrect, dstrect)

	fun renderCopyEx(renderer: SDLRenderer, texture: SDLTexture,
											srcrect: SDLPtrRect, dstrect: SDLPtrRect, angle: F64,
											center: SDLPtrPoint, flip: SDLFlag): I32 =>
		@SDL_RenderCopyEx(renderer, texture, srcrect, dstrect, angle, center, flip())

	fun renderPresent(renderer: SDLRenderer) =>
		@SDL_RenderPresent(renderer)

	fun restoreWindow(window: SDLWindow) =>
		@SDL_RestoreWindow(window)

	fun setClipRect(surface: SDLSurface, rect: SDLRect): Bool =>
		if @SDL_SetClipRect(surface, rect) == 1 then
			true
		else
			false
		end

	fun setRenderDrawColor(renderer: SDLRenderer,
													r: U8, g: U8, b:U8, a: U8): I32 =>
		@SDL_SetRenderDrawColor(renderer, r, g, b, a)

	fun setSurfaceAlpha_mod(surface: SDLSurface, alpha: U8) =>
		@SDL_SetSurfaceAlphaMod(surface, alpha)

	fun setSurfaceBlend_mode(surface: SDLSurface, blendMode: SDLFlag) =>
		@SDL_SetSurfaceBlendMode(surface, blendMode())

	fun setSurfaceColorMod(surface: SDLSurface, r: U8, g: U8, b: U8) =>
		@SDL_SetSurfaceColorMod[I32](surface, r, g, b)

	fun setTextureAlphaMod(texture: SDLTexture, alpha: U8): I32 =>
		@SDL_SetTextureAlphaMod(texture, alpha)

	fun setTextureBlendMode(texture: SDLTexture, blendMode: SDLFlag) =>
		@SDL_SetTextureBlendMode(texture, blendMode())

	fun setTextureColorMod(texture: SDLTexture, r: U8, g: U8, b: U8) =>
		@SDL_SetTextureColorMod(texture, r, g, b)

	fun set_WindowFullscreen(window: SDLWindow, flags: SDLFlag) =>
		@SDL_SetWindowFullscreen(window, flags())

	fun set_WindowPosition(window: SDLWindow, x: I32, y: I32) =>
		@SDL_SetWindowPosition(window, x, y)

	fun set_WindowSize(window: SDLWindow, w: I32, h: I32) =>
		@SDL_SetWindowSize(window, w, h)

	fun showWindow(window: SDLWindow) =>
		@SDL_ShowWindow(window)

	fun unlockSurface(surface: SDLSurface) =>
		@SDL_UnlockSurface(surface)

	fun pollEvent(event: MaybePointer[SDLEvent]): I32 =>
		@SDL_PollEvent(event)

	fun waitEvent(event: MaybePointer[SDLEvent]): I32 =>
		@SDL_WaitEvent(event)

	fun castEvent(event: MaybePointer[SDLEvent]): SDLPtrEvent =>
		@memcpy(ptr, Pointer[U8], 0)


actor Main
	new create(env: Env) =>
		SDL.init(VIDEO or AUDIO)
		let win = SDL.createWindow("test", 0, 0, 500, 500, NULLFLAG)
		let ren = SDL.createRenderer(win, -1, RENDERERACCELERATED)
		var surf: SDLSurface = SDL.loadBMP("pony_id.bmp")

		var text = SDL.createTextureFromSurface(ren, surf)
		let rect = SDLRect(0, 0, 200, 200)
		SDL.renderCopy(ren, text, SDLPtrRect.none(), SDLPtrRect(rect))
		SDL.renderPresent(ren)

		var event: SDLEvent = SDLEvent
		var ptr: MaybePointer[SDLEvent] = MaybePointer[SDLEvent](event)

		while event.evt_type != QUIT() do
			SDL.waitEvent(ptr)
			if event.evt_type == MOUSEMOTION() then
				try
					var mouse: SDLMouseMotionEvent = (castEvent(ptr) as MaybePointer[SDLMouseMotionEvent]).apply()?
					env.out.print("x: " + mouse.x.string() + " | y: " + mouse.y.string())
				end
			end
		end
		SDL.destroyWindow(win)
		SDL.quit()
