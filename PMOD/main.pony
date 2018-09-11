use "collections"
use "strings"
use "path: ../FMOD/lib/x86_64/"
use "lib:fmod"


primitive FMOD

	fun systemCreateSound(system: FMODSystem, name_or_data: String, mode: FMODMod val, exinfo: Pointer[U8]): FMODSound ? =>
		var sound = FMODSound
		let res = @FMOD_System_CreateSound(system, name_or_data.cstring(), mode(),Pointer[U8], addressof sound)
		if res != FMODOk() then error end
		sound

	fun systemCreate(): FMODSystem ? =>
		var system: FMODSystem = FMODSystem
		let res = @FMOD_System_Create(addressof system)
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

	fun systemGetChannel(system: FMODSystem, channelid: I32): FMODChannel ? =>
		var channel = FMODChannel
		let res = @FMOD_System_GetChannel(system, channelid, addressof channel)
		if res != FMODOk() then error end
		channel

	fun systemGetChannelsPlaying(system: FMODSystem): I32 =>
		var nb: I32 = 0
		let res = @FMOD_System_GetChannelsPlaying[I32](system, addressof nb, Pointer[I32])
		if res != FMODOk() then -1 else nb end

	fun systemGetRealChannelsPlaying(system: FMODSystem): I32 =>
		var nb: I32 = 0
		let res = @FMOD_System_GetChannelsPlaying[I32](system, Pointer[I32], addressof nb)
		if res != FMODOk() then -1 else nb end

	fun systemGetDriver(system: FMODSystem): I32 =>
		var nb: I32 = 0
		let res = @FMOD_System_GetDriver(system, addressof nb)
		if res != FMODOk() then -1 else nb end

	fun systemSetDriver(system: FMODSystem, driver: I32): I32 =>
		@FMOD_System_SetDriver(system, driver)

	fun soundRelease(sound: FMODSound): I32 =>
		@FMOD_Sound_Release(sound)

	fun soundGetDefaultFrequency(sound: FMODSound): F32 =>
		var nb: F32 = 0
		let res = @FMOD_Sound_GetDefaults(sound, addressof nb, Pointer[I32])
		if res != FMODOk() then -1 else nb end

	fun soundGetDefaultPriority(sound: FMODSound): I32 =>
		var nb: I32 = 0
		let res = @FMOD_Sound_GetDefaults(sound, Pointer[F32], addressof nb)
		if res != FMODOk() then -1 else nb end

	fun soundGetLength(sound: FMODSound, lengthtype: FMODTimeUnit): I32 =>
		var nb: U32 = 0
		let res = @FMOD_Sound_GetLength(sound, addressof nb, lengthtype())
		if res != FMODOk() then -1 else nb.i32() end

	fun soundGetLoopCount(sound: FMODSound): I32 =>
		var nb: I32 = 0
		let res = @FMOD_Sound_GetLoopCount[I32](sound, addressof nb)
		if res != FMODOk() then -1 else nb end

	fun soundGetLoopPoints(sound: FMODSound, loopstarttype: FMODTimeUnit, loopendtype: FMODTimeUnit): (U32, U32) =>
		var loopstart: U32 = 0
		var loopend: U32 = 0
		@FMOD_Sound_GetLoopPoints(sound, addressof loopstart, loopstarttype(), addressof loopend, loopendtype())
		(loopstart, loopend)

	fun soundGetMusicSpeed(sound: FMODSound): F32 =>
		var nb: F32 = 0
		let res = @FMOD_Sound_GetMusicSpeed(sound, addressof nb)
		if res != FMODOk() then -1 else nb end

	fun soundGetOpenState(sound: FMODSound): FMODSoundState =>
		var openstate: U32 = 0
		var percentbuffered: U32 = 0
		var starving: I32 = 0
		var diskbusy: I32 = 0
		let res = @FMOD_Sound_GetOpenState(sound, addressof openstate, addressof percentbuffered, addressof starving, addressof diskbusy)
		if res != FMODOk() then
			FMODSoundState.failed(res)
		else
			FMODSoundState(openstate, percentbuffered, starving, diskbusy)
		end

	fun soundGetSoundGroup(sound: FMODSound): FMODSoundGroup =>
		var gp = FMODSoundGroup
		@FMOD_Sound_GetSoundGroup(sound, addressof gp)
		gp

	fun soundGetTag(sound: FMODSound, name: String, index: I32): FMODTag ? =>
		var tg: FMODTag ref = FMODTag
		let res = @FMOD_Sound_GetTag(sound, name.cstring(), index, MaybePointer[FMODTag](tg))
		if res != FMODOk() then error else tg end

	fun soundSetDefaults(sound: FMODSound, frequency: F32, priority: I32): I32 =>
		@FMOD_Sound_SetDefaults(sound, frequency, priority)

	fun soundSetLoopCount(sound: FMODSound, loopcount: I32): I32 =>
		@FMOD_Sound_SetLoopCount(sound, loopcount)

	fun soundSetLoopPoints(sound: FMODSound, loopstart: U32, loopstarttype: FMODTimeUnit, loopend: U32, loopendtype: FMODTimeUnit): I32 =>
		@FMOD_Sound_SetLoopPoints(sound, loopstart, loopstarttype(), loopend, loopendtype())

	fun soundSetMode(sound: FMODSound, mode: FMODMod): I32 =>
		@FMOD_Sound_SetMode(sound, mode())

	fun soundSetSoundGroup(sound: FMODSound, soundgroup: FMODSoundGroup): I32 =>
		@FMOD_Sound_SetSoundGroup(sound, soundgroup)

	fun channelAddFadePoint(channel: FMODChannel, dspclock: U64, volume: F32): I32 =>
		@FMOD_Channel_AddFadePoint(channel, dspclock, volume)

	fun channelGetChannelGroup(channel: FMODChannel): FMODChannelGroup =>
		var cg = FMODChannelGroup
		@FMOD_Channel_GetChannelGroup(channel, addressof cg)
		cg

	fun channelGetCurrentSound(channel: FMODChannel): FMODSound =>
		var sound = FMODSound
		@FMOD_Channel_GetCurrentSound(channel, addressof sound)
		sound

	fun channelGetDSPClock(channel: FMODChannel): (U64, U64) =>
		var dspclock: U64 = 0
		var parentclock: U64 = 0
		@FMOD_Channel_GetDSPClock(channel, addressof dspclock, addressof parentclock)
		(dspclock, parentclock)

	fun channelGetFrequency(channel: FMODChannel): F32 =>
		var frequency: F32 = 0
		@FMOD_Channel_GetFrequency(channel, addressof frequency)
		frequency

	fun channelGetIndex(channel: FMODChannel): I32 =>
		var i: I32 = -1
		@FMOD_Channel_GetIndex(channel, addressof i)
		i

	fun channelGetLoopCount(channel: FMODChannel): I32 =>
		var loopcount: I32 = -1
		@FMOD_Channel_GetLoopCount(channel, addressof loopcount)
		loopcount

	fun channelGetLoopPoints(channel: FMODChannel, loopstarttype: FMODTimeUnit, loopendtype: FMODTimeUnit): (U32, U32) =>
		var loopstart: U32 = 0
		var loopend: U32 = 0
		@FMOD_Channel_GetLoopPoints(channel, addressof loopstart, loopstarttype(), addressof loopend, loopendtype())
		(loopstart, loopend)

	fun channelGetMode(channel: FMODChannel): U32 =>
		var mode: U32 = 0
		@FMOD_Channel_GetMode(channel, addressof mode)
		mode

	fun channelGetMute(channel: FMODChannel): Bool =>
		var mute: I32 = 0
		@FMOD_Channel_GetMute(channel, addressof mute)
		if mute == 1 then true else false end

	fun channelGetPaused(channel: FMODChannel): Bool =>
		var paused: I32 = 0
		@FMOD_Channel_GetPaused(channel, addressof paused)
		if paused == 1 then true else false end

	fun channelGetPitch(channel: FMODChannel): F32 =>
		var pitch: F32 = 0
		@FMOD_Channel_GetPitch(channel, addressof pitch)
		pitch

	fun channelGetPosition(channel: FMODChannel, postype: FMODTimeUnit): U32 =>
		var position: U32 = 0
		@FMOD_Channel_GetPosition(channel, addressof position, postype())
		position

	fun channelGetPriority(channel: FMODChannel): I32 =>
		var priority: I32 = -1
		@FMOD_Channel_GetPriority(channel, addressof priority)
		priority

	fun channelGetVolume(channel: FMODChannel): F32 =>
		var volume: F32 = 0
		@FMOD_Channel_GetVolume(channel, addressof volume)
		volume

	fun channelGetVolumeRamp(channel: FMODChannel): Bool =>
		var ramp: I32 = 0
		@FMOD_Channel_GetVolumeRamp(channel, addressof ramp)
		if ramp == 1 then true else false end

	fun channelIsPlaying(channel: FMODChannel): Bool =>
		var isPlaying: I32 = 0
		@FMOD_Channel_IsPlaying(channel, addressof isPlaying)
		if isPlaying == 1 then true else false end

	fun channelRemoveFadePoints(channel: FMODChannel, dspclock_start: U64, dspclock_end: U64): I32 =>
		@FMOD_Channel_RemoveFadePoints(channel, dspclock_start, dspclock_end)

	fun channelSetChannelGroup(channel: FMODChannel, channelgroup: FMODChannelGroup): I32 =>
		@FMOD_Channel_SetChannelGroup(channel, channelgroup)

	fun channelSetFadePointRamp(channel: FMODChannel, dspclock: U64, volume: F32): I32 =>
		@FMOD_Channel_SetFadePointRamp(channel, dspclock, volume)

	fun channelSetFrequency(channel: FMODChannel, frequency: F32): I32 =>
		@FMOD_Channel_SetFrequency(channel, frequency)

	fun channelSetLoopCount(channel: FMODChannel, loopcount: I32): I32 =>
		@FMOD_Channel_SetLoopCount(channel, loopcount)

	fun channelSetLoopPoints(channel: FMODChannel, loopstart: U32, loopstarttype: FMODTimeUnit, loopend: U32, loopendtype: FMODTimeUnit): I32 =>
		@FMOD_Channel_SetLoopPoints(channel, loopstart, loopstarttype(), loopend, loopendtype())

	fun channelSetMode(channel: FMODChannel, mode: FMODMod): I32 =>
		@FMOD_Channel_SetMode(channel, mode())

	fun channelSetMute(channel: FMODChannel, mute: Bool): I32 =>
		@FMOD_Channel_SetMute(channel, if mute then 1 else 0 end)

	fun channelSetPan(channel: FMODChannel, pan: F32): I32 =>
		@FMOD_Channel_SetPan(channel, pan)

	fun channelSetPaused(channel: FMODChannel, paused: Bool): I32 =>
		@FMOD_Channel_SetPaused(channel, if paused then 1 else 0 end)

	fun channelSetPitch(channel: FMODChannel, pitch: F32): I32 =>
		@FMOD_Channel_SetPitch(channel, pitch)

	fun channelSetPosition(channel: FMODChannel, position: U32, postype: FMODTimeUnit): I32 =>
		@FMOD_Channel_SetPosition(channel, position, postype())

	fun channelSetPriority(channel: FMODChannel, priority: I32): I32 =>
		@FMOD_Channel_SetPriority(channel, priority)

	fun channelSetVolume(channel: FMODChannel, volume: F32): I32 =>
		@FMOD_Channel_SetVolume(channel, volume)

	fun channelSetVolumeRamp(channel: FMODChannel, ramp: Bool): I32 =>
		@FMOD_Channel_SetVolumeRamp(channel, if ramp then 1 else 0 end)

	fun channelStop(channel: FMODChannel): I32 =>
		@FMOD_Channel_Stop(channel)


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
