use "collections"
use "strings"
use "lib:SDL2"

use @TTF_OpenFont[Pointer[_Font]](file: Pointer[U8] tag, ptsize: I32)
use @TTF_OpenFontIndex[Pointer[_Font]](file: Pointer[U8] tag, ptsize: I32, index: I64)
use @TTF_CloseFont[None](font: Pointer[_Font])


primitive _Font
type TTFFont is Pointer[_Font]
