//-----------------------------------------------------------------------------
//
// $Id:$
//
// Copyright (C) 1993-1996 by id Software, Inc.
//
// This source is available for distribution and/or modification
// only under the terms of the DOOM Source Code License as
// published by id Software. All rights reserved.
//
// The source is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
// for more details.
//
// $Log:$
//
// DESCRIPTION:
//	System interface for sound.
//
//-----------------------------------------------------------------------------

static const char
rcsid[] = "$Id: i_unix.c,v 1.5 1997/02/03 22:45:10 b1 Exp $";

#include <math.h>
#include <unistd.h>

#include "SDL.h"
#include "SDL_audio.h"
#include "SDL_mutex.h"
#include "SDL_byteorder.h"
#include "SDL_version.h"

#include "z_zone.h"

#include "m_swap.h"
#include "i_system.h"
#include "i_sound.h"
#include "m_argv.h"
#include "m_misc.h"
#include "w_wad.h"
#include "lprintf.h"

#include "doomdef.h"
#include "doomstat.h"
#include "doomtype.h"

#include "d_main.h"

/* Define this if you want to use the MIDI music support */
#define HAVE_MIXER

// Increase samplecount with samplerate
#define SAMPLECOUNT 1024
#define NUM_CHANNELS 8

// 22050 stereo or 44100 mono
#define SAMPLERATE 22050		

// The actual lengths of all sound effects.
int 		lengths[NUMSFX];

//external
int snd_card = 1;
int mus_card = 1;
int detect_voices = 0;

//
// This function loads the sound data from the WAD lump,
//  for single sound.
//
void* getsfx( const char* sfxname, int* len )
{
    unsigned char	*sfx, *srcfx, *paddedsfx;
    int                 i;
    int                 size;
    int                 paddedsize;
    char                name[20];
    int                 sfxlump;
    int16_t		s, t, *upsamps;

    
    // Get the sound data from the WAD, allocate lump
    //  in zone memory.
    sprintf(name, "ds%s", sfxname);

    // Now, there is a severe problem with the
    //  sound handling, in it is not (yet/anymore)
    //  gamemode aware. That means, sounds from
    //  DOOM II will be requested even with DOOM
    //  shareware.
    // The sound list is wired into sounds.c,
    //  which sets the external variable.
    // I do not do runtime patches to that
    //  variable. Instead, we will use a
    //  default sound for replacement.
    if ( W_CheckNumForName(name) == -1 )
      sfxlump = W_GetNumForName("dspistol");
    else
      sfxlump = W_GetNumForName(name);
    
    size = W_LumpLength( sfxlump );

    // Debug.
    // fprintf( stderr, "." );
    //fprintf( stderr, " -loading  %s (lump %d, %d bytes)\n",
    //	     sfxname, sfxlump, size );
    //fflush( stderr );
    
    sfx = (unsigned char*)W_CacheLumpNum(sfxlump);

    // upsample to 16 bit x 44.1Khz (playback is 22khz stereo)
    paddedsize = (size  * 8);

    // Allocate from zone memory.
    paddedsfx = (unsigned char*)Z_Malloc( paddedsize+8, PU_STATIC, 0 );
    paddedsfx += 8;

    // Now copy and upsample
    upsamps = (int16_t *)(paddedsfx);
    srcfx = sfx + 8;
    for (i = 9; i < size; i++)
    {
      s = (255<<5) - (*srcfx<<6);
      srcfx++;
      t = (255<<5) - (*srcfx<<6);
      *upsamps++ = s << 2;
      *upsamps++ = s << 2;
      *upsamps++ = s * 3 + t;
      *upsamps++ = s + 3 * t;
    }
    *upsamps++ = t << 2;
    *upsamps++ = t << 2;
    *upsamps++ = t * 3;
    *upsamps++ = t;

    // Remove the cached lump.
    Z_Free( sfx );
    
    // Actual data length
    *len = (size - 8) * 8;

    // Return allocated padded data.
    return (void *) (paddedsfx);
}

