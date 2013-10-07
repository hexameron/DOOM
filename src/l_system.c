/* Emacs style mode select   -*- C++ -*- 
 *-----------------------------------------------------------------------------
 *
 * $Id: l_system.c,v 1.30 1999/10/18 19:16:42 cphipps Exp $
 *
 *  LxDoom, a Doom port for Linux/Unix
 *  based on BOOM, a modified and improved DOOM engine
 *  Copyright (C) 1999 by
 *  id Software, Chi Hoang, Lee Killough, Jim Flynn, Rand Phares, Ty Halderman
 *   and Colin Phipps
 *  
 *  This program is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU General Public License
 *  as published by the Free Software Foundation; either version 2
 *  of the License, or (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 
 *  02111-1307, USA.
 *
 * DESCRIPTION:
 *  Misc system stuff needed by Doom, implemented for Linux.
 *  Mainly timer handling, and ENDOOM/ENDBOOM.
 *
 *-----------------------------------------------------------------------------
 */

static const char
rcsid[] = "$Id: l_system.c,v 1.30 1999/10/18 19:16:42 cphipps Exp $";

#include <stdio.h>

#include <stdarg.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/time.h>
#include <ctype.h>

#include "i_system.h"
#include "i_sound.h"
#include "doomstat.h"
#include "m_misc.h"
#include "g_game.h"
#include "z_zone.h"
#include "w_wad.h"

#ifdef __GNUG__
#pragma implementation "i_system.h"
#endif
#include "i_system.h"

const char system_string[] = 
{ "LxDoom v1.4.1 - By Colin Phipps (see http://lxdoom.linuxgames.com/)" };

ticcmd_t *I_BaseTiccmd(void)
{
  static ticcmd_t emptycmd; // killough
  return &emptycmd;
}

void I_WaitVBL(int count)
{
  // I don't get this, but this comes from the original sources, so...
  usleep((count*1000000)/(2*TICRATE));
}

void I_uSleep(unsigned long usecs)
{
  usleep(usecs);
}

// Most of the following has been rewritten by Lee Killough
// and then by CPhipps
//
// I_GetTime
//

// CPhipps - believe it or not, it is possible with consecutive calls to 
// gettimeofday to receive times out of order, e.g you query the time twice and 
// the second time is earlier than the first. Cheap'n'cheerful fix here.
// NOTE: only occurs with bad kernel drivers loaded, e.g. pc speaker drv

static unsigned long lasttimereply;
static unsigned long basetime;

int I_GetTime_RealTime (void)
{
  struct timeval tv;
  struct timezone tz;
  unsigned long thistimereply;

  gettimeofday(&tv, &tz);

  thistimereply = (tv.tv_sec * TICRATE + (tv.tv_usec * TICRATE) / 1000000);

  // Fix for time problem
  if (!basetime) {
    basetime = thistimereply; thistimereply = 0;
  } else thistimereply -= basetime;

  if (thistimereply < lasttimereply)
    thistimereply = lasttimereply;

  return (lasttimereply = thistimereply);
}

// killough 4/13/98: Make clock rate adjustable by scale factor
int realtic_clock_rate = 100;
static int64_t I_GetTime_Scale = 1<<24;

// CPhipps - static
static int I_GetTime_Scaled(void)
{
  return (int64_t) I_GetTime_RealTime() * I_GetTime_Scale >> 24;
}

static int  I_GetTime_FastDemo(void)
{
  static int fasttic;
  return fasttic++;
}

static int I_GetTime_Error(void)
{
  I_Error("Error: GetTime() used before initialization");
  return 0;
}

int (*I_GetTime)(void) = I_GetTime_Error;     // killough

//
// I_GetRandomTimeSeed
//
// CPhipps - extracted from G_ReloadDefaults because it is O/S based
unsigned long I_GetRandomTimeSeed(void)
{                            // killough 3/26/98: shuffle random seed
  struct timeval tv;         // use the clock to shuffle random seed
  struct timezone tz;
  gettimeofday(&tv,&tz);
  return (tv.tv_sec*1000ul + tv.tv_usec/1000ul);
}


