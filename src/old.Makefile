# Generated automatically from Makefile.in by configure.
# Makefile.in generated automatically by automake 1.4 from Makefile.am

# Copyright (C) 1994, 1995-8, 1999 Free Software Foundation, Inc.
# This Makefile.in is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.

#
# automake Makefile.am for the LxDoom source directory
#
# $Id: Makefile.am,v 1.3 1999/10/02 15:00:48 cphipps Exp $
#
# Process this file with automake to produce Makefile.in
#
#


SHELL = /bin/sh

srcdir = .
top_srcdir = ..
prefix = /usr/local
exec_prefix = /usr/local

bindir = ${exec_prefix}/bin
sbindir = ${exec_prefix}/sbin
libexecdir = ${exec_prefix}/libexec
datadir = ${prefix}/share
sysconfdir = ${prefix}/etc
sharedstatedir = ${prefix}/com
localstatedir = ${prefix}/var
libdir = ${exec_prefix}/lib
infodir = ${prefix}/info
mandir = ${prefix}/man
includedir = ${prefix}/include
oldincludedir = /usr/include

DESTDIR =

pkgdatadir = $(datadir)/lxdoom
pkglibdir = $(libdir)/lxdoom
pkgincludedir = $(includedir)/lxdoom

top_builddir = ..

ACLOCAL = /root/lxdoom-1.4.1/missing aclocal
AUTOCONF = /root/lxdoom-1.4.1/missing autoconf
AUTOMAKE = /root/lxdoom-1.4.1/missing automake
AUTOHEADER = /root/lxdoom-1.4.1/missing autoheader

INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL} $(AM_INSTALL_PROGRAM_FLAGS)
INSTALL_DATA = ${INSTALL} -m 644
INSTALL_SCRIPT = ${INSTALL_PROGRAM}
transform = s,x,x,

NORMAL_INSTALL = :
PRE_INSTALL = :
POST_INSTALL = :
NORMAL_UNINSTALL = :
PRE_UNINSTALL = :
POST_UNINSTALL = :
build_alias = arm-unknown-linux-gnu
build_triplet = arm-unknown-linux-gnu
host_alias = arm-unknown-linux-gnu
host_triplet = arm-unknown-linux-gnu
target_alias = arm-unknown-linux-gnu
target_triplet = arm-unknown-linux-gnu
BUILD_LSDOOM = 
BUILD_LXDOOM = 
BUILD_SDLDOOM = lsdldoom
BUILD_SNDSERV = sndserv
CC = gcc
LIB_XDGA = 
LIB_XEXT = -lXext
MAKEINFO = /root/lxdoom-1.4.1/missing makeinfo
MIXER_CFLAGS = 
MIXER_LIBS = 
PACKAGE = lxdoom
SDL_CFLAGS = -I/usr/include/SDL -D_GNU_SOURCE=1 -D_REENTRANT
SDL_CONFIG = /usr/bin/sdl-config
SDL_LIBS = -L/usr/lib/arm-linux-gnueabihf -lSDL
VERSION = 1.4.1

gamesdir = $(prefix)/games
EXTRA_PROGRAMS = lsdldoom lsdoom lxdoom sndserv
games_PROGRAMS = lsdldoom   sndserv lxdoom-game-server
EXTRA_DIST = makefile.pre-ac
#ASMS = drawspan.s drawcol.s
ASMS = 
#SYS_CFLAGS = -m486 -fomit-frame-pointer
SYS_CFLAGS = 

CFLAGS =  -I/usr/include/SDL -D_GNU_SOURCE=1 -D_REENTRANT  -g -O2 -ffast-math $(SYS_CFLAGS) -Wall -Winline -Wcast-align -Wwrite-strings

sndserv_SOURCES = version.c l_soundsrv.c sounds.c l_soundgen.c l_soundsrv.h l_soundgen.h
sndserv_LDADD = 

lxdoom_game_server_SOURCES = d_server.c l_udp.c protocol.h
lxdoom_game_server_LDADD = 

COMMON_SRC =   am_map.c       g_game.c           p_maputl.h       r_plane.h    am_map.h       g_game.h           p_mobj.c         r_segs.c     hu_lib.c       lprintf.c          p_mobj.h         r_segs.h     d_client.c     hu_lib.h           lprintf.h        p_plats.c   r_sky.c	     d_deh.c        hu_stuff.c         m_argv.c         p_pspr.c    r_sky.h	     d_deh.h        hu_stuff.h         m_argv.h         p_pspr.h    r_state.h    d_englsh.h     i_joy.h            m_bbox.c         p_saveg.c   r_things.c   d_event.h      i_net.h            m_bbox.h         p_saveg.h   r_things.h   d_items.c      i_network.h        m_cheat.c        p_setup.c   s_sound.c    d_items.h      i_sound.h          m_cheat.h        p_setup.h   s_sound.h    d_main.c       i_system.h         m_fixed.h        p_sight.c   sounds.c     d_main.h       i_video.h          m_menu.c         p_spec.c    sounds.h     info.c         m_menu.h           p_spec.h         st_lib.c     d_net.h        info.h             m_misc.c         p_switch.c  st_lib.h     d_player.h     l_joy.c            m_misc.h         p_telept.c  st_stuff.c   m_random.c     p_tick.c           st_stuff.h       l_main.c     d_think.h      m_random.h         p_tick.h         tables.c     d_ticcmd.h     m_swap.h           p_user.c         tables.h    l_system.c   doomdata.h     p_ceilng.c         p_user.h         v_video.c    doomdef.c      p_doors.c          protocol.h       v_video.h    doomdef.h      p_enemy.c          r_bsp.c          version.c    doomstat.c     p_enemy.h          r_bsp.h          version.h    doomstat.h     p_floor.c          r_data.c         w_wad.c	 doomtype.h     p_genlin.c         r_data.h         w_wad.h	 dstrings.c     l_udp.c            p_inter.c        r_defs.h    wi_stuff.c   dstrings.h     p_inter.h          r_draw.c         wi_stuff.h   f_finale.c     p_lights.c         r_draw.h         z_bmalloc.c  f_finale.h     p_map.c            r_main.c         z_bmalloc.h  f_wipe.c       p_map.h            r_main.h         z_zone.c     f_wipe.h       p_maputl.c         r_plane.c        z_zone.h    $(ASMS)


