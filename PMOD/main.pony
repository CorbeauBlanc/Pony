use "collections"
use "strings"
use "path: ../FMOD/lib/x86_64/"
use "lib:fmod"


primitive FMOD

	fun chanelGetMute(channel: FMODChannel): Bool =>
		if @FMOD_Alt_Channel_GetMute(channel) == 1 then
			true
		else
			false
		end

	fun chanelGetPaused(channel: FMODChannel): Bool =>
		if @FMOD_Alt_Channel_GetPaused(channel) == 1 then
			true
		else
			false
		end

	fun chanelIsPlaying(channel: FMODChannel): Bool =>
		if @FMOD_Alt_Channel_IsPlaying(channel) == 1 then
			true
		else
			false
		end

	fun systemClose(system: FMODSystem): FMODResult =>
		@FMOD_System_Close(system)

	fun systemCreate(): FMODSystem =>
		@FMOD_Alt_System_Create()

	fun systemInit(system: FMODSystem, maxchannels: I32, flags: FMODInitFlag val, extradriverdata: Pointer[U8]): FMODResult =>
		@FMOD_System_Init(system, maxchannels, flags(), extradriverdata)

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

		var res: I32 = FMOD.systemInit(system, 2, NORMAL, Pointer[U8])
		if res != FMODOk() then
			env.out.print(res.string())
		end

		FMOD.systemClose(system)
		FMOD.systemRelease(system)
