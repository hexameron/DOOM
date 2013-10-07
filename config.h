/* config.h.  Generated automatically by configure.  */
/* config.h.in.  Generated automatically from configure.in by autoheader.  */

/* Define as __inline if that's what the C compiler calls it.  */
/* #undef inline */

/* Define to `unsigned' if <sys/types.h> doesn't define.  */
/* #undef size_t */

/* Define if you have the ANSI C header files.  */
#define STDC_HEADERS 1

/* Define if your processor stores words with the most significant
   byte first (like Motorola and SPARC, unlike Intel and VAX).  */
/* #undef WORDS_BIGENDIAN */

/* Define if the X Window System is missing or not being used.  */
#define X_DISPLAY_MISSING 1

/* Define to strcasecmp, if we have it */
#define stricmp strcasecmp

/* Define to strncasecmp, if we have it */
#define strnicmp strncasecmp

/* Define for gnu-linux target */
#define LINUX 1

/* Define for freebsd target */
/* #undef FREEBSD */

/* Define on I386 target */
/* #undef I386 */

/* Define on big endian target */
/* #undef __BIG_ENDIAN__ */

/* Define for high resolution support */
#define HIGHRES 1

/* Define to enable internal range checking */
/* #undef RANGECHECK */

/* Define this to see real-time memory allocation
 * statistics, and enable extra debugging features 
 */
/* #undef INSTRUMENTED */

/* Uncomment this to exhaustively run memory checks
 * while the game is running (this is EXTREMELY slow).
 * Only useful if INSTRUMENTED is also defined.
 */
/* #undef CHECKHEAP */

/* Uncomment this to perform id checks on zone blocks,
 * to detect corrupted and illegally freed blocks
 */
#define ZONEIDCHECK 1

/* CPhipps - some debugging macros for the new wad lump handling code */
/* Defining this causes quick checks which only impose an overhead if a 
 *  posible error is detected. */
#define SIMPLECHECKS 1

/* Defining this causes time stamps to be created each time a lump is locked, and 
 *  lumps locked for long periods of time are reported */
/* #undef TIMEDIAG */

/* Define to be the path where Doom WADs are stored */
#define DOOMWADDIR "/usr/local/share/games/doom"

/* Define to be the path to the sound server */
#define SNDSERV_PATH "/usr/local/games/sndserv"

/* Define to be the path to the lxmusserver */
#define MUSSERV_PATH "/usr/local/games/musserv"

/* Define if you have library -lXext */
#define HAVE_LIBXEXT 1

/* Define if you have the <linux/joystick.h> header file.  */
#define HAVE_LINUX_JOYSTICK_H 1

/* Define if you have the <linux/soundcard.h> header file.  */
#define HAVE_LINUX_SOUNDCARD_H 1

/* Define if you have the <machine/soundcard.h> header file.  */
/* #undef HAVE_MACHINE_SOUNDCARD_H */

/* Define if you have the <sys/soundcard.h> header file.  */
#define HAVE_SYS_SOUNDCARD_H 1

/* Define if you have the m library (-lm).  */
#define HAVE_LIBM 1

/* Name of package */
#define PACKAGE "lxdoom"

/* Version number of package */
#define VERSION "1.4.1"

