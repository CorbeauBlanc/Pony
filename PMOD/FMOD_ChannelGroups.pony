use "collections"

use @FMOD_ChannelGroup_AddFadePoint[I32](channelGroup: FMODChannelGroup, dspclock: U64, volume: F32)
use @FMOD_ChannelGroup_GetChannel[I32](channelGroup: FMODChannelGroup, index: I32, channel: Pointer[FMODChannel])
use @FMOD_ChannelGroup_GetDSPClock[I32](channelGroup: FMODChannelGroup, dspclock: Pointer[U64], parentclock: Pointer[U64])
use @FMOD_ChannelGroup_GetMode[I32](channelGroup: FMODChannelGroup, mode: Pointer[U32])
use @FMOD_ChannelGroup_GetMute[I32](channelGroup: FMODChannelGroup, mute: Pointer[I32])
use @FMOD_ChannelGroup_GetNumChannels[I32](channelGroup: FMODChannelGroup, numchannels: Pointer[I32])
use @FMOD_ChannelGroup_GetPaused[I32](channelGroup: FMODChannelGroup, paused: Pointer[I32])
use @FMOD_ChannelGroup_GetPitch[I32](channelGroup: FMODChannelGroup, pitch: Pointer[F32])
use @FMOD_ChannelGroup_GetVolume[I32](channelGroup: FMODChannelGroup, volume: Pointer[F32])
use @FMOD_ChannelGroup_GetVolumeRamp[I32](channelGroup: FMODChannelGroup, ramp: Pointer[I32])
use @FMOD_ChannelGroup_IsPlaying[I32](channelGroup: FMODChannelGroup, isplaying: Pointer[I32])
use @FMOD_ChannelGroup_RemoveFadePoints[I32](channelGroup: FMODChannelGroup, dspclock_start: U64, dspclock_end: U64)
use @FMOD_ChannelGroup_SetFadePointRamp[I32](channelGroup: FMODChannelGroup, dspclock: U64, volume: F32)
use @FMOD_ChannelGroup_SetMode[I32](channelGroup: FMODChannelGroup, mode: U32)
use @FMOD_ChannelGroup_SetMute[I32](channelGroup: FMODChannelGroup, mute: I32)
use @FMOD_ChannelGroup_SetPan[I32](channelGroup: FMODChannelGroup, pan: F32)
use @FMOD_ChannelGroup_SetPaused[I32](channelGroup: FMODChannelGroup, paused: I32)
use @FMOD_ChannelGroup_SetPitch[I32](channelGroup: FMODChannelGroup, pitch: F32)
use @FMOD_ChannelGroup_Release[I32](channelGroup: FMODChannelGroup)
use @FMOD_ChannelGroup_SetVolume[I32](channelGroup: FMODChannelGroup, volume: F32)
use @FMOD_ChannelGroup_SetVolumeRamp[I32](channelGroup: FMODChannelGroup, ramp: I32)
use @FMOD_ChannelGroup_Stop[I32](channelGroup: FMODChannelGroup)

primitive _FMODChannelGroup
type FMODChannelGroup is Pointer[_FMODChannelGroup]