lxdoom_SOURCES = l_video_trans.h   l_video_trans.c  l_video_x.c l_sound.c $(COMMON_SRC)
lsdoom_SOURCES = l_video_svgalib.c l_sound.c $(COMMON_SRC)
lsdldoom_SOURCES = l_video_trans.h l_video_trans.c l_video_sdl.c l_sound_sdl.c qmus2mid.c qmus2mid.h $(COMMON_SRC)

lxdoom_LDADD =   -lX11  -lXext 
lsdoom_LDADD = -lvga
lsdldoom_LDADD = -lSDL -lpthread 

EXTRA_lxdoom_SOURCES = $(ASMS)
mkinstalldirs = $(SHELL) $(top_srcdir)/mkinstalldirs
CONFIG_HEADER = ../config.h
CONFIG_CLEAN_FILES = 
PROGRAMS =  $(games_PROGRAMS)


DEFS = -DHAVE_CONFIG_H -I. -I$(srcdir) -I..
CPPFLAGS = 
LDFLAGS = 
LIBS = -lm   
X_CFLAGS = 
X_LIBS = 
X_EXTRA_LIBS = 
X_PRE_LIBS = 
#lsdldoom_OBJECTS =  l_video_trans.o l_video_sdl.o \
#l_sound_sdl.o qmus2mid.o am_map.o g_game.o p_mobj.o \
#r_segs.o hu_lib.o lprintf.o d_client.o p_plats.o r_sky.o \
#d_deh.o hu_stuff.o m_argv.o p_pspr.o m_bbox.o p_saveg.o \
#r_things.o d_items.o m_cheat.o p_setup.o s_sound.o \
#d_main.o p_sight.o sounds.o m_menu.o p_spec.o info.o \
#st_lib.o m_misc.o p_switch.o l_joy.o p_telept.o \
#st_stuff.o m_random.o p_tick.o l_main.o tables.o \
#p_user.o l_system.o p_ceilng.o v_video.o doomdef.o \
#p_doors.o p_enemy.o r_bsp.o version.o doomstat.o \
#p_floor.o r_data.o w_wad.o p_genlin.o dstrings.o l_udp.o \
#p_inter.o wi_stuff.o r_draw.o f_finale.o p_lights.o \
#z_bmalloc.o p_map.o r_main.o f_wipe.o z_zone.o \
#p_maputl.o r_plane.o drawspan.o drawcol.o
lsdldoom_OBJECTS =  l_video_trans.o l_video_sdl.o \
l_sound_sdl.o qmus2mid.o am_map.o g_game.o p_mobj.o \
r_segs.o hu_lib.o lprintf.o d_client.o p_plats.o \
r_sky.o d_deh.o hu_stuff.o m_argv.o p_pspr.o m_bbox.o \
p_saveg.o r_things.o d_items.o m_cheat.o p_setup.o \
s_sound.o d_main.o p_sight.o sounds.o m_menu.o p_spec.o \
info.o st_lib.o m_misc.o p_switch.o l_joy.o p_telept.o \
st_stuff.o m_random.o p_tick.o l_main.o tables.o \
p_user.o l_system.o p_ceilng.o v_video.o doomdef.o \
p_doors.o p_enemy.o r_bsp.o version.o doomstat.o \
p_floor.o r_data.o w_wad.o p_genlin.o dstrings.o \
l_udp.o p_inter.o wi_stuff.o r_draw.o f_finale.o \
p_lights.o z_bmalloc.o p_map.o r_main.o f_wipe.o \
z_zone.o p_maputl.o r_plane.o
lsdldoom_DEPENDENCIES = 
lsdldoom_LDFLAGS = 
#lsdoom_OBJECTS =  l_video_svgalib.o l_sound.o am_map.o \
#g_game.o p_mobj.o r_segs.o hu_lib.o lprintf.o d_client.o \
#p_plats.o r_sky.o d_deh.o hu_stuff.o m_argv.o p_pspr.o \
#m_bbox.o p_saveg.o r_things.o d_items.o m_cheat.o \
#p_setup.o s_sound.o d_main.o p_sight.o sounds.o m_menu.o \
#p_spec.o info.o st_lib.o m_misc.o p_switch.o l_joy.o \
#p_telept.o st_stuff.o m_random.o p_tick.o l_main.o \
#tables.o p_user.o l_system.o p_ceilng.o v_video.o \
#doomdef.o p_doors.o p_enemy.o r_bsp.o version.o \
#doomstat.o p_floor.o r_data.o w_wad.o p_genlin.o \
#dstrings.o l_udp.o p_inter.o wi_stuff.o r_draw.o \
#f_finale.o p_lights.o z_bmalloc.o p_map.o r_main.o \
#f_wipe.o z_zone.o p_maputl.o r_plane.o drawspan.o \
#drawcol.o
lsdoom_OBJECTS =  l_video_svgalib.o l_sound.o am_map.o \
g_game.o p_mobj.o r_segs.o hu_lib.o lprintf.o \
d_client.o p_plats.o r_sky.o d_deh.o hu_stuff.o \
m_argv.o p_pspr.o m_bbox.o p_saveg.o r_things.o \
d_items.o m_cheat.o p_setup.o s_sound.o d_main.o \
p_sight.o sounds.o m_menu.o p_spec.o info.o st_lib.o \
m_misc.o p_switch.o l_joy.o p_telept.o st_stuff.o \
m_random.o p_tick.o l_main.o tables.o p_user.o \
l_system.o p_ceilng.o v_video.o doomdef.o p_doors.o \
p_enemy.o r_bsp.o version.o doomstat.o p_floor.o \
r_data.o w_wad.o p_genlin.o dstrings.o l_udp.o \
p_inter.o wi_stuff.o r_draw.o f_finale.o p_lights.o \
z_bmalloc.o p_map.o r_main.o f_wipe.o z_zone.o \
p_maputl.o r_plane.o
lsdoom_DEPENDENCIES = 
lsdoom_LDFLAGS = 
#lxdoom_OBJECTS =  l_video_trans.o l_video_x.o l_sound.o \
#am_map.o g_game.o p_mobj.o r_segs.o hu_lib.o lprintf.o \
#d_client.o p_plats.o r_sky.o d_deh.o hu_stuff.o m_argv.o \
#p_pspr.o m_bbox.o p_saveg.o r_things.o d_items.o \
#m_cheat.o p_setup.o s_sound.o d_main.o p_sight.o \
#sounds.o m_menu.o p_spec.o info.o st_lib.o m_misc.o \
#p_switch.o l_joy.o p_telept.o st_stuff.o m_random.o \
#p_tick.o l_main.o tables.o p_user.o l_system.o \
#p_ceilng.o v_video.o doomdef.o p_doors.o p_enemy.o \
#r_bsp.o version.o doomstat.o p_floor.o r_data.o w_wad.o \
#p_genlin.o dstrings.o l_udp.o p_inter.o wi_stuff.o \
#r_draw.o f_finale.o p_lights.o z_bmalloc.o p_map.o \
#r_main.o f_wipe.o z_zone.o p_maputl.o r_plane.o \
#drawspan.o drawcol.o
lxdoom_OBJECTS =  l_video_trans.o l_video_x.o l_sound.o \
am_map.o g_game.o p_mobj.o r_segs.o hu_lib.o lprintf.o \
d_client.o p_plats.o r_sky.o d_deh.o hu_stuff.o \
m_argv.o p_pspr.o m_bbox.o p_saveg.o r_things.o \
d_items.o m_cheat.o p_setup.o s_sound.o d_main.o \
p_sight.o sounds.o m_menu.o p_spec.o info.o st_lib.o \
m_misc.o p_switch.o l_joy.o p_telept.o st_stuff.o \
m_random.o p_tick.o l_main.o tables.o p_user.o \
l_system.o p_ceilng.o v_video.o doomdef.o p_doors.o \
p_enemy.o r_bsp.o version.o doomstat.o p_floor.o \
r_data.o w_wad.o p_genlin.o dstrings.o l_udp.o \
p_inter.o wi_stuff.o r_draw.o f_finale.o p_lights.o \
z_bmalloc.o p_map.o r_main.o f_wipe.o z_zone.o \
p_maputl.o r_plane.o
lxdoom_DEPENDENCIES = 
lxdoom_LDFLAGS = 
sndserv_OBJECTS =  version.o l_soundsrv.o sounds.o l_soundgen.o
sndserv_DEPENDENCIES = 
sndserv_LDFLAGS = 
lxdoom_game_server_OBJECTS =  d_server.o l_udp.o
lxdoom_game_server_DEPENDENCIES = 
lxdoom_game_server_LDFLAGS = 
COMPILE = $(CC) $(DEFS) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
CCLD = $(CC)
LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(LDFLAGS) -o $@
DIST_COMMON =  Makefile.am Makefile.in


