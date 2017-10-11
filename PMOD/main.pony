use "collections"
use "strings"
use "path: ../FMOD/lib/x86_64/"
use "lib:fmod"


primitive FMOD

	fun systemCreate(system: FMODSystem): I32 =>
		@FMOD_System_Create(Pointer[FMODSystem](system))


actor Main
	new create(env: Env) =>
		env.out.print("Hello World !")
