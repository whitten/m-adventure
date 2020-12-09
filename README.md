# m-adventure
Code from DECUS 1990 L&amp;T SIG Tape : http://www.digiater.nl/openvms/decus/lt90a/mumpssig/games/

This Repository holds MUMPS routines and data to implement the original Adventure Game
19:: written in FORTRAN for the PDP-10 by Willie Crowther at MIT
19?? revised and extended by Don Woods of the Stanford Artificial Intelligence Lab
19?? rewritten in FORTRAN IV-Plus and then Fortran IV for the PDP-11 by Kent Blackett and Bob Supnick of Digital Equipment Corp
1983 translated it into 1983 ANSI Standard MUMPS Fred Hiltz of InterSystems Corp. (this program.)
1988 changes by unknown author PRX ;24Apr89 18:52 ;Copyright (c) 1989 PRx, Inc.
1989 changes by unknown authoer DNL;20May89 13:00;Copyright (c) 1989 PRx, Inc.
2016 Modified to use VA FileMan data structures & VistA SACC routines by David Whitten

Original MUMPS program required 40K bytes of disk storage for the programs
and 84K for the global ADV. Dynamic use of ^ADVG used 6K for each saved game
or in progress or suspended game.  
Must be run in at least 6K of partition (local variables and stack)

Any help in contacting any of the aforementioned people to discuss license Issues will be
greatly appreciated.  Especially Fred Hiltz.
I haven't talked to him in ten years and would like to.

Original program notes are in ADVDOC.m in this repository
Initial run of XINDEX results are in ADVINDEX.lis
