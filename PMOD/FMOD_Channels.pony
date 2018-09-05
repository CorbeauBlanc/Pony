use "collections"

use @FMOD_Channel_IsPlaying[I32](channel: FMODChannel, isplaying: Pointer[I32])
use @FMOD_Channel_GetMute[I32](channel: FMODChannel, mute: Pointer[I32])
use @FMOD_Channel_GetPaused[I32](channel: FMODChannel, paused: Pointer[I32])


primitive _FMODChannel
type FMODChannel is Pointer[_FMODChannel]
