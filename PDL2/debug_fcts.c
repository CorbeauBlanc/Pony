#include <SDL2/SDL.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int SDL_RenderCopy_d(SDL_Renderer *ren, SDL_Texture *txt, SDL_Rect *src, SDL_Rect *dst)
{
	if (!ren)
		printf("/!\\ No renderer /!\\\n");
	if (!txt)
		printf("/!\\ No texture /!\\\n");
	if (!src)
		printf("/!\\ No source rect /!\\\n");
	else
		printf("src:\nx: %d, y: %d, w: %d, h: %d\n", src->x, src->y, src->w, src->h);
	if (!dst)
		printf("/!\\ No destination rect /!\\\n");
	else
		printf("dst:\nx: %d, y: %d, w: %d, h: %d\n", dst->x, dst->y, dst->w, dst->h);
	return (SDL_RenderCopy(ren, txt, src, dst));
}


void *malloc_event() {
	return (malloc(sizeof(SDL_Event)));
}