DISTFILES = $(DIST_COMMON) $(SOURCES) $(HEADERS) $(TEXINFOS) $(EXTRA_DIST)

TAR = gtar
GZIP_ENV = --best
SOURCES = $(lsdldoom_SOURCES) $(lsdoom_SOURCES) $(lxdoom_SOURCES) $(EXTRA_lxdoom_SOURCES) $(sndserv_SOURCES) $(lxdoom_game_server_SOURCES)
OBJECTS = $(lsdldoom_OBJECTS) $(lsdoom_OBJECTS) $(lxdoom_OBJECTS) $(sndserv_OBJECTS) $(lxdoom_game_server_OBJECTS)

all: all-redirect
.SUFFIXES:
.SUFFIXES: .S .c .o .s
$(srcdir)/Makefile.in: Makefile.am $(top_srcdir)/configure.in $(ACLOCAL_M4) 
	cd $(top_srcdir) && $(AUTOMAKE) --gnu --include-deps src/Makefile

Makefile: $(srcdir)/Makefile.in  $(top_builddir)/config.status
	cd $(top_builddir) \
	  && CONFIG_FILES=$(subdir)/$@ CONFIG_HEADERS= $(SHELL) ./config.status


mostlyclean-gamesPROGRAMS:

clean-gamesPROGRAMS:
	-test -z "$(games_PROGRAMS)" || rm -f $(games_PROGRAMS)

distclean-gamesPROGRAMS:

maintainer-clean-gamesPROGRAMS:

install-gamesPROGRAMS: $(games_PROGRAMS)
	@$(NORMAL_INSTALL)
	$(mkinstalldirs) $(DESTDIR)$(gamesdir)
	@list='$(games_PROGRAMS)'; for p in $$list; do \
	  if test -f $$p; then \
	    echo "  $(INSTALL_PROGRAM) $$p $(DESTDIR)$(gamesdir)/`echo $$p|sed 's/$(EXEEXT)$$//'|sed '$(transform)'|sed 's/$$/$(EXEEXT)/'`"; \
	     $(INSTALL_PROGRAM) $$p $(DESTDIR)$(gamesdir)/`echo $$p|sed 's/$(EXEEXT)$$//'|sed '$(transform)'|sed 's/$$/$(EXEEXT)/'`; \
	  else :; fi; \
	done

uninstall-gamesPROGRAMS:
	@$(NORMAL_UNINSTALL)
	list='$(games_PROGRAMS)'; for p in $$list; do \
	  rm -f $(DESTDIR)$(gamesdir)/`echo $$p|sed 's/$(EXEEXT)$$//'|sed '$(transform)'|sed 's/$$/$(EXEEXT)/'`; \
	done

