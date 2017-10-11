#include "cf_PMOD.h"

int	FMOD_Alt_Channel_IsPlaying(FMOD_CHANNEL *channel)
{
	FMOD_BOOL	isplaying;

	return ((FMOD_Channel_IsPlaying(channel, &isplaying) == FMOD_OK) ? isplaying: -1);
}

int	FMOD_Alt_Channel_GetMute(FMOD_CHANNEL *channel)
{
	FMOD_BOOL	mute;

	return ((FMOD_Channel_GetMute(channel, &mute) == FMOD_OK) ? mute: -1);
}

int	FMOD_Alt_Channel_GetPaused(FMOD_CHANNEL *channel)
{
	FMOD_BOOL	paused;

	return ((FMOD_Channel_GetPaused(channel, &paused) == FMOD_OK) ? paused: -1);
}
