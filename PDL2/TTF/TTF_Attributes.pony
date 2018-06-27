use "collections"
use "strings"
use "lib:SDL2"


use @TTF_GetFontStyle[I32](font: TTFFont)
use @TTF_SetFontStyle[None](font: TTFFont, style: U32)
use @TTF_GetFontOutline[I32](font: TTFFont)
use @TTF_SetFontOutline[None](font: TTFFont, outline: I32)

use @TTF_GetFontHinting[I32](font: TTFFont)
use @TTF_SetFontHinting[None](font: TTFFont, hinting: U32)
use @TTF_GetFontKerning[I32](font: TTFFont)
use @TTF_SetFontKerning[None](font: TTFFont, allowed: I32)

use @TTF_FontHeight[I32](font: TTFFont)
use @TTF_FontAscent[I32](font: TTFFont)
use @TTF_FontDescent[I32](font: TTFFont)
use @TTF_FontLineSkip[I32](font: TTFFont)

use @TTF_FontFaceIsFixedWidth[I32](font: TTFFont)
use @TTF_FontFaceFamilyName[Pointer[U8]](font: TTFFont tag)
use @TTF_FontFaceStyleName[Pointer[U8]](font: TTFFont tag)


primitive STYLENORMAL is TTFFlag
	fun apply(): U32 => 0x00000000
primitive STYLEBOLD is TTFFlag
	fun apply(): U32 => 0x00000001
primitive STYLEITALIC is TTFFlag
	fun apply(): U32 => 0x00000002
primitive STYLEUNDERLINE is TTFFlag
	fun apply(): U32 => 0x00000004
primitive STYLESTRIKETHROUGH is TTFFlag
	fun apply(): U32 => 0x00000008

primitive HINTINGNORMAL is TTFFlag
	fun apply(): U32 => 0
primitive HINTINGLIGHT is TTFFlag
	fun apply(): U32 => 1
primitive HINTINGMONO is TTFFlag
	fun apply(): U32 => 2
primitive HINTINGNONE is TTFFlag
	fun apply(): U32 => 3
