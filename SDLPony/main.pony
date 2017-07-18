use "collections"
use "strings"
use "lib:SDL2"

use @SDL_CreateWindow[Pointer[SDLWin]](title: Pointer[U8] tag, x: U64, y: U64, w: U64, h: U64, flags: U32)
use @SDL_Delay[None](ms: U32)
use @SDL_Init[U64](flags: U32)
use @SDL_Quit[None]()

actor Main

	fun sdl_CreateWindow(title: String val, x: U64, y: U64, w: U64, h: U64, flags: SdlFlag): SdlWindow =>
		@SDL_CreateWindow(title.cstring(), x, y, w, h, flags.value())

	fun sdl_Delay(ms: U32 val) =>
		@SDL_Delay(ms)

	fun sdl_Init(flags: SdlFlag val): U64 =>
		@SDL_Init(flags.value())

	fun sdl_Quit() =>
		@SDL_Quit()

	new create(env: Env) =>
		sdl_Init(VIDEO or AUDIO)
		let win = sdl_CreateWindow("test", 0, 0, 500, 500, UndefinedSdlFlag(0))
		sdl_Delay(3000)
		sdl_Quit()
