C1GADVDC	;ADVENTURE.  FLH ; 25 JAN 83  10:32 AM
	;;1.0;C1GAMES;****;March 1, 2016;
	;ADVENTURE.  FLH ; 25 JAN 83  10:32 AM
	; DJW/WV ;March 1, 2016
	;
I	; Adventure is the original computer game that has inspired dozens of
	; descendants of the "Dungeons and Dragons" genre.  First coded in
	; Fortran for the PDP-10 by Willie Crowther at MIT, it was revised and
	; extended by Don Woods of the Stanford Artificial Intelligence lab.
	; Kent Blackett and Bob Supnick of Digital Equipment Corp. rewrote
	; it in Fortran IV-Plus and then in Fortran IV for the PDP-11.
	; Fred Hiltz of InterSystems Corp. translated it into ANSI Standard
	; MUMPS--this program. Adapted to be VistA and VA FileMan compatible
	; by David Whitten
	;
II	; Any number can play simultaneously:  "D ^C1GADV" to get started.  Each
	; player gives a name to his/her game, which can be suspended with a
	; SUSPEND command at any time and later resumed.  Saved games more than
	; ten days old are deleted automatically.
	;
III	; This program was originally written to run in InterSystems Corporation's
	; M/11 implementation of 1983 ANSI Standard MUMPS. 
	; There are ten routines: C1GADV, C1GADVDC, and C1GADV2-C1GADV9. 
	; One global root, ^C1GADV(71100, contains the geography, text, etc.
	; The second global root, ^C1GADV(71100.1, holds the variables
	; associated with each game in progress or suspended.  
	;
IV	; Adventure wzs originally supplied on a magnetic tape containing 
	; a file of routines followed by a file of the global ^C1GADV. 
	; Now, you can use the program D ^%RI. to load all the routines.  
	; from the file adventure.rou When %RI has finished, you can use can
	; load the globals with D ^%GI. with filename adventure.glo
	; eventually it will be two KIDS files to transport both
	;
V	; After ^C1GADV is in place, you may optionally use a utility like
	; D ^%PROTECT or whatever tool your vendor supplies and follow
	; its instructions to allow read-only access to ^C1GADV from all UCI's,
	; thus protecting it from change or deletion.  This completes the
	; installation of Adventure.
	;
VI	; Adventure may easily be ported to other systems that support 1983
	; ANSI Standard MUMPS.  The only non-standard features are confined
	; to the routine C1GADV:  $ZS is the size of the partition in kilobytes.
	; $ZE governs trapping of errors and keyboard breaks.  Its code may be
	; removed without detriment to the game.  The utility routine %ZTER is
	; used to log the local variables following an error.
	;
VII	; For maintenance of Adventure please contact:
	; 
	;          David Whitten, MCS
	;          Chief Technical Officer
	;          WorldVistA
	;          PO Box 269
	;          Butner, NC 27509
	;          Telephone:  713-870-3834
	;          twitter:    davewhitten
	;          repository: http://github.com/whitten/m-adventure/
	;
	; Maintenance will be provided only for the unaltered program, and only
	; when a printout of the error logged is included (use the ^XTER
	; utility).  On a time-available basis, I will return either a patch
	; or a new release of the program.
	;
VIII	; some changes were made by DLH @ PRX in 1989
	; unknown details
	;
IX	; changes by David Whitten @ WorldVistA in 2016 
	; to comply with VA SACC & FileMan Compatibility
	; 1st step was to remove any error XINDEX complained about
	; 2nd step was to move everything to the namespace C1GADV
	;            also move the global refs from ^ADV to ^C1GADV(71100,
	;            and  move the global refs from ^ADVG to ^C1GADV(71100.1,
