use "collections"


use @FMOD_System_Close[I32](system: FMODSystem)
use @FMOD_System_Create[I32](system: Pointer[FMODSystem])
use @FMOD_System_Init[I32](system: FMODSystem, maxchannels: I32, flags: U32, extradriverdata: Pointer[U8])
use @FMOD_System_Release[I32](system: FMODSystem)
use @FMOD_System_Update[I32](system: FMODSystem)

use @FMOD_System_GetDriver[I32](system: FMODSystem, driver: Pointer[I32])
use @FMOD_System_SetDriver[I32](system: FMODSystem, driver: I32)

use @FMOD_System_GetChannel[I32](system: FMODSystem, channelid: I32, channel: Pointer[FMODChannel])
use @FMOD_System_GetChannelsPlaying[I32](system: FMODSystem, channels: Pointer[I32], realchannels: Pointer[I32])

use @FMOD_System_CreateChannelGroup[I32](system: FMODSystem, name: Pointer[U8] tag, channelgroup: Pointer[FMODChannelGroup])

use @FMOD_System_CreateSound[I32](system: FMODSystem, name_or_data: Pointer[U8] tag, mode: U32, exinfo: Pointer[U8], sound: Pointer[FMODSound])
use @FMOD_System_PlaySound[I32](system: FMODSystem, sound: FMODSound, channelgroup: FMODChannelGroup, paused: I32, channel: Pointer[FMODChannel])


primitive _FMODSystem
type FMODSystem is Pointer[_FMODSystem]

primitive FMODOk
	fun apply(): I32 => 0
primitive FmodErrBadcommand
	fun apply(): I32 => 1
primitive FmodErrChannelAlloc
	fun apply(): I32 => 2
primitive FmodErrChannelStolen
	fun apply(): I32 => 3
primitive FmodErrDma
	fun apply(): I32 => 4
primitive FmodErrDspConnection
	fun apply(): I32 => 5
primitive FmodErrDspDontprocess
	fun apply(): I32 => 6
primitive FmodErrDspFormat
	fun apply(): I32 => 7
primitive FmodErrDspInuse
	fun apply(): I32 => 8
primitive FmodErrDspNotfound
	fun apply(): I32 => 9
primitive FmodErrDspReserved
	fun apply(): I32 => 10
primitive FmodErrDspSilence
	fun apply(): I32 => 11
primitive FmodErrDspType
	fun apply(): I32 => 12
primitive FmodErrFileBad
	fun apply(): I32 => 13
primitive FmodErrFileCouldnotseek
	fun apply(): I32 => 14
primitive FmodErrFileDiskejected
	fun apply(): I32 => 15
primitive FmodErrFileEof
	fun apply(): I32 => 16
primitive FmodErrFileEndofdata
	fun apply(): I32 => 17
primitive FmodErrFileNotfound
	fun apply(): I32 => 18
primitive FmodErrFormat
	fun apply(): I32 => 19
primitive FmodErrHeaderMismatch
	fun apply(): I32 => 20
primitive FmodErrHttp
	fun apply(): I32 => 21
primitive FmodErrHttpAccess
	fun apply(): I32 => 22
primitive FmodErrHttpProxyAuth
	fun apply(): I32 => 23
primitive FmodErrHttpServerError
	fun apply(): I32 => 24
primitive FmodErrHttpTimeout
	fun apply(): I32 => 25
primitive FmodErrInitialization
	fun apply(): I32 => 26
primitive FmodErrInitialized
	fun apply(): I32 => 27
primitive FmodErrInternal
	fun apply(): I32 => 28
primitive FmodErrInvalidFloat
	fun apply(): I32 => 29
primitive FmodErrInvalidHandle
	fun apply(): I32 => 30
primitive FmodErrInvalidParam
	fun apply(): I32 => 31
primitive FmodErrInvalidPosition
	fun apply(): I32 => 32
primitive FmodErrInvalidSpeaker
	fun apply(): I32 => 33
primitive FmodErrInvalidSyncpoint
	fun apply(): I32 => 34
primitive FmodErrInvalidThread
	fun apply(): I32 => 35
primitive FmodErrInvalidVector
	fun apply(): I32 => 36
primitive FmodErrMaxaudible
	fun apply(): I32 => 37
primitive FmodErrMemory
	fun apply(): I32 => 38
primitive FmodErrMemoryCantpoint
	fun apply(): I32 => 39
primitive FmodErrNeeds3d
	fun apply(): I32 => 40
primitive FmodErrNeedshardware
	fun apply(): I32 => 41
primitive FmodErrNetConnect
	fun apply(): I32 => 42
primitive FmodErrNetSocketError
	fun apply(): I32 => 43
primitive FmodErrNetUrl
	fun apply(): I32 => 44
primitive FmodErrNetWouldBlock
	fun apply(): I32 => 45
primitive FmodErrNotready
	fun apply(): I32 => 46
primitive FmodErrOutputAllocated
	fun apply(): I32 => 47
primitive FmodErrOutputCreatebuffer
	fun apply(): I32 => 48
primitive FmodErrOutputDrivercall
	fun apply(): I32 => 49
primitive FmodErrOutputFormat
	fun apply(): I32 => 50
primitive FmodErrOutputInit
	fun apply(): I32 => 51
primitive FmodErrOutputNodrivers
	fun apply(): I32 => 52
primitive FmodErrPlugin
	fun apply(): I32 => 53
primitive FmodErrPluginMissing
	fun apply(): I32 => 54
primitive FmodErrPluginResource
	fun apply(): I32 => 55
primitive FmodErrPluginVersion
	fun apply(): I32 => 56
primitive FmodErrRecord
	fun apply(): I32 => 57
primitive FmodErrReverbChannelgroup
	fun apply(): I32 => 58
primitive FmodErrReverbInstance
	fun apply(): I32 => 59
primitive FmodErrSubsounds
	fun apply(): I32 => 60
primitive FmodErrSubsoundAllocated
	fun apply(): I32 => 61
primitive FmodErrSubsoundCantmove
	fun apply(): I32 => 62
primitive FmodErrTagnotfound
	fun apply(): I32 => 63
primitive FmodErrToomanychannels
	fun apply(): I32 => 64
primitive FmodErrTruncated
	fun apply(): I32 => 65
primitive FmodErrUnimplemented
	fun apply(): I32 => 66
primitive FmodErrUninitialized
	fun apply(): I32 => 67
primitive FmodErrUnsupported
	fun apply(): I32 => 68
primitive FmodErrVersion
	fun apply(): I32 => 69
primitive FmodErrEventAlreadyLoaded
	fun apply(): I32 => 70
primitive FmodErrEventLiveupdateBusy
	fun apply(): I32 => 71
primitive FmodErrEventLiveupdateMismatch
	fun apply(): I32 => 72
primitive FmodErrEventLiveupdateTimeout
	fun apply(): I32 => 73
primitive FmodErrEventNotfound
	fun apply(): I32 => 74
primitive FmodErrStudioUninitialized
	fun apply(): I32 => 75
primitive FmodErrStudioNotLoaded
	fun apply(): I32 => 76
primitive FmodErrInvalidString
	fun apply(): I32 => 77
primitive FmodErrAlreadyLocked
	fun apply(): I32 => 78
primitive FmodErrNotLocked
	fun apply(): I32 => 79
primitive FmodErrRecordDisconnected
	fun apply(): I32 => 80
primitive FmodErrToomanysamples
	fun apply(): I32 => 81

type FMODResult is I32