.c.o:
	$(COMPILE) -c $<

.s.o:
	$(COMPILE) -c $<

.S.o:
	$(COMPILE) -c $<

mostlyclean-compile:
	-rm -f *.o core *.core

clean-compile:

distclean-compile:
	-rm -f *.tab.c

maintainer-clean-compile:

lsdldoom: $(lsdldoom_OBJECTS) $(lsdldoom_DEPENDENCIES)
	@rm -f lsdldoom
	$(LINK) $(lsdldoom_LDFLAGS) $(lsdldoom_OBJECTS) $(lsdldoom_LDADD) $(LIBS)

lsdoom: $(lsdoom_OBJECTS) $(lsdoom_DEPENDENCIES)
	@rm -f lsdoom
	$(LINK) $(lsdoom_LDFLAGS) $(lsdoom_OBJECTS) $(lsdoom_LDADD) $(LIBS)

lxdoom: $(lxdoom_OBJECTS) $(lxdoom_DEPENDENCIES)
	@rm -f lxdoom
	$(LINK) $(lxdoom_LDFLAGS) $(lxdoom_OBJECTS) $(lxdoom_LDADD) $(LIBS)

sndserv: $(sndserv_OBJECTS) $(sndserv_DEPENDENCIES)
	@rm -f sndserv
	$(LINK) $(sndserv_LDFLAGS) $(sndserv_OBJECTS) $(sndserv_LDADD) $(LIBS)

lxdoom-game-server: $(lxdoom_game_server_OBJECTS) $(lxdoom_game_server_DEPENDENCIES)
	@rm -f lxdoom-game-server
	$(LINK) $(lxdoom_game_server_LDFLAGS) $(lxdoom_game_server_OBJECTS) $(lxdoom_game_server_LDADD) $(LIBS)

tags: TAGS

ID: $(HEADERS) $(SOURCES) $(LISP)
	list='$(SOURCES) $(HEADERS)'; \
	unique=`for i in $$list; do echo $$i; done | \
	  awk '    { files[$$0] = 1; } \
	       END { for (i in files) print i; }'`; \
	here=`pwd` && cd $(srcdir) \
	  && mkid -f$$here/ID $$unique $(LISP)

TAGS:  $(HEADERS) $(SOURCES)  $(TAGS_DEPENDENCIES) $(LISP)
	tags=; \
	here=`pwd`; \
	list='$(SOURCES) $(HEADERS)'; \
	unique=`for i in $$list; do echo $$i; done | \
	  awk '    { files[$$0] = 1; } \
	       END { for (i in files) print i; }'`; \
	test -z "$(ETAGS_ARGS)$$unique$(LISP)$$tags" \
	  || (cd $(srcdir) && etags $(ETAGS_ARGS) $$tags  $$unique $(LISP) -o $$here/TAGS)

mostlyclean-tags:

clean-tags:

distclean-tags:
	-rm -f TAGS ID

maintainer-clean-tags:

distdir = $(top_builddir)/$(PACKAGE)-$(VERSION)/$(subdir)

subdir = src

distdir: $(DISTFILES)
	@for file in $(DISTFILES); do \
	  d=$(srcdir); \
	  if test -d $$d/$$file; then \
	    cp -pr $$/$$file $(distdir)/$$file; \
	  else \
	    test -f $(distdir)/$$file \
	    || ln $$d/$$file $(distdir)/$$file 2> /dev/null \
	    || cp -p $$d/$$file $(distdir)/$$file || :; \
	  fi; \
	done
am_map.o: am_map.c doomstat.h doomdata.h doomtype.h d_net.h d_player.h \
	d_items.h doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h st_stuff.h d_event.h r_main.h r_data.h \
	r_defs.h r_state.h p_setup.h p_maputl.h w_wad.h v_video.h \
	p_spec.h am_map.h dstrings.h d_englsh.h d_deh.h lprintf.h \
	g_game.h
d_client.o: d_client.c doomtype.h doomstat.h doomdata.h d_net.h \
	d_player.h d_items.h doomdef.h ../config.h z_zone.h m_swap.h \
	version.h p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h \
	info.h d_think.h p_mobj.h d_main.h d_event.h w_wad.h g_game.h \
	m_menu.h protocol.h i_network.h lprintf.h
d_deh.o: d_deh.c doomdef.h ../config.h z_zone.h m_swap.h version.h \
	doomstat.h doomdata.h doomtype.h d_net.h d_player.h d_items.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h sounds.h m_cheat.h p_inter.h g_game.h \
	d_event.h w_wad.h lprintf.h dstrings.h d_englsh.h
d_items.o: d_items.c info.h d_think.h d_items.h doomdef.h ../config.h \
	z_zone.h m_swap.h version.h
d_main.o: d_main.c doomdef.h ../config.h z_zone.h m_swap.h version.h \
	doomstat.h doomdata.h doomtype.h d_net.h d_player.h d_items.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h dstrings.h d_englsh.h sounds.h w_wad.h \
	s_sound.h v_video.h r_data.h r_defs.h r_state.h f_finale.h \
	d_event.h f_wipe.h m_argv.h m_misc.h m_menu.h i_sound.h \
	i_video.h g_game.h hu_stuff.h wi_stuff.h st_stuff.h am_map.h \
	p_setup.h r_draw.h r_main.h d_main.h d_deh.h lprintf.h
doomdef.o: doomdef.c doomdef.h ../config.h z_zone.h m_swap.h version.h
doomstat.o: doomstat.c doomstat.h doomdata.h doomtype.h d_net.h \
	d_player.h d_items.h doomdef.h ../config.h z_zone.h m_swap.h \
	version.h p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h \
	info.h d_think.h p_mobj.h
d_server.o: d_server.c doomtype.h protocol.h d_ticcmd.h m_swap.h \
	i_network.h
