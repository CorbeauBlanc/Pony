use "collections"

interface FMODFlag
	fun apply(): U32
	fun op_or(other: FMODFlag val): FMODFlag val =>
		recover UdefFMODFlag(this.apply() or other()) end
	fun op_and(other: FMODFlag val): FMODFlag val =>
		recover UdefFMODFlag(this.apply() and other()) end
	fun op_xor(other: FMODFlag val): FMODFlag val =>
		recover UdefFMODFlag(this.apply() xor other()) end

class UdefFMODFlag is FMODFlag
	var _val: U32
	new create(value: U32) => _val = value
	fun apply(): U32 => _val

/*
	Initialisation flags
*/
interface FMODInitFlag is FMODFlag

primitive FMODNORMAL is FMODInitFlag
	fun apply(): U32 => 0x00000000
primitive FMODSTREAMFROMUPDATE is FMODInitFlag
	fun apply(): U32 => 0x00000001
primitive FMODMIXFROMUPDATE is FMODInitFlag
	fun apply(): U32 => 0x00000002
primitive FMODTDRIGHTHANDED is FMODInitFlag
	fun apply(): U32 => 0x00000004
primitive FMODCHANNELLOWPASS is FMODInitFlag
	fun apply(): U32 => 0x00000100
primitive FMODCHANNELDISTANCEFILTER is FMODInitFlag
	fun apply(): U32 => 0x00000200
primitive FMODPROFILEENABLE is FMODInitFlag
	fun apply(): U32 => 0x00010000
primitive FMODVOL0BECOMESVIRTUAL is FMODInitFlag
	fun apply(): U32 => 0x00020000
primitive FMODGEOMETRYUSECLOSEST is FMODInitFlag
	fun apply(): U32 => 0x00040000
primitive FMODPREFERDOLBYDOWNMIX is FMODInitFlag
	fun apply(): U32 => 0x00080000
primitive FMODTHREADUNSAFE is FMODInitFlag
	fun apply(): U32 => 0x00100000
primitive FMODPROFILEMETERALL is FMODInitFlag
	fun apply(): U32 => 0x00200000
primitive FMODDISABLESRSHIGHPASSFILTER is FMODInitFlag
	fun apply(): U32 => 0x00400000


/*
	Sounds flags
*/
interface FMODMod is FMODFlag

primitive FMODDEFAULT is FMODMod
	fun apply(): U32 => 0x00000000
primitive FMODLOOPOFF is FMODMod
	fun apply(): U32 => 0x00000001
primitive FMODLOOPNORMAL is FMODMod
	fun apply(): U32 => 0x00000002
primitive FMODLOOPBIDI is FMODMod
	fun apply(): U32 => 0x00000004
primitive FMOD2D is FMODMod
	fun apply(): U32 => 0x00000008
primitive FMOD3D is FMODMod
	fun apply(): U32 => 0x00000010
primitive FMODCREATESTREAM is FMODMod
	fun apply(): U32 => 0x00000080
primitive FMODCREATESAMPLE is FMODMod
	fun apply(): U32 => 0x00000100
primitive FMODCREATECOMPRESSEDSAMPLE is FMODMod
	fun apply(): U32 => 0x00000200
primitive FMODOPENUSER is FMODMod
	fun apply(): U32 => 0x00000400
primitive FMODOPENMEMORY is FMODMod
	fun apply(): U32 => 0x00000800
primitive FMODOPENMEMORYPOINT is FMODMod
	fun apply(): U32 => 0x10000000
primitive FMODOPENRAW is FMODMod
	fun apply(): U32 => 0x00001000
primitive FMODOPENONLY is FMODMod
	fun apply(): U32 => 0x00002000
primitive FMODACCURATETIME is FMODMod
	fun apply(): U32 => 0x00004000
primitive FMODMPEGSEARCH is FMODMod
	fun apply(): U32 => 0x00008000
primitive FMODNONBLOCKING is FMODMod
	fun apply(): U32 => 0x00010000
primitive FMODUNIQUE is FMODMod
	fun apply(): U32 => 0x00020000
primitive FMOD3DHEADRELATIVE is FMODMod
	fun apply(): U32 => 0x00040000
primitive FMOD3DWORLDRELATIVE is FMODMod
	fun apply(): U32 => 0x00080000
primitive FMOD3DINVERSEROLLOFF is FMODMod
	fun apply(): U32 => 0x00100000
primitive FMOD3DLINEARROLLOFF is FMODMod
	fun apply(): U32 => 0x00200000
primitive FMOD3DLINEARSQUAREROLLOFF is FMODMod
	fun apply(): U32 => 0x00400000
primitive FMOD3DINVERSETAPEREDROLLOFF is FMODMod
	fun apply(): U32 => 0x00800000
primitive FMOD3DCUSTOMROLLOFF is FMODMod
	fun apply(): U32 => 0x04000000
primitive FMOD3DIGNOREGEOMETRY is FMODMod
	fun apply(): U32 => 0x40000000
primitive FMODIGNORETAGS is FMODMod
	fun apply(): U32 => 0x02000000
primitive FMODLOWMEM is FMODMod
	fun apply(): U32 => 0x08000000
primitive FMODLOADSECONDARYRAM is FMODMod
	fun apply(): U32 => 0x20000000
primitive FMODVIRTUALPLAYFROMSTART is FMODMod
	fun apply(): U32 => 0x80000000


/*
	Time units flags
*/
interface FMODTimeUnit is FMODFlag

primitive FMODTIMEUNITMS is FMODTimeUnit
	fun apply(): U32 => 0x00000001
primitive FMODTIMEUNITPCM is FMODTimeUnit
	fun apply(): U32 => 0x00000002
primitive FMODTIMEUNITPCMBYTES is FMODTimeUnit
	fun apply(): U32 => 0x00000004
primitive FMODTIMEUNITRAWBYTES is FMODTimeUnit
	fun apply(): U32 => 0x00000008
primitive FMODTIMEUNITPCMFRACTION is FMODTimeUnit
	fun apply(): U32 => 0x00000010
primitive FMODTIMEUNITMODORDER is FMODTimeUnit
	fun apply(): U32 => 0x00000100
primitive FMODTIMEUNITMODROW is FMODTimeUnit
	fun apply(): U32 => 0x00000200
primitive FMODTIMEUNITMODPATTERN is FMODTimeUnit
	fun apply(): U32 => 0x00000400
primitive FMODTIMEUNITBUFFERED is FMODTimeUnit
	fun apply(): U32 => 0x10000000
