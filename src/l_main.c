/* Emacs style mode select   -*- C++ -*- 
 *-----------------------------------------------------------------------------
 *
 * $Id: l_main.c,v 1.10 1999/10/12 13:01:11 cphipps Exp $
 *
 *  Hybrid of the Boom i_main.c and original linuxdoom i_main.c
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
 *      Main program, simply calls D_DoomMain high level entry,
 *      after registering a signal handler.
 *
 *-----------------------------------------------------------------------------
 */

static const char
rcsid[] = "$Id: l_main.c,v 1.10 1999/10/12 13:01:11 cphipps Exp $";

#include "doomdef.h"
#include "m_argv.h"
#include "d_main.h"
#include "i_system.h"
#include "i_video.h"
#include "z_zone.h"

#include <signal.h>
#include <stdio.h>
#include <stdlib.h>

int broken_pipe;

// cleanup handling -- killough:
static void I_SignalHandler(int s)
{
  char buf[2048];

  // CPhipps - report but don't crash on SIGPIPE
  if (s == SIGPIPE) {
    fprintf(stderr, "Broken pipe\n");
    broken_pipe = 1;
    return;
  }

  signal(s,SIG_IGN);  // Ignore future instances of this signal.

  strcpy(buf,
         s==SIGSEGV ? "Segmentation Violation" :
         s==SIGINT  ? "Interrupted by User" :
         s==SIGILL  ? "Illegal Instruction" :
         s==SIGFPE  ? "Floating Point Exception" :
         s==SIGTERM ? "Killed" : "Terminated by signal");

  // If corrupted memory could cause crash, dump memory
  // allocation history, which points out probable causes

//  if (s==SIGSEGV || s==SIGILL || s==SIGFPE)
//    Z_DumpHistory(buf);

  I_Error(buf);
}

void I_Quit(void);

int main(int argc, const char * const * argv)
{
  puts(system_string); // CPhipps - print identifying string
  putchar('\n');

  myargc = argc;
  myargv = argv;

  /*
     killough 1/98:

     This fixes some problems with exit handling
     during abnormal situations.

     The old code called I_Quit() to end program,
     while now I_Quit() is installed as an exit
     handler and exit() is called to exit, either
     normally or abnormally. Seg faults are caught
     and the error handler is used, to prevent
     being left in graphics mode or having very
     loud SFX noise because the sound card is
     left in an unstable state.
  */

  Z_Init();                  // 1/18/98 killough: start up memory stuff first

  atexit(I_Quit);
  signal(SIGSEGV, I_SignalHandler);
  signal(SIGPIPE, I_SignalHandler); // CPhipps - add SIGPIPE, as this is fatal
  signal(SIGTERM, I_SignalHandler);
  signal(SIGILL,  I_SignalHandler);
  signal(SIGFPE,  I_SignalHandler);
  signal(SIGILL,  I_SignalHandler);
  signal(SIGINT,  I_SignalHandler);  // killough 3/6/98: allow CTRL-BRK during init
  signal(SIGABRT, I_SignalHandler);

  /* CPhipps - call to video specific startup code */
  I_PreInitGraphics();

  // 2/2/98 Stan
  // Must call this here.  It's required by both netgames and i_video.c.

  D_DoomMain ();
  return 0;
}


//----------------------------------------------------------------------------
//
// $Log: l_main.c,v $
// Revision 1.10  1999/10/12 13:01:11  cphipps
// Changed header to GPL
//
// Revision 1.9  1999/07/03 13:15:07  cphipps
// Add broken_pipe variable to allow for broken pipe checking
//
// Revision 1.8  1999/06/20 14:04:13  cphipps
// Code cleaning
//
// Revision 1.7  1999/01/11 16:03:37  cphipps
// Fix version string printout
//
// Revision 1.6  1998/11/17 16:40:06  cphipps
// Modified to work for DosDoom and LxDoom
//
// Revision 1.5  1998/10/16 22:20:50  cphipps
// Match argv to myargv in type const char* const *
// Disable dodgy BOOMPATH hack to fix D_DoomExeDir remotely, since it writes argv[0]
//
// Revision 1.4  1998/10/15 20:13:02  cphipps
// Made SIGPIPE non-fatal
//
// Revision 1.3  1998/10/13 11:52:29  cphipps
// Added i_video.h and I_PreInitGraphics call
//
// Revision 1.2  1998/09/23 09:34:53  cphipps
// Added identifying string at startup.
// Add code to patch up myargv[0].
// Cleaned up exit handling
// Removed allegro_init call
//
// Revision 1.1  1998/09/13 16:49:50  cphipps
// Initial revision
//
// Revision 1.8  1998/05/15  00:34:03  killough
// Remove unnecessary crash hack
//
// Revision 1.7  1998/05/13  22:58:04  killough
// Restore Doom bug compatibility for demos
//
// Revision 1.6  1998/05/03  22:38:36  killough
// beautification
//
// Revision 1.5  1998/04/27  02:03:11  killough
// Improve signal handling, to use Z_DumpHistory()
//
// Revision 1.4  1998/03/09  07:10:47  killough
// Allow CTRL-BRK during game init
//
// Revision 1.3  1998/02/03  01:32:58  stan
// Moved __djgpp_nearptr_enable() call from I_video.c to i_main.c
//
// Revision 1.2  1998/01/26  19:23:24  phares
// First rev with no ^Ms
//
// Revision 1.1.1.1  1998/01/19  14:02:57  rand
// Lee's Jan 19 sources
//
//----------------------------------------------------------------------------