dstrings.o: dstrings.c dstrings.h d_englsh.h
f_finale.o: f_finale.c doomstat.h doomdata.h doomtype.h d_net.h \
	d_player.h d_items.h doomdef.h ../config.h z_zone.h m_swap.h \
	version.h p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h \
	info.h d_think.h p_mobj.h d_event.h v_video.h r_data.h r_defs.h \
	r_state.h w_wad.h s_sound.h sounds.h d_deh.h f_finale.h \
	hu_stuff.h
f_wipe.o: f_wipe.c z_zone.h doomdef.h ../config.h m_swap.h version.h \
	i_video.h doomtype.h v_video.h r_data.h r_defs.h m_fixed.h \
	i_system.h d_ticcmd.h d_think.h p_mobj.h tables.h doomdata.h \
	info.h r_state.h d_player.h d_items.h p_pspr.h m_random.h \
	f_wipe.h
g_game.o: g_game.c doomstat.h doomdata.h doomtype.h d_net.h d_player.h \
	d_items.h doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h f_finale.h d_event.h m_argv.h m_misc.h \
	m_menu.h m_random.h p_setup.h p_saveg.h p_tick.h d_main.h \
	w_wad.h wi_stuff.h hu_stuff.h st_stuff.h am_map.h r_main.h \
	r_data.h r_defs.h r_state.h r_draw.h p_map.h s_sound.h \
	dstrings.h d_englsh.h sounds.h r_sky.h d_deh.h p_inter.h \
	g_game.h lprintf.h z_bmalloc.h
hu_lib.o: hu_lib.c doomdef.h ../config.h z_zone.h m_swap.h version.h \
	doomstat.h doomdata.h doomtype.h d_net.h d_player.h d_items.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h v_video.h r_data.h r_defs.h r_state.h \
	hu_lib.h hu_stuff.h d_event.h r_main.h r_draw.h
hu_stuff.o: hu_stuff.c doomstat.h doomdata.h doomtype.h d_net.h \
	d_player.h d_items.h doomdef.h ../config.h z_zone.h m_swap.h \
	version.h p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h \
	info.h d_think.h p_mobj.h hu_stuff.h d_event.h hu_lib.h \
	r_defs.h v_video.h r_data.h r_state.h st_stuff.h w_wad.h \
	s_sound.h dstrings.h d_englsh.h sounds.h d_deh.h
info.o: info.c doomdef.h ../config.h z_zone.h m_swap.h version.h \
	sounds.h m_fixed.h i_system.h d_ticcmd.h doomtype.h p_mobj.h \
	tables.h d_think.h doomdata.h info.h w_wad.h
l_joy.o: l_joy.c doomdef.h ../config.h z_zone.h m_swap.h version.h \
	doomtype.h m_argv.h d_event.h d_main.h w_wad.h i_joy.h
l_main.o: l_main.c doomdef.h ../config.h z_zone.h m_swap.h version.h \
	m_argv.h d_main.h d_event.h doomtype.h w_wad.h i_system.h \
	d_ticcmd.h i_video.h
lprintf.o: lprintf.c lprintf.h
l_soundgen.o: l_soundgen.c ../config.h l_soundgen.h sounds.h m_swap.h
l_sound.o: l_sound.c z_zone.h i_system.h d_ticcmd.h doomtype.h i_sound.h \
	sounds.h m_argv.h m_misc.h w_wad.h doomdef.h ../config.h \
	m_swap.h version.h doomstat.h doomdata.h d_net.h d_player.h \
	d_items.h p_pspr.h m_fixed.h tables.h info.h d_think.h p_mobj.h \
	d_main.h d_event.h lprintf.h l_soundsrv.h
l_sound_sdl.o: l_sound_sdl.c z_zone.h m_swap.h i_system.h d_ticcmd.h \
	doomtype.h i_sound.h sounds.h m_argv.h m_misc.h w_wad.h \
	lprintf.h doomdef.h ../config.h version.h doomstat.h doomdata.h \
	d_net.h d_player.h d_items.h p_pspr.h m_fixed.h tables.h info.h \
	d_think.h p_mobj.h d_main.h d_event.h qmus2mid.h
l_soundsrv.o: l_soundsrv.c ../config.h sounds.h l_soundgen.h \
	l_soundsrv.h
l_system.o: l_system.c i_system.h d_ticcmd.h doomtype.h i_sound.h \
	sounds.h doomstat.h doomdata.h d_net.h d_player.h d_items.h \
	doomdef.h ../config.h z_zone.h m_swap.h version.h p_pspr.h \
	m_fixed.h tables.h info.h d_think.h p_mobj.h m_misc.h g_game.h \
	d_event.h w_wad.h m_random.h
l_udp.o: l_udp.c protocol.h doomtype.h d_ticcmd.h m_swap.h i_network.h \
	m_argv.h i_system.h
l_video_sdl.o: l_video_sdl.c i_system.h d_ticcmd.h doomtype.h m_argv.h \
	doomstat.h doomdata.h d_net.h d_player.h d_items.h doomdef.h \
	../config.h z_zone.h m_swap.h version.h p_pspr.h m_fixed.h \
	tables.h info.h d_think.h p_mobj.h v_video.h r_data.h r_defs.h \
	r_state.h r_draw.h d_main.h d_event.h w_wad.h l_video_trans.h \
	i_joy.h i_video.h s_sound.h sounds.h lprintf.h
l_video_svgalib.o: l_video_svgalib.c z_zone.h i_video.h doomtype.h \
	i_system.h d_ticcmd.h doomdef.h ../config.h m_swap.h version.h \
	doomstat.h doomdata.h d_net.h d_player.h d_items.h p_pspr.h \
	m_fixed.h tables.h info.h d_think.h p_mobj.h v_video.h r_data.h \
	r_defs.h r_state.h r_draw.h d_event.h d_main.h w_wad.h m_argv.h \
	i_joy.h lprintf.h
l_video_trans.o: l_video_trans.c doomtype.h v_video.h doomdef.h \
	../config.h z_zone.h m_swap.h version.h r_data.h r_defs.h \
	m_fixed.h i_system.h d_ticcmd.h d_think.h p_mobj.h tables.h \
	doomdata.h info.h r_state.h d_player.h d_items.h p_pspr.h \
	i_video.h l_video_trans.h
