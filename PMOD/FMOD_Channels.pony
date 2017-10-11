use "collections"

use @FMOD_Alt_Channel_IsPlaying[I32](channel: FMODChannel)
use @FMOD_Alt_Channel_GetMute[I32](channel: FMODChannel)
use @FMOD_Alt_Channel_GetPaused[I32](channel: FMODChannel)


primitive _FMODChannel
type FMODChannel is Pointer[_FMODChannel]
