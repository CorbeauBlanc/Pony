use "collections"
use "strings"
use "lib:SDL2"
use "lib:SDL_ttf"

use @TTF_Init[I32]()
use @TTF_WasInit[I32]()
use @TTF_Quit[None]()


primitive TTF

	fun init(): I32 =>
		@TTF_Init()

	fun wasInit(): I32 =>
		@TTF_WasInit()

	fun quit() =>
		@TTF_Quit()

	fun openFont(file: String val, ptsize: I32): TTFFont =>
		@TTF_OpenFont(file.cstring(), ptsize)

	fun openFontIndex(file: String val, ptsize: I32, index: I64): TTFFont =>
		@TTF_OpenFontIndex(file.cstring(), ptsize, index)

	fun getFontStyle(font: TTFFont): (I32 | None) =>
		if not font.is_null() then
			@TTF_GetFontStyle(font)
		end

	fun setFontStyle(font: TTFFont, style: TTFFlag) =>
		if not font.is_null() then
			@TTF_SetFontStyle(font, style())
		end

	fun getFontOutline(font: TTFFont): (I32 | None) =>
		if not font.is_null() then
			@TTF_GetFontOutline(font)
		end

	fun setFontOutline(font: TTFFont, outline: I32) =>
		if not font.is_null() then
			@TTF_SetFontOutline(font, outline)
		end

	fun getFontHinting(font: TTFFont): (I32 | None) =>
		if not font.is_null() then
			@TTF_GetFontHinting(font)
		end

	fun setFontHinting(font: TTFFont, hinting: TTFFlag) =>
		if not font.is_null() then
			@TTF_SetFontHinting(font, hinting())
		end

	fun getFontKerning(font: TTFFont): (Bool | None) =>
		if not font.is_null() then
			@TTF_GetFontKerning(font) != 0
		end

	fun setFontKerning(font: TTFFont, allowed: Bool) =>
		if not font.is_null() then
			@TTF_SetFontKerning(font, if allowed then 1 else 0 end)
		end

	fun fontHeight(font: TTFFont): (I32 | None) =>
		if not font.is_null() then
			@TTF_FontHeight(font)
		end

	fun fontAscent(font: TTFFont): (I32 | None) =>
		if not font.is_null() then
			@TTF_FontAscent(font)
		end

	fun fontDescent(font: TTFFont): (I32 | None) =>
		if not font.is_null() then
			@TTF_FontDescent(font)
		end

	fun fontLineSkip(font: TTFFont): (I32 | None) =>
		if not font.is_null() then
			@TTF_FontLineSkip(font)
		end

	fun fontFaceIsFixedWidth(font: TTFFont): (Bool | None) =>
		if not font.is_null() then
			@TTF_FontFaceIsFixedWidth(font) != 0
		end

	fun fontFaceFamilyName(font: TTFFont): (String | None) =>
		if not font.is_null() then
			recover String.from_cstring(@TTF_FontFaceFamilyName(font)) end
		end

	fun fontFaceStyleName(font: TTFFont): (String | None) =>
		if not font.is_null() then
			recover String.from_cstring(@TTF_FontFaceStyleName(font)) end
		end