l_video_x.o: l_video_x.c i_system.h d_ticcmd.h doomtype.h m_argv.h \
	doomstat.h doomdata.h d_net.h d_player.h d_items.h doomdef.h \
	../config.h z_zone.h m_swap.h version.h p_pspr.h m_fixed.h \
	tables.h info.h d_think.h p_mobj.h v_video.h r_data.h r_defs.h \
	r_state.h r_draw.h d_main.h d_event.h w_wad.h l_video_trans.h \
	i_joy.h i_video.h s_sound.h sounds.h lprintf.h
m_argv.o: m_argv.c m_argv.h
m_bbox.o: m_bbox.c m_bbox.h z_zone.h m_fixed.h i_system.h d_ticcmd.h \
	doomtype.h
m_cheat.o: m_cheat.c doomstat.h doomdata.h doomtype.h d_net.h d_player.h \
	d_items.h doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h g_game.h d_event.h r_data.h r_defs.h \
	r_state.h p_inter.h m_cheat.h m_argv.h s_sound.h sounds.h \
	dstrings.h d_englsh.h r_main.h d_deh.h
m_menu.o: m_menu.c doomdef.h ../config.h z_zone.h m_swap.h version.h \
	doomstat.h doomdata.h doomtype.h d_net.h d_player.h d_items.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h dstrings.h d_englsh.h d_main.h d_event.h \
	w_wad.h v_video.h r_data.h r_defs.h r_state.h r_main.h \
	hu_stuff.h g_game.h s_sound.h sounds.h m_menu.h d_deh.h \
	m_misc.h lprintf.h am_map.h
m_misc.o: m_misc.c doomstat.h doomdata.h doomtype.h d_net.h d_player.h \
	d_items.h doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h m_argv.h g_game.h d_event.h m_menu.h \
	am_map.h w_wad.h i_sound.h sounds.h i_video.h v_video.h \
	r_data.h r_defs.h r_state.h hu_stuff.h st_stuff.h dstrings.h \
	d_englsh.h m_misc.h s_sound.h i_joy.h lprintf.h
m_random.o: m_random.c doomstat.h doomdata.h doomtype.h d_net.h \
	d_player.h d_items.h doomdef.h ../config.h z_zone.h m_swap.h \
	version.h p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h \
	info.h d_think.h p_mobj.h m_random.h
p_ceilng.o: p_ceilng.c doomstat.h doomdata.h doomtype.h d_net.h \
	d_player.h d_items.h doomdef.h ../config.h z_zone.h m_swap.h \
	version.h p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h \
	info.h d_think.h p_mobj.h r_main.h r_data.h r_defs.h r_state.h \
	p_spec.h p_tick.h s_sound.h sounds.h
p_doors.o: p_doors.c doomstat.h doomdata.h doomtype.h d_net.h d_player.h \
	d_items.h doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h p_spec.h r_defs.h p_tick.h s_sound.h \
	sounds.h r_main.h r_data.h r_state.h dstrings.h d_englsh.h \
	d_deh.h
p_enemy.o: p_enemy.c doomstat.h doomdata.h doomtype.h d_net.h d_player.h \
	d_items.h doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h m_random.h r_main.h r_data.h r_defs.h \
	r_state.h p_maputl.h p_map.h p_setup.h p_spec.h s_sound.h \
	sounds.h p_inter.h g_game.h d_event.h p_enemy.h p_tick.h
p_floor.o: p_floor.c doomstat.h doomdata.h doomtype.h d_net.h d_player.h \
	d_items.h doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h r_main.h r_data.h r_defs.h r_state.h p_map.h \
	p_spec.h p_tick.h s_sound.h sounds.h
p_genlin.o: p_genlin.c doomstat.h doomdata.h doomtype.h d_net.h \
	d_player.h d_items.h doomdef.h ../config.h z_zone.h m_swap.h \
	version.h p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h \
	info.h d_think.h p_mobj.h r_main.h r_data.h r_defs.h r_state.h \
	p_spec.h p_tick.h m_random.h s_sound.h sounds.h
p_inter.o: p_inter.c doomstat.h doomdata.h doomtype.h d_net.h d_player.h \
	d_items.h doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h dstrings.h d_englsh.h m_random.h am_map.h \
	d_event.h r_main.h r_data.h r_defs.h r_state.h s_sound.h \
	sounds.h d_deh.h p_tick.h p_inter.h
p_lights.o: p_lights.c doomstat.h doomdata.h doomtype.h d_net.h \
	d_player.h d_items.h doomdef.h ../config.h z_zone.h m_swap.h \
	version.h p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h \
	info.h d_think.h p_mobj.h m_random.h r_main.h r_data.h r_defs.h \
	r_state.h p_spec.h p_tick.h
p_map.o: p_map.c doomstat.h doomdata.h doomtype.h d_net.h d_player.h \
	d_items.h doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h r_main.h r_data.h r_defs.h r_state.h \
	p_maputl.h p_map.h p_setup.h p_spec.h s_sound.h sounds.h \
	p_inter.h m_random.h m_bbox.h z_bmalloc.h
p_maputl.o: p_maputl.c doomstat.h doomdata.h doomtype.h d_net.h \
	d_player.h d_items.h doomdef.h ../config.h z_zone.h m_swap.h \
	version.h p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h \
	info.h d_think.h p_mobj.h m_bbox.h r_main.h r_data.h r_defs.h \
	r_state.h p_maputl.h p_map.h p_setup.h
p_mobj.o: p_mobj.c doomdef.h ../config.h z_zone.h m_swap.h version.h \
	doomstat.h doomdata.h doomtype.h d_net.h d_player.h d_items.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h m_random.h r_main.h r_data.h r_defs.h \
	r_state.h p_maputl.h p_map.h p_tick.h sounds.h st_stuff.h \
	d_event.h hu_stuff.h s_sound.h g_game.h lprintf.h
