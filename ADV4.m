ADV4	;ADVENTURE.  FLH ; 04 FEB 83  4:30 AM
AVC	I OBJ="DWARF",CLOSED S M=199 D SPK G RUCKUS
	Q
AVD	S I=TOTING[("/"_OBJ_"/") I OBJ="ROD",'I,TOTING["/ROD2/" S OBJ="ROD2",I=1
	Q:'I  S M=54
	I OBJ="BIRD" S O="SNAKE" D HERE I  S M=30 D SPK G:CLOSED RUCKUS S M=0,L=0 D MOVE S ^ADVG(G,O,"P")=1 G AVDL
	I OBJ="COINS" S O="MACHI" D HERE I  S L=0,O="COINS" D MOVE S L=LP,O="BATTE",P=0,M=0 D DROP,PSPK Q
	I OBJ="BIRD" S O="DRAGO" D AT I  I ^ADVG(G,O,"P")=0 S M=154,L=0,O="BIRD",^ADVG(G,O,"P")=0 D MOVE S:^ADVG(G,"SNAKE","L")=19 TALLY2=TALLY2+1 Q
	I OBJ="BEAR" S O="TROLL" D AT I  S ^ADVG(G,O,"P")=2,M=163 D TROLLX G AVDL
AVDV	I OBJ="VASE",LP-96 S O="PILLO" D AT S O="VASE",(P,^ADVG(G,O,"P"))=$S($T:0,1:2),P=P+1,M=0 S:P-1 ^("F")=-1 D PSPK
AVDL	D LIQ S:O=OBJ OBJ="BOTTL" I OBJ="BOTTL",O]"" S L=0 D DROP
	E  I OBJ="CAGE",^ADVG(G,"BIRD","P") S O="BIRD",L=LP D DROP I 1
	E  I OBJ="BIRD" S ^ADVG(G,"BIRD","P")=0
	S O=OBJ,L=LP D DROP Q
RUCKUS	S RET="SCORE^ADV8",M=136 D SPK Q
TROLLX	S O="TROLL",L=0 D MOVE,MOVEF S O="TROLL2",L=117 D MOVE S L=122 D MOVEF S O="CHASM" D JUGGLE Q
AVJ	S I=TOTING[("/"_OBJ_"/") I OBJ="ROD",'I,TOTING["/ROD2/" S OBJ="ROD2",I=1
	Q:'I  I TR[("/"_OBJ_"/") S O="TROLL" D AT I  S M=159,L=0,O=OBJ D DROP,TROLLX Q
	I OBJ="FOOD" S O="BEAR" D HERE I  S OBJ=O G AVK3^ADV6
	G:OBJ'="AXE" AVD^ADV4 F DW=1:1:5 I LD(DW)=LP G AVJ1
	S M=152,O="DRAGO" D AT I  I ^ADVG(G,O,"P")=0 G AVJ2
	S M=158,O="TROLL" D AT I  G AVJ2
	S O="BEAR" D HERE I  I ^ADVG(G,O,"P")=0 D JUGGLE S M=164,L=LP,O="AXE" D DROP S ^ADVG(G,O,"F")=-1,^("P")=1 Q
	S OBJ="" G AVA^ADV5
AVJ1	S M=48 I $R(10000)<6667 S (DSEEN(DW),LD(DW))=0,DKILL=DKILL+1,M=$S(DKILL=1:149,1:47)
AVJ2	D SPK S O="AXE",(L,LNEW)=LP,RET="NEWLP^ADV2" D DROP Q
AVW	S I=TOTING[("/"_OBJ_"/"),J=(OBJ="ROD") I 'I,TOTING'["/ROD2/"!'J S M=29
	I I,J,'CLOSNG S O="FISSU" D AT I  S (P,^("P"))=1-^ADVG(G,O,"P"),P=2-P,M=0 D PSPK
	Q
AVX	I OBJ="VASE",^ADVG(G,OBJ,"P")=0 S ^("P")=2,^("F")=-1,M=198,O=OBJ,L=LP D:TOTING["/VASE/" DROP Q
	I OBJ="MIRRO" S M=148 I CLOSED S M=197 D SPK G RUCKUS
	Q
AVY	S M=0 I WD2]"" S WD1=WD2,W1=W2,U1=U2,WD1X=WD2X
	I "/XYZZY/PLUGH/PLOVE/FEE/"[("/"_WD1_"/") S (WD2,OBJ)="",RET="WD2A"
	E  W:S ! W !,"Okay, ",W1,"."
	Q
SPK	W:S ! F I=1:1:^ADV("t",M,0) W !,^(I)
	K I Q
PSPK	S N=^ADV(O,P,0) I N W:S ! F I=.1:.1:N W !,^(I)
	K I,N Q
DROPF	S ^ADVG(G,O,"F")=L G DR1
DROP	F Z=2:1:HOLDNG+1 I $P(TOTING,"/",Z)=O S TOTING=$P(TOTING,"/",1,Z-1)_"/"_$P(TOTING,"/",Z+1,99),HOLDNG=HOLDNG-1 Q
	S ^ADVG(G,O,"L")=L
DR1	I L>0 S ^("O")="/"_O_^ADVG(G,L,"O")
	Q
CARRY	Q:TOTING[("/"_O_"/")  S ^ADVG(G,O,"L")=-1,HOLDNG=HOLDNG+1,TOTING="/"_O_TOTING
CARRYF	S Y=^ADVG(G,L,"O") F Z=2:1:$L(Y,"/")-1 I $P(Y,"/",Z)=O S ^("O")=$P(Y,"/",1,Z-1)_"/"_$P(Y,"/",Z+1,99) Q
	K Y,Z Q
MOVEF	S MOL=L,L=^ADVG(G,O,"F") D:L>0 CARRYF S L=MOL D DROPF Q
MOVE	S MOL=L,L=^ADVG(G,O,"L") D:L>0 CARRY S L=MOL D DROP Q
HERE	S L=^ADVG(G,O,"L") I L<0!(L=LP)
	K L Q
AT	I ^ADVG(G,O,"L")=LP!(^("F")=LP)
	Q
JUGGLE	S L=^ADVG(G,O,"L") I L>0 S X=^ADVG(G,L,"O"),K=$F(X,"/"_O_"/") I K S ^("O")="/"_O_$E(X,1,K-$L(O)-2)_$E(X,K,255)
	K K,L,X Q
LIQ	S O=^ADVG(G,"BOTTL","P") S:O<0 O=-1-O S O=$P("WATER//OIL","/",O+1) Q
