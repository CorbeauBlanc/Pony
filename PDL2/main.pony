use "collections"
use "strings"

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