p_plats.o: p_plats.c doomstat.h doomdata.h doomtype.h d_net.h d_player.h \
	d_items.h doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h m_random.h r_main.h r_data.h r_defs.h \
	r_state.h p_spec.h p_tick.h s_sound.h sounds.h
p_pspr.o: p_pspr.c doomstat.h doomdata.h doomtype.h d_net.h d_player.h \
	d_items.h doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h r_main.h r_data.h r_defs.h r_state.h p_map.h \
	p_inter.h p_enemy.h m_random.h s_sound.h sounds.h d_event.h
p_saveg.o: p_saveg.c doomstat.h doomdata.h doomtype.h d_net.h d_player.h \
	d_items.h doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h r_main.h r_data.h r_defs.h r_state.h \
	p_maputl.h p_spec.h p_tick.h p_saveg.h m_random.h am_map.h \
	d_event.h p_enemy.h
p_setup.o: p_setup.c doomstat.h doomdata.h doomtype.h d_net.h d_player.h \
	d_items.h doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h m_bbox.h m_argv.h g_game.h d_event.h w_wad.h \
	r_main.h r_data.h r_defs.h r_state.h r_things.h p_maputl.h \
	p_map.h p_setup.h p_spec.h p_tick.h p_enemy.h s_sound.h \
	lprintf.h
p_sight.o: p_sight.c r_main.h d_player.h d_items.h doomdef.h ../config.h \
	z_zone.h m_swap.h version.h p_pspr.h m_fixed.h i_system.h \
	d_ticcmd.h doomtype.h tables.h info.h d_think.h p_mobj.h \
	doomdata.h r_data.h r_defs.h r_state.h p_maputl.h p_setup.h \
	m_bbox.h
p_spec.o: p_spec.c doomstat.h doomdata.h doomtype.h d_net.h d_player.h \
	d_items.h doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h p_spec.h r_defs.h p_tick.h p_setup.h \
	m_random.h d_englsh.h m_argv.h w_wad.h r_main.h r_data.h \
	r_state.h p_maputl.h p_map.h g_game.h d_event.h p_inter.h \
	s_sound.h sounds.h m_bbox.h d_deh.h r_plane.h
p_switch.o: p_switch.c doomstat.h doomdata.h doomtype.h d_net.h \
	d_player.h d_items.h doomdef.h ../config.h z_zone.h m_swap.h \
	version.h p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h \
	info.h d_think.h p_mobj.h w_wad.h r_main.h r_data.h r_defs.h \
	r_state.h p_spec.h g_game.h d_event.h s_sound.h sounds.h
p_telept.o: p_telept.c doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_spec.h r_defs.h m_fixed.h i_system.h d_ticcmd.h doomtype.h \
	d_think.h p_mobj.h tables.h doomdata.h info.h d_player.h \
	d_items.h p_pspr.h p_maputl.h p_map.h r_main.h r_data.h \
	r_state.h p_tick.h s_sound.h sounds.h p_user.h
p_tick.o: p_tick.c doomstat.h doomdata.h doomtype.h d_net.h d_player.h \
	d_items.h doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h p_user.h p_spec.h r_defs.h p_tick.h
p_user.o: p_user.c doomstat.h doomdata.h doomtype.h d_net.h d_player.h \
	d_items.h doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h d_event.h r_main.h r_data.h r_defs.h \
	r_state.h p_map.h p_spec.h p_user.h
qmus2mid.o: qmus2mid.c qmus2mid.h
r_bsp.o: r_bsp.c doomstat.h doomdata.h doomtype.h d_net.h d_player.h \
	d_items.h doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h m_bbox.h r_main.h r_data.h r_defs.h \
	r_state.h r_segs.h r_plane.h r_things.h r_bsp.h
r_data.o: r_data.c doomstat.h doomdata.h doomtype.h d_net.h d_player.h \
	d_items.h doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h w_wad.h r_main.h r_data.h r_defs.h r_state.h \
	r_sky.h lprintf.h
r_draw.o: r_draw.c doomstat.h doomdata.h doomtype.h d_net.h d_player.h \
	d_items.h doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h w_wad.h r_main.h r_data.h r_defs.h r_state.h \
	v_video.h st_stuff.h d_event.h g_game.h am_map.h
r_main.o: r_main.c doomstat.h doomdata.h doomtype.h d_net.h d_player.h \
	d_items.h doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h w_wad.h r_main.h r_data.h r_defs.h r_state.h \
	r_things.h r_plane.h r_bsp.h r_draw.h m_bbox.h r_sky.h \
	v_video.h lprintf.h st_stuff.h d_event.h
r_plane.o: r_plane.c z_zone.h doomstat.h doomdata.h doomtype.h d_net.h \
	d_player.h d_items.h doomdef.h ../config.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h w_wad.h r_main.h r_data.h r_defs.h r_state.h \
	r_draw.h r_things.h r_sky.h r_plane.h
r_segs.o: r_segs.c doomstat.h doomdata.h doomtype.h d_net.h d_player.h \
	d_items.h doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h r_main.h r_data.h r_defs.h r_state.h r_bsp.h \
	r_plane.h r_things.h r_draw.h w_wad.h
r_sky.o: r_sky.c r_sky.h m_fixed.h i_system.h d_ticcmd.h doomtype.h
r_things.o: r_things.c doomstat.h doomdata.h doomtype.h d_net.h \
	d_player.h d_items.h doomdef.h ../config.h z_zone.h m_swap.h \
	version.h p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h \
	info.h d_think.h p_mobj.h w_wad.h r_main.h r_data.h r_defs.h \
	r_state.h r_bsp.h r_segs.h r_draw.h r_things.h
sounds.o: sounds.c doomtype.h sounds.h
s_sound.o: s_sound.c doomstat.h doomdata.h doomtype.h d_net.h d_player.h \
	d_items.h doomdef.h ../config.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h s_sound.h i_sound.h sounds.h r_main.h \
	r_data.h r_defs.h r_state.h m_random.h w_wad.h lprintf.h