extern int autorun;          // Autorun state
//int leds_always_off;         // Tells it not to update LEDs

#if 0
// CPhipps - unused
void I_Shutdown(void)
{
}
#endif

void I_Init(void)
{
  //  extern int key_autorun;

  // CPhipps - DosDoom doesn't use these different timing systems
  // killough 4/14/98: Adjustable speedup based on realtic_clock_rate
  if (fastdemo)
    I_GetTime = I_GetTime_FastDemo;
  else
    if (realtic_clock_rate != 100)
      {
        I_GetTime_Scale = ((int_64_t) realtic_clock_rate << 24) / 100;
        I_GetTime = I_GetTime_Scaled;
      }
    else
      I_GetTime = I_GetTime_RealTime;

#if 0
  // CPhipps - unused
  atexit(I_Shutdown);
#endif

  { // killough 2/21/98: avoid sound initialization if no sound & no music
    extern boolean nomusicparm, nosfxparm;
    if (!(nomusicparm && nosfxparm))
      I_InitSound();
  }
}

//
// I_Quit
//

static char errmsg[2048];    // buffer of error message -- killough

static int has_exited;

// killough 2/22/98: Add support for ENDBOOM, which is PC-specific

#include "m_random.h"

// this converts BIOS color codes to ANSI codes.  Its not pretty, but it
// does the job - rain
// CPhipps - made static

static inline int convert(int color, int *bold)
{
  if (color > 7) {
    color -= 8;
    *bold = 1;
  }
  switch (color) {
  case 0:
    return 0;
  case 1:
    return 4;
  case 2:
    return 2;
  case 3:
    return 6;
  case 4:
    return 1;
  case 5:
    return 5;
  case 6:
    return 3;
  case 7:
    return 7;
  }
  return 0;
}

// CPhipps - flags controlling ENDOOM behaviour
enum {
  endoom_colours = 1, 
  endoom_nonasciichars = 2, 
  endoom_droplastline = 4
};
unsigned int endoom_mode;

void I_EndDoom(void)
{
  int lump_eb, lump_ed, lump = -1;

  // CPhipps - ENDOOM/ENDBOOM selection
  lump_eb = W_CheckNumForName("ENDBOOM"); //jff 4/1/98 sign our work
  lump_ed = W_CheckNumForName("ENDOOM"); // CPhipps - also maybe ENDOOM

  if (lump_eb == -1) 
    lump = lump_ed;
  else if (lump_ed == -1) 
    lump = lump_eb;
  else { // Both ENDOOM and ENDBOOM are present
#define LUMP_IS_NEW(num) (!((lumpinfo[num].source == source_iwad) || (lumpinfo[num].source == source_auto_load)))
    switch ((LUMP_IS_NEW(lump_ed) ? 1 : 0 ) | 
	    (LUMP_IS_NEW(lump_eb) ? 2 : 0)) {
    case 1:
      lump = lump_ed;
      break;
    case 2:
      lump = lump_eb;
      break;
    default:
      // Both lumps have equal priority, both present
      lump = (P_Random(pr_misc) & 1) ? lump_ed : lump_eb;
      break;
    }
  }

  if (lump != -1)
    {
      const char (*endoom)[2] = W_CacheLumpNum(lump);
      int i, l = W_LumpLength(lump) / 2;

      // cph - colour ENDOOM by rain
      int oldbg = 0, oldcolor = 7, bold = 0, oldbold = 0, color = 0;
      if (endoom_mode & endoom_nonasciichars)
	// switch to secondary charset, and set to cp437
	printf("\e)K\016"); // throws the console into cp437 (IBM charset)

      // cph - optionally drop the last line, so everything fits on one screen
      if (endoom_mode & endoom_droplastline)
	l -= 80;
      putchar('\n');
      for (i=0; i<l; i++)
        {
#ifdef DJGPP
	  textattr(endoom[i][1]);
#else
	  if (endoom_mode & endoom_colours) {
	    if (!(i % 80)) {
	      // reset everything when we start a new line
	      oldbg = 0;
	      oldcolor = 7;
	      printf("\e[0m\n");
	    }
	    // foreground color
	    bold = 0;
	    color = endoom[i][1] % 16;
	    if (color != oldcolor) {
	      oldcolor = color;
	      color = convert(color, &bold);
	      if (oldbold != bold) {
		oldbold = bold;
		oldbg = 0;
	      }
	      // we buffer everything or output is horrendously slow
	      printf("\e[%d;%dm", bold, color + 30);
	      bold = 0;
	    }
	    // background color
	    color = endoom[i][1] / 16; 
	    if (color != oldbg) {
	      oldbg = color;
	      color = convert(color, &bold);
	      printf("\e[%dm", color + 40);
	    }	  // Use ascii codes
	  }
	  // cph - portable ascii printout if requested
	  if (isascii(endoom[i][0]) || (endoom_mode & endoom_nonasciichars))
	    putchar(endoom[i][0]);
	  else // Probably a box character, so do #'s
	    putchar('#');
#endif
        }
      putchar('\b');   // hack workaround for extra newline at bottom of screen
      putchar('\r');
      if (endoom_mode & endoom_nonasciichars)
	putchar('\017'); // restore primary charset
      W_UnlockLumpNum(lump);
    }
  if (endoom_mode & endoom_colours)
    puts("\e[0m"); // cph - reset colours
  puts(system_string);
}

