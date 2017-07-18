use "collections"

interface SdlFlag
	fun value(): U32
	fun op_or(other: SdlFlag val): SdlFlag val =>
		recover UndefinedSdlFlag(this.value() or other.value()) end
	fun op_and(other: SdlFlag val): SdlFlag val =>
		recover UndefinedSdlFlag(this.value() and other.value()) end
	fun op_xor(other: SdlFlag val): SdlFlag val =>
		recover UndefinedSdlFlag(this.value() xor other.value()) end

class UndefinedSdlFlag is SdlFlag
	var _val: U32
	new create(value': U32) => _val = value'
	fun value(): U32 => _val

/*
	Initialisation flags
*/
primitive TIMER is SdlFlag
	fun value(): U32 => 0x00000001
primitive AUDIO is SdlFlag
	fun value(): U32 => 0x00000010
primitive VIDEO is SdlFlag
	fun value(): U32 => 0x00000020
primitive JOYSTICK is SdlFlag
	fun value(): U32 => 0x00000200
primitive HAPTIC is SdlFlag
	fun value(): U32 => 0x00001000
primitive GAMECONTROLLER is SdlFlag
	fun value(): U32 => 0x00002000
primitive EVENTS is SdlFlag
	fun value(): U32 => 0x00004000
primitive NOPARACHUTE is SdlFlag
	fun value(): U32 => 0x00100000
