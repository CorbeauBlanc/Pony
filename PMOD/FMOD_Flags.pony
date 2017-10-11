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

primitive NORMAL is FMODInitFlag
	fun apply(): U32 => 0x00000000
primitive STREAMFROMUPDATE is FMODInitFlag
	fun apply(): U32 => 0x00000001
primitive MIXFROMUPDATE is FMODInitFlag
	fun apply(): U32 => 0x00000002
primitive TDRIGHTHANDED is FMODInitFlag
	fun apply(): U32 => 0x00000004
primitive CHANNELLOWPASS is FMODInitFlag
	fun apply(): U32 => 0x00000100
primitive CHANNELDISTANCEFILTER is FMODInitFlag
	fun apply(): U32 => 0x00000200
primitive PROFILEENABLE is FMODInitFlag
	fun apply(): U32 => 0x00010000
primitive VOL0BECOMESVIRTUAL is FMODInitFlag
	fun apply(): U32 => 0x00020000
primitive GEOMETRYUSECLOSEST is FMODInitFlag
	fun apply(): U32 => 0x00040000
primitive PREFERDOLBYDOWNMIX is FMODInitFlag
	fun apply(): U32 => 0x00080000
primitive THREADUNSAFE is FMODInitFlag
	fun apply(): U32 => 0x00100000
primitive PROFILEMETERALL is FMODInitFlag
	fun apply(): U32 => 0x00200000
primitive DISABLESRSHIGHPASSFILTER is FMODInitFlag
	fun apply(): U32 => 0x00400000
