use "collections"

use @FMOD_Sound_Release[I32](sound: FMODSound)
use @FMOD_Sound_GetDefaults[I32](sound: FMODSound, frequency: Pointer[F32], priority: Pointer[I32])
use @FMOD_Sound_GetLength[I32](sound: FMODSound, length: Pointer[U32], lengthtype: U32)
use @FMOD_Sound_GetLoopCount[I32](sound: FMODSound, loopcount: Pointer[I32])
use @FMOD_Sound_GetLoopPoints[I32](sound: FMODSound, loopstart: Pointer[U32], loopstarttype: U32, loopend: Pointer[U32], loopendtype: U32)
use @FMOD_Sound_GetMusicSpeed[I32](sound: FMODSound, speed: Pointer[F32])
use @FMOD_Sound_GetOpenState[I32](sound: FMODSound, openstate: Pointer[U32], percentbuffered: Pointer[U32], starving: Pointer[I32], diskbusy: Pointer[I32])
use @FMOD_Sound_GetSoundGroup[I32](sound: FMODSound, soundgroup: Pointer[FMODSoundGroup])
use @FMOD_Sound_GetTag[I32](sound: FMODSound, name: Pointer[U8] tag, index: I32, tag_: MaybePointer[FMODTag])
use @FMOD_Sound_SetDefaults[I32](sound: FMODSound, frequency: F32, priority: I32)
use @FMOD_Sound_SetLoopCount[I32](sound: FMODSound, loopcount: I32)
use @FMOD_Sound_SetLoopPoints[I32](sound: FMODSound, loopstart: U32, loopstarttype: U32, loopend: U32, loopendtype: U32)
use @FMOD_Sound_SetMode[I32](sound: FMODSound, mode: U32)
use @FMOD_Sound_SetSoundGroup[I32](sound: FMODSound, soundgroup: FMODSoundGroup)

primitive _FMODSound
type FMODSound is Pointer[_FMODSound]

primitive _FMODSoundGroup
type FMODSoundGroup is Pointer[_FMODSoundGroup]


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

type FMODOpenState is (
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

struct FMODSoundState
	var result: I32 = 0
	var openstate: U32 = 0
	var percentbuffered: U32 = 0
	var starving: I32 = 0
	var diskbusy: I32 = 0

	new failed(res: I32) =>
		result = res

	new create(openstate': U32, percentbuffered': U32, starving': I32, diskbusy': I32) =>
		result = FMODOk()
		openstate = openstate'
		percentbuffered = percentbuffered'
		starving = starving'
		diskbusy = diskbusy'


primitive FMODTAGTYPEUNKNOWN
	fun apply(): I32 => 0
primitive FMODTAGTYPEID3V1
	fun apply(): I32 => 1
primitive FMODTAGTYPEID3V2
	fun apply(): I32 => 2
primitive FMODTAGTYPEVORBISCOMMENT
	fun apply(): I32 => 3
primitive FMODTAGTYPESHOUTCAST
	fun apply(): I32 => 4
primitive FMODTAGTYPEICECAST
	fun apply(): I32 => 5
primitive FMODTAGTYPEASF
	fun apply(): I32 => 6
primitive FMODTAGTYPEMIDI
	fun apply(): I32 => 7
primitive FMODTAGTYPEPLAYLIST
	fun apply(): I32 => 8
primitive FMODTAGTYPEFMOD
	fun apply(): I32 => 9
primitive FMODTAGTYPEUSER
	fun apply(): I32 => 10
primitive FMODTAGTYPEMAX
	fun apply(): I32 => 11

type FMODTagType is (
	FMODTAGTYPEUNKNOWN
	| FMODTAGTYPEID3V1
	| FMODTAGTYPEID3V2
	| FMODTAGTYPEVORBISCOMMENT
	| FMODTAGTYPESHOUTCAST
	| FMODTAGTYPEICECAST
	| FMODTAGTYPEASF
	| FMODTAGTYPEMIDI
	| FMODTAGTYPEPLAYLIST
	| FMODTAGTYPEFMOD
	| FMODTAGTYPEUSER
	| FMODTAGTYPEMAX
)


primitive FMODTAGDATATYPEBINARY
	fun apply(): I32 => 0
primitive FMODTAGDATATYPEINT
	fun apply(): I32 => 1
primitive FMODTAGDATATYPEFLOAT
	fun apply(): I32 => 2
primitive FMODTAGDATATYPESTRING
	fun apply(): I32 => 3
primitive FMODTAGDATATYPESTRINGUTF16
	fun apply(): I32 => 4
primitive FMODTAGDATATYPESTRINGUTF16BE
	fun apply(): I32 => 5
primitive FMODTAGDATATYPESTRINGUTF8
	fun apply(): I32 => 6
primitive FMODTAGDATATYPECDTOC
	fun apply(): I32 => 7
primitive FMODTAGDATATYPEMAX
	fun apply(): I32 => 8

type FMODTagDataType is (
	FMODTAGDATATYPEBINARY
	| FMODTAGDATATYPEINT
	| FMODTAGDATATYPEFLOAT
	| FMODTAGDATATYPESTRING
	| FMODTAGDATATYPESTRINGUTF16
	| FMODTAGDATATYPESTRINGUTF16BE
	| FMODTAGDATATYPESTRINGUTF8
	| FMODTAGDATATYPECDTOC
	| FMODTAGDATATYPEMAX
)

struct FMODTag
	var type': I32 = 0
	var datatype: I32 = 0
	var name: Pointer[U8] = Pointer[U8]
	var data: Pointer[U8] = Pointer[U8]
	var datalen: U32 = 0
	var updated: I32 = 0
