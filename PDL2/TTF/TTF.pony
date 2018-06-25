use "collections"
use "strings"
use "lib:SDL2"

use @TTF_Init[I32]()
use @TTF_WasInit[I32]()
use @TTF_Quit[None]()


primitive TTF

	fun init(): I32 =>
		@TTF_Init()

	fun wasInit(): I32 =>
		@TTF_WasInit()

	fun quit() =>
		@TTF_Quit()

	fun openFont(file: String val, ptsize: I32): TTFFont =>
		@TTF_OpenFont(file.cstring(), ptsize)
