use "collections"
use "strings"
use "path: ../FMOD/lib/x86_64/"
use "lib:fmod"


primitive FMOD

	fun channelGetMute(channel: FMODChannel): Bool =>
		var mute: I32 = 0
		@FMOD_Channel_GetMute(channel, addressof mute)
		if mute == 1 then true else false end

	fun channelGetPaused(channel: FMODChannel): Bool =>
		var paused: I32 = 0
		@FMOD_Channel_GetPaused(channel, addressof paused)
		if paused == 1 then true else false end

	fun channelIsPlaying(channel: FMODChannel): Bool =>
		var isPlaying: I32 = 0
		@FMOD_Channel_IsPlaying(channel, addressof isPlaying)
		if isPlaying == 1 then true else false end

	fun systemCreateSound(system: FMODSystem, name_or_data: String, mode: FMODMod val, exinfo: Pointer[U8]): FMODSound ? =>
		var sound = FMODSound
		var res = @FMOD_System_CreateSound(system, name_or_data.cstring(), mode(),Pointer[U8], addressof sound)
		if res != FMODOk() then error end
		sound

	fun systemCreate(): FMODSystem ? =>
		var system: FMODSystem = FMODSystem
		var res = @FMOD_System_Create(addressof system)
		if res != FMODOk() then error end
		system

	fun systemClose(system: FMODSystem): FMODResult =>
		@FMOD_System_Close(system)

	fun systemInit(system: FMODSystem, maxchannels: I32, flags: FMODInitFlag val, extradriverdata: Pointer[U8]): FMODResult =>
		@FMOD_System_Init(system, maxchannels, flags(), extradriverdata)

	fun systemRelease(system: FMODSystem): FMODResult =>
		@FMOD_System_Release(system)

	fun systemUpdate(system: FMODSystem): FMODResult =>
		@FMOD_System_Update(system)

	fun systemPlaySound(system: FMODSystem, sound: FMODSound, channelgroup: FMODChannelGroup, paused: Bool): FMODChannel =>
		var channel = FMODChannel
		@FMOD_System_PlaySound(system, sound, channelgroup, if paused then 1 else 0 end, addressof channel)
		channel

	fun soundRelease(sound: FMODSound): I32 =>
		@FMOD_Sound_Release(sound)


actor Main
	new create(env: Env) =>
		var system: FMODSystem = FMODSystem

		try system = FMOD.systemCreate()?
		else
			env.out.print("FMOD: systemCreate: ERROR")
			return
		end

		var res: I32 = FMOD.systemInit(system, 2, FMODNORMAL, Pointer[U8])
		if res != FMODOk() then
			env.out.print(res.string())
			return
		end

		var sound: FMODSound = FMODSound
		try sound = FMOD.systemCreateSound(system, "test.wav", FMODCREATESAMPLE, Pointer[U8])?
		else
			env.out.print("FMOD: systemCreateSound: ERROR")
			return
		end

		var channel = FMOD.systemPlaySound(system, sound, FMODChannelGroup, false)

		var flag = true
		while flag do
			flag = FMOD.channelIsPlaying(channel)
		end

		FMOD.soundRelease(sound)

		FMOD.systemClose(system)
		FMOD.systemRelease(system)