//
// This function adds a sound to the
//  list of currently active sounds,
//  which is maintained as a given number
//  (eight, usually) of internal channels.
// Returns a handle.
//
int addsfx( int sfxid, int volume, int step, int seperation )
{
    static unsigned short	handlenum = 3;
 
    int		i;
    int		rc;
    
    int		slot;
    uint8_t	left, right;

    slot = -1;

    /* Stopping samples in mid-stream is bad.
     * needed for chainsaw/chaingun
     * Let everything else run to end */
    // Chainsaw troubles.
    // Play these sound effects only one at a time.
    if ( sfxid == sfx_sawup
	|| sfxid == sfx_sawidl
	|| sfxid == sfx_sawful
	|| sfxid == sfx_sawhit )
	  slot = 0;
    if ( sfxid == sfx_stnmov )
	  slot = 1;
    if ( sfxid == sfx_pistol )
          slot = 2;	
    if (slot = -1) {
	for (i = 3; i < NUM_CHANNELS; i++)
	{
		handlenum++;
		if (handlenum >= NUM_CHANNELS) handlenum = 3;
		if (!Mix_Playing(handlenum)){
			slot = handlenum;
			break;
		}
	}
    } else {
        Mix_HaltChannel(slot);
    }
    if (-1 == slot) return 99;

    seperation -= 1; // 0-FF
    left = (uint8_t)(((0xffff - seperation * seperation) * volume)>>12);
    seperation = 0xff - seperation;
    right = (uint8_t)(((0xffff - seperation * seperation) * volume)>>12);

    Mix_SetPanning(slot, left, right);
    Mix_PlayChannel(slot, S_sfx[sfxid].chunk, 0);

    return slot;
}

//
// SFX API
// Note: this was called by S_Init.
// However, whatever they did in the
// old DPMS based DOS version, this
// were simply dummies in the Linux
// version.
// See soundserver initdata().
//
void I_SetChannels(){}	
 
void I_SetSfxVolume(int volume)
{
  // Identical to DOS.
  // Basically, this should propagate
  //  the menu/config file setting
  //  to the state variable used in
  //  the mixing.
  snd_SfxVolume = volume;
}

//
// Retrieve the raw data lump index
//  for a given SFX name.
//
int I_GetSfxLumpNum(sfxinfo_t* sfx)
{
    char namebuf[9];
    sprintf(namebuf, "ds%s", sfx->name);
    return W_GetNumForName(namebuf);
}

//
// Starting a sound means adding it
//  to the current list of active sounds
//  in the internal channels.
// As the SFX info struct contains
//  e.g. a pointer to the raw data,
//  it is ignored.
// As our sound handling does not handle
//  priority, it is ignored.
// Pitching (that is, increased speed of playback)
//  is set, but currently not used by mixing.
//
int
I_StartSound
( int		id,
  int		vol,
  int		sep,
  int		pitch,
  int		priority )
{
    return addsfx( id, vol, pitch, sep );
}

void I_StopSound (int handle)
{
    if (99 == handle) return;
    //Mix_HaltChannel(handle);
}


boolean I_SoundIsPlaying(int handle)
{
    if (99 == handle) return false;
    return 0 < Mix_Playing(handle) ;
}

void I_UpdateSoundParams(int handle, int vol, int sep, int pitch)
{
  // Should update position over time
  // UNUSED.
  handle = vol = sep = pitch = 0;
}

void I_ShutdownSound(void)
{
  int i;    
  I_ShutdownMusic();
  Mix_HaltChannel(-1);
  for (i=0 ; i<NUMSFX ; i++)
    Mix_FreeChunk( S_sfx[i].chunk );
  SDL_CloseAudio();
}


