use "collections"
use "strings"
use "lib:SDL2"

use @TTF_OpenFont[TTFFont](file: Pointer[U8] val, ptsize: I32)


primitive _Font
type TTFFont is Pointer[_Font]
