ADV	;ADVENTURE V1.0.  FLH ; 07 FEB 83  3:37 PM
	;DNL;20May89 13:00;Copyright (c) 1989 PRx, Inc.
	;K  S:$ZS<6 $ZS=6 S $ZE="ERR1" S GAVEUP=0,S=1
	S GAME=$P(XID,"^",2),NAME=XID("USER")
	;NEW (GAME,NAME)
	I $ZVER["DSM-11" BREAK 2
	S $ZT="ERR1" S GAVEUP=0,S=1
	S Q=65,Y=54,N=201 D YES I  D OLDNAM I  D GETGAM I 1
	E  D NEWNAM,GCOPY,GETGAM
	S $ZT="ERR^ADV",Q=208,Y=1,N=0 D YES I  I 'HINTED(3) S HINTED(3)=1,LIMIT=LIMIT+670
	G ^ADV2
ENDGAM	I '(SAVED&GAVEUP) K ^ADVG(G)
	E  D PUTGAM
	S $ZE="ERR1",G="" F Z=0:0 S G=$O(^ADVG(G)) Q:G=""  I $H-10>^(G) K ^(G)
	S $ZE="" Q
TIMO	S GAVEUP=1 D ENDGAM H
	;
ERR	I $ZE?1"<INRPT".E S $ZE="ERR^ADV",RET="TURN^ADV3" D @$P(^ADV("QUIT"),"/",3) G @RET
ERR1	D ^%ET Q
OLDNAM	S M=205 D SPK
OL1	D GETIN I U1="?"!(U1="HELP") D LIST G OLDNAM
	I W'?1.5AN S M=203 D SPK G OL1
	Q:U1="NEW"  S G=U1 I $D(^ADVG(G)) S M=207 D SPK Q
	S M=206 D SPK G OLDNAM
LIST	W !! S G="" F X=0:8 S G=$O(^ADVG(G)) Q:G=""  W ?X,G I X>70 W ! S X=0
	Q
NEWNAM	S M=202 D SPK
NE1	D GETIN S G=U1,M=$S(W'?1.5AN:203,G="NEW":210,$D(^ADVG(G)):204,1:207) D SPK G:M-207 NE1 S ^ADVG(G)=$H Q
GCOPY	F L=1:1:140 S ^ADVG(G,L,"A")=0,^("O")="/"
	S N=0,F(N)="^ADV(""i"",",T(N)="^ADVG(G,",X=$H D COP K D,F,IN,N,OUT,T,U,X Q
COP	S U(N)="",IN(N)=F(N)_"U(N))",OUT(N)=T(N)_"U(N))"
CO1	S U(N)=$O(@IN(N)) I U(N)="" Q
	S D=$D(@IN(N)) I D#2 S @OUT(N)=@IN(N) I X'=$H S X=$H W "."
	I D>9 S F(N+1)=F(N)_""""_U(N)_""",",T(N+1)=T(N)_""""_U(N)_""",",N=N+1 D COP S N=N-1
	G CO1
GETGAM	S X="" F Z=0:0 S X=$O(^ADVG(G,"i",X)) Q:X=""  S @X=^(X)
	Q
PUTGAM	S X="" F Z=0:0 S X=$O(^ADVG(G,"i",X)) Q:X=""  S ^(X)=@X
	W !!,"This adventure saved with name ",G,"." Q
GETIN	D KBD S W1=$P(W," ",1),W2=$P(W," ",2),U1=$E($P(U," ",1),1,5),U2=$E($P(U," ",2),1,5) K U Q
YES	S M=Q D SPK,KBD I U?1"Y".1"ES" S M=Y D:M SPK
	E  I U'?1"N".1"O" W "   Please answer the question." G YES
	E  S M=N D:M SPK
	K M Q
KBD	W:S ! R !,W:600 G:'$T TIMO^ADV S U=W F I=1:1 Q:U?.CNPU  I $E(U,I)?1L S U=$E(U,1,I-1)_$C($A(U,I)-32)_$E(U,I+1,99)
	K I Q
SPK	W:S ! F I=1:1:^ADV("t",M,0) W !,^(I)
	K I Q