st_lib.o: st_lib.c doomdef.h ../config.h z_zone.h m_swap.h version.h \
	doomstat.h doomdata.h doomtype.h d_net.h d_player.h d_items.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h v_video.h r_data.h r_defs.h r_state.h \
	w_wad.h st_stuff.h d_event.h st_lib.h r_main.h
st_stuff.o: st_stuff.c doomdef.h ../config.h z_zone.h m_swap.h version.h \
	doomstat.h doomdata.h doomtype.h d_net.h d_player.h d_items.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h m_random.h i_video.h w_wad.h st_stuff.h \
	d_event.h st_lib.h r_defs.h v_video.h r_data.h r_state.h \
	r_main.h am_map.h m_cheat.h s_sound.h sounds.h dstrings.h \
	d_englsh.h r_draw.h
tables.o: tables.c w_wad.h tables.h m_fixed.h i_system.h d_ticcmd.h \
	doomtype.h m_swap.h lprintf.h
version.o: version.c version.h z_zone.h
v_video.o: v_video.c doomdef.h ../config.h z_zone.h m_swap.h version.h \
	r_main.h d_player.h d_items.h p_pspr.h m_fixed.h i_system.h \
	d_ticcmd.h doomtype.h tables.h info.h d_think.h p_mobj.h \
	doomdata.h r_data.h r_defs.h r_state.h m_bbox.h w_wad.h \
	v_video.h i_video.h
wi_stuff.o: wi_stuff.c doomstat.h doomdata.h doomtype.h d_net.h \
	d_player.h d_items.h doomdef.h ../config.h z_zone.h m_swap.h \
	version.h p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h \
	info.h d_think.h p_mobj.h m_random.h w_wad.h g_game.h d_event.h \
	r_main.h r_data.h r_defs.h r_state.h v_video.h wi_stuff.h \
	s_sound.h sounds.h lprintf.h r_draw.h
w_wad.o: w_wad.c ../config.h doomstat.h doomdata.h doomtype.h d_net.h \
	d_player.h d_items.h doomdef.h z_zone.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h w_wad.h lprintf.h
z_bmalloc.o: z_bmalloc.c doomtype.h z_zone.h z_bmalloc.h i_system.h \
	d_ticcmd.h
z_zone.o: z_zone.c ../config.h z_zone.h doomstat.h doomdata.h doomtype.h \
	d_net.h d_player.h d_items.h doomdef.h m_swap.h version.h \
	p_pspr.h m_fixed.h i_system.h d_ticcmd.h tables.h info.h \
	d_think.h p_mobj.h m_argv.h

info-am:
info: info-am
dvi-am:
dvi: dvi-am
check-am: all-am
check: check-am
installcheck-am:
installcheck: installcheck-am
install-exec-am:
install-exec: install-exec-am

install-data-am: install-gamesPROGRAMS
install-data: install-data-am

install-am: all-am
	@$(MAKE) $(AM_MAKEFLAGS) install-exec-am install-data-am
install: install-am
uninstall-am: uninstall-gamesPROGRAMS
uninstall: uninstall-am
all-am: Makefile $(PROGRAMS)
all-redirect: all-am
install-strip:
	$(MAKE) $(AM_MAKEFLAGS) AM_INSTALL_PROGRAM_FLAGS=-s install
installdirs:
	$(mkinstalldirs)  $(DESTDIR)$(gamesdir)


mostlyclean-generic:

clean-generic:

distclean-generic:
	-rm -f Makefile $(CONFIG_CLEAN_FILES)
	-rm -f config.cache config.log stamp-h stamp-h[0-9]*

maintainer-clean-generic:
mostlyclean-am:  mostlyclean-gamesPROGRAMS mostlyclean-compile \
		mostlyclean-tags mostlyclean-generic

mostlyclean: mostlyclean-am

clean-am:  clean-gamesPROGRAMS clean-compile clean-tags clean-generic \
		mostlyclean-am

clean: clean-am

distclean-am:  distclean-gamesPROGRAMS distclean-compile distclean-tags \
		distclean-generic clean-am

distclean: distclean-am

maintainer-clean-am:  maintainer-clean-gamesPROGRAMS \
		maintainer-clean-compile maintainer-clean-tags \
		maintainer-clean-generic distclean-am
	@echo "This command is intended for maintainers to use;"
	@echo "it deletes files that may require special tools to rebuild."

maintainer-clean: maintainer-clean-am

.PHONY: mostlyclean-gamesPROGRAMS distclean-gamesPROGRAMS \
clean-gamesPROGRAMS maintainer-clean-gamesPROGRAMS \
uninstall-gamesPROGRAMS install-gamesPROGRAMS mostlyclean-compile \
distclean-compile clean-compile maintainer-clean-compile tags \
mostlyclean-tags distclean-tags clean-tags maintainer-clean-tags \
distdir info-am info dvi-am dvi check check-am installcheck-am \
installcheck install-exec-am install-exec install-data-am install-data \
install-am install uninstall-am uninstall all-redirect all-am all \
installdirs mostlyclean-generic distclean-generic clean-generic \
maintainer-clean-generic clean mostlyclean distclean maintainer-clean


#
# $Log: Makefile.am,v $
# Revision 1.3  1999/10/02 15:00:48  cphipps
# Added X_CFLAGS to the compile flags, so autoconf can pass the path to
# the X11 include files for systems that don't put them in the main include
# tree (fixes compile problem on FreeBSD)
#
# Revision 1.2  1999/09/16 22:19:22  cphipps
# Add missing header files for sound and netgame servers
#
# Revision 1.1  1999/09/10 20:10:47  cphipps
# Initial revision
#
#

# Tell versions [3.59,3.63) of GNU make to not export all variables.
# Otherwise a system limit (for SysV at least) may be exceeded.
.NOEXPORT:
