use "collections"
use "strings"
use "path: ../FMOD/lib/x86_64/"
use "lib:fmod"


primitive FMOD

	fun systemClose(system: FMODSystem): FMODResult =>
		@FMOD_System_Close(system)

	fun systemCreate(): FMODSystem =>
		@FMOD_Alt_System_Create()

	fun systemRelease(system: FMODSystem): FMODResult =>
		@FMOD_System_Release(system)

	fun systemUpdate(system: FMODSystem): FMODResult =>
		@FMOD_System_Update(system)


actor Main
	new create(env: Env) =>
		var system: FMODSystem = FMOD.systemCreate()

		if system.is_null() then
			env.out.print("ERROR")
		end