void I_InitSound()
{ 
  int i;
  
  fprintf( stderr, "I_InitSound: ");
  SDL_Init(SDL_INIT_AUDIO);
  I_InitMusic();
  Mix_AllocateChannels(NUM_CHANNELS);
  Mix_ReserveChannels(3);

  // Initialize external data (all sounds) at start, keep static.
 
  for (i=1 ; i<NUMSFX ; i++)
  { 
    // Alias? Example is the chaingun sound linked to pistol.
    if (!S_sfx[i].link)
    {
      // Load data from WAD file.
      S_sfx[i].data = getsfx( S_sfx[i].name, &lengths[i] );

      // Samples now 16bit LE stereo, upsampled to double length and padded
      S_sfx[i].chunk = Mix_QuickLoad_RAW( S_sfx[i].data, lengths[i] );
    }	
    else
    {
      // Previously loaded already?
      S_sfx[i].data = S_sfx[i].link->data;
      lengths[i] = lengths[(S_sfx[i].link - S_sfx)/sizeof(sfxinfo_t)];
      S_sfx[i].chunk = Mix_QuickLoad_RAW( S_sfx[i].data, lengths[i] );
    }
  }

  fprintf( stderr, " pre-cached all sound data\n");
  
  // Finished initialization.
  fprintf(stderr, "I_InitSound: sound module ready\n");
  SDL_PauseAudio(0);
}

//
// MUSIC API.
//

#include "SDL/SDL_mixer.h"
#include "qmus2mid.h"

#define MIDI_TMPFILE "/tmp/lxdoom.midi"

static Mix_Music *music[2] = { NULL, NULL };

void I_ShutdownMusic(void) 
{
  /* TODO */
//  extern void close_music(void);

//  close_music();
}

void I_InitMusic(void)
{
  if (Mix_OpenAudio(SAMPLERATE,AUDIO_S16LSB,2,SAMPLECOUNT) < 0) {
    fprintf(stderr, "Unable to open music: %s\n", Mix_GetError());
  }
}

void I_PlaySong(int handle, int looping)
{
  printf("Playing song %d (%d loops)\n", handle, looping);
  if ( music[handle] ) {
    Mix_FadeInMusic(music[handle], looping ? -1 : 0, 500);
  }
}

extern int mus_pause_opt; // From m_misc.c

void I_PauseSong (int handle)
{
  switch(mus_pause_opt) {
  case 0:
//printf("Stopping song %d (pause)\n", handle);
    I_StopSong(handle);
    break;
  case 1:
//printf("Pausing song %d (pause)\n", handle);
    Mix_PauseMusic();
    break;
  }
  // Default - let music continue
}

void I_ResumeSong (int handle)
{
//printf("Resuming song %d\n", handle);
  Mix_ResumeMusic();
}

void I_StopSong(int handle)
{
//printf("Stopping song %d\n", handle);
  Mix_FadeOutMusic(500);
}

void I_UnRegisterSong(int handle)
{
//printf("Unregistering song %d\n", handle);
  if ( music[handle] ) {
    Mix_FreeMusic(music[handle]);
    music[handle] = NULL;
  }
  unlink(MIDI_TMPFILE);
}

int I_RegisterSong(void* data, size_t len)
{
  FILE *midfile;

  midfile = fopen(MIDI_TMPFILE, "wb");
  if ( midfile == NULL ) {
    printf("Couldn't write MIDI to %s\n", MIDI_TMPFILE);
    return 0;
  }
  /* Convert MUS chunk to MIDI? */
  if ( memcmp(data, "MUS", 3) == 0 ) {
    qmus2mid(data, len, midfile, 1, 0, 0, 0);
  } else {
    fwrite(data, len, 1, midfile);
  }
  fclose(midfile);

  Mix_SetMusicCMD(SDL_getenv("MUSIC_CMD"));
  music[0] = Mix_LoadMUS(MIDI_TMPFILE);
  if ( music[0] == NULL ) {
    printf("Couldn't load %s because: %s\n", MIDI_TMPFILE, Mix_GetError());
  }
  return (0);
}

void I_SetMusicVolume(int volume)
{
  Mix_VolumeMusic(volume*8);
}