void I_Quit (void)
{
  has_exited=1;   /* Prevent infinitely recursive exits -- killough */

  if (demorecording)
    G_CheckDemoStatus();
  M_SaveDefaults ();

  if (*errmsg)
    fprintf (stderr, "%s\n", errmsg);
  else
    I_EndDoom();
}

//
// I_Error
//

void I_Error(
const
char *error, ...) // killough 3/20/98: add const
{
  if (!*errmsg)   // ignore all but the first message -- killough
    {
      va_list argptr;
      va_start(argptr,error);
      vsprintf(errmsg,error,argptr);
      va_end(argptr);
    }

  if (!has_exited)    // If it hasn't exited yet, exit now -- killough
    {
      has_exited=1;   
      // Prevent infinitely recursive exits -- killough

      exit(-1);
    }
}

//----------------------------------------------------------------------------
//
// $Log: l_system.c,v $
// Revision 1.30  1999/10/18 19:16:42  cphipps
// Version 1.4.1
//
// Revision 1.29  1999/10/12 12:39:56  cphipps
// Changed to GPL, changed header comment
// Removed the remaining old DOSDOOM stuff
//
// Revision 1.28  1999/10/04 18:01:20  cphipps
// Undo last edit
// Add trailing / to url
//
// Revision 1.27  1999/10/04 17:53:28  cphipps
// Made version string track cvs version
//
// Revision 1.26  1999/09/03 21:39:48  cphipps
// Strip some dosdoom stuff
// Update version number
//
// Revision 1.25  1999/06/08 17:26:13  cphipps
// Change long long references to int_64_t's
//
// Revision 1.24  1999/03/26 11:32:16  cphipps
// Increment version number
// Cleaned out some DosDoom stuff
//
// Revision 1.23  1999/03/10 15:14:16  cphipps
// Up version number
// Fix time handling to minimise the likelyhood of overflows
//
// Revision 1.22  1999/02/03 08:56:38  cphipps
// Update version number
//
// Revision 1.21  1999/01/27 19:58:57  cphipps
// Update version number to v1.3.3
//
// Revision 1.20  1999/01/13 10:47:18  cphipps
// New sleep function I_uSleep()
//
// Revision 1.19  1999/01/11 16:05:28  cphipps
// Updated non-ascii character handling
// Use secondary charset instead of primary to avoid wrong codepage
// after lxdoom exits
//
// Revision 1.18  1999/01/02 14:39:37  cphipps
// Update version
// Fancy ENDOOM handling
//
// Revision 1.17  1999/01/01 16:54:19  cphipps
// Add colour ENDOOM display
// Add variable to control ENDOOM display features
//
// Revision 1.16  1998/12/31 19:38:50  cphipps
// Updated wad lump handling
//
// Revision 1.15  1998/12/29 19:27:20  cphipps
// Fix for compiling with DosDoom
// Fix code to choose between ENDOOM and ENDBOOM, and verified it works
//
// Revision 1.14  1998/12/22 21:17:05  cphipps
// Updated ENDOOM/ENDBOOM handling with new logic
//
// Revision 1.13  1998/12/18 19:13:10  cphipps
// Removed redundant cdrom_data_dir
// Fix CPU stuff for DosDoom so needn't include any ASM
//
// Revision 1.12  1998/12/07 10:02:37  cphipps
// Update version string for v1.3.1
//
// Revision 1.11  1998/11/21 13:12:09  cphipps
// Version string updated for LxDoom v1.3.0
//
// Revision 1.10  1998/11/17 16:40:33  cphipps
// Updated to support LxDoom and DosDoom
//
// Revision 1.9  1998/11/05 17:40:21  cphipps
// Fix textattr call to be DJGPP only
//
// Revision 1.8  1998/10/29 11:47:58  cphipps
// Update version to v1.2.0
//
// Revision 1.7  1998/10/23 18:57:17  cphipps
// Changed version string to v1.1.1
//
// Revision 1.6  1998/10/20 07:33:36  cphipps
// Add random number seeding routine
//
// Revision 1.5  1998/10/18 18:52:41  cphipps
// Change version string to v1.1
//
// Revision 1.4  1998/10/16 12:57:04  cphipps
// Remove redundant I_BeginRead & I_EndRead
// Comment out I_Shutdown, as it is unused. Saves atexit slots.
// Make system-specific string constant
// Make some more stuff static
//
// Revision 1.3  1998/10/10 20:33:52  cphipps
// Change version string to 1.1a
// Add patch for kernels with buggy time returns
//
// Revision 1.2  1998/09/23 14:56:11  cphipps
// Added cdrom_data_dir
// Enable ENDBOOM, though without color
// Changed I_WaitVBL to match original Linux sources
// Include Linux sys/time.h
//
// Revision 1.1  1998/09/13 16:49:50  cphipps
// Initial revision
//
// Revision 1.14  1998/05/03  22:33:13  killough
// beautification
//
// Revision 1.13  1998/04/27  01:51:37  killough
// Increase errmsg size to 2048
//
// Revision 1.12  1998/04/14  08:13:39  killough
// Replace adaptive gametics with realtic_clock_rate
//
// Revision 1.11  1998/04/10  06:33:46  killough
// Add adaptive gametic timer
//
// Revision 1.10  1998/04/05  00:51:06  phares
// Joystick support, Main Menu re-ordering
//
// Revision 1.9  1998/04/02  05:02:31  jim
// Added ENDOOM, BOOM.TXT mods
//
// Revision 1.8  1998/03/23  03:16:13  killough
// Change to use interrupt-driver keyboard IO
//
// Revision 1.7  1998/03/18  16:17:32  jim
// Change to avoid Allegro key shift handling bug
//
// Revision 1.6  1998/03/09  07:12:21  killough
// Fix capslock bugs
//
// Revision 1.5  1998/03/03  00:21:41  jim
// Added predefined ENDBETA lump for beta test
//
// Revision 1.4  1998/03/02  11:31:14  killough
// Fix ENDOOM message handling
//
// Revision 1.3  1998/02/23  04:28:14  killough
// Add ENDOOM support, allow no sound FX at all
//
// Revision 1.2  1998/01/26  19:23:29  phares
// First rev with no ^Ms
//
// Revision 1.1.1.1  1998/01/19  14:03:07  rand
// Lee's Jan 19 sources
//
//----------------------------------------------------------------------------
