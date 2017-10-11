#include "cf_PMOD.h"

FMOD_SYSTEM	*FMOD_Alt_System_Create()
{
	FMOD_SYSTEM	*system = NULL;

	return (FMOD_System_Create(&system) != FMOD_OK ? NULL : system);
}
