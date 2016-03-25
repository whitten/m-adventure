ADVDOC	;ADVENTURE.  FLH ; 25 JAN 83  10:32 AM
I	; Adventure is the original computer game that has inspired dozens of
	; descendants of the "Dungeons and Dragons" genre.  First coded in
	; Fortran for the PDP-10 by Willie Crowther at MIT, it was revised and
	; extended by Don Woods of the Stanford Artificial Intelligence lab.
	; Kent Blackett and Bob Supnick of Digital Equipment Corp. rewrote
	; it in Fortran IV-Plus and then in Fortran IV for the PDP-11.
	; Fred Hiltz of InterSystems Corp. translated it into ANSI Standard
	; MUMPS--this program.
	;
II	; Any number can play simultaneously:  "D ^ADV" to get started.  Each
	; player gives a name to his/her game, which can be suspended with a
	; SUSPEND command at any time and later resumed.  Saved games more than
	; ten days old are deleted automatically.
	;
III	; This program is written to run in InterSystems Corporation's M/11
	; implementation of 1983 ANSI Standard MUMPS.  There are ten routines:
	; AD, ADDOC, and AD2-AD9.  They require 40K bytes of disk storage.
	; One global, ^ADV, contains the geography, text, etc.--it requires
	; 84K bytes.  The second global, ^ADVG, holds the variables associated
	; with each game in progress or suspended.  It requires 6K bytes per
	; game.  Adventure should run in a partition of at least 6K bytes.
	;
IV	; Adventure is supplied on a magnetic tape containing a file of
	; routines followed by a file of the global ^ADV.  Both files are
	; written with 1024-byte physical records in the DOS format.  To
	; install the game in M/11, mount the tape, sign in to the UCI in
	; which the game will run, and D ^%RI.  Give tape parameters:
	;     ("D3":0:1024)  if the tape is marked 800 bpi, or
	;     ("D4":0:1024)  if the tape is marked 1600 bpi.
	; Tell %RI to load all the routines.  The tape does not contain
	; comments for ^COMMENT.  When %RI has finished, leave the tape in
	; position and D ^%GI.  Give the same tape parameters.
	;
V	; After ^ADV is in place, you may optionally D ^%PROTECT and follow
	; its instructions to allow read-only access to ^ADV from all UCI's,
	; thus protecting it from change or deletion.  This completes the
	; installation of Adventure.
	;
VI	; Adventure may easily be ported to other systems that support 1983
	; ANSI Standard MUMPS.  The only non-standard features are confined
	; to the routine AD:  $ZS is the size of the partition in kilobytes.
	; $ZE governs trapping of errors and keyboard breaks.  Its code may be
	; removed without detriment to the game.  The utility routine %ET is
	; used to log the local variables following an error.
	;
VII	; For maintenance of Adventure please write, not telephone,
	;          Frederick L. Hiltz, Ph. D.
	;          Systems Development Engineer
	;          InterSystems Corporation
	;          210 Commercial Street, Third Floor
	;          Boston, MA  02109
	;
	; Maintenance will be provided only for the unaltered program, and only
	; when a printout of the error logged by %ET is included (use the %ER
	; utility).  On a time-available basis, I will return either a patch
	; or a new release of the program.
