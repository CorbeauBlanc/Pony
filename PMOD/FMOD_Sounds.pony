use "collections"

use @FMOD_Sound_Release[I32](sound: FMODSound)
use @FMOD_Sound_GetDefaults[I32](sound: FMODSound, frequency: Pointer[F32], priority: Pointer[I32])
use @FMOD_Sound_GetLength[I32](sound: FMODSound, length: Pointer[U32], lengthtype: U32)
use @FMOD_Sound_GetLoopCount[I32](sound: FMODSound, loopcount: Pointer[I32])
use @FMOD_Sound_GetMusicSpeed[I32](sound: FMODSound, speed: Pointer[F32])
use @FMOD_Sound_GetOpenState[I32](sound: FMODSound, openstate: Pointer[U32], percentbuffered: Pointer[U32], starving: Pointer[I32], diskbusy: Pointer[I32])

primitive _FMODSound
type FMODSound is Pointer[_FMODSound]

primitive FMODOPENSTATEREADY
	fun apply(): U32 => 0
primitive FMODOPENSTATELOADING
	fun apply(): U32 => 1
primitive FMODOPENSTATEERROR
	fun apply(): U32 => 2
primitive FMODOPENSTATECONNECTING
	fun apply(): U32 => 3
primitive FMODOPENSTATEBUFFERING
	fun apply(): U32 => 4
primitive FMODOPENSTATESEEKING
	fun apply(): U32 => 5
primitive FMODOPENSTATEPLAYING
	fun apply(): U32 => 6
primitive FMODOPENSTATESETPOSITION
	fun apply(): U32 => 7
primitive FMODOPENSTATEMAX
	fun apply(): U32 => 8

type FMODOpenstate is (
	FMODOPENSTATEREADY
	| FMODOPENSTATELOADING
	| FMODOPENSTATEERROR
	| FMODOPENSTATECONNECTING
	| FMODOPENSTATEBUFFERING
	| FMODOPENSTATESEEKING
	| FMODOPENSTATEPLAYING
	| FMODOPENSTATESETPOSITION
	| FMODOPENSTATEMAX
)
