ADV9	;ADVENTURE.  FLH ; 29 DEC 82  8:52 AM
HINT	D @("HINT"_J) E  Q:J=5  G HI1
	S X=^ADV("h",J),P=$P(X,"/",2),Q=$P(X,"/",3),Y=0,N=54 D YES E  Q
	W:S ! W !,"I am prepared to give you a hint, but it will cost you ",P," points."
	S Q=175,Y=$P(X,"/",4) D YES S HINTED(J)=$T I  I LIMIT>30 S LIMIT=30*P+LIMIT
HI1	S HINTLC(J)=0 Q
HINT4	I ^ADVG(G,"GRATE","P")=0 S O="KEYS" D HERE I '$T
	Q
HINT5	I OBJ="BIRD" S O=OBJ D HERE I  I TOTING["/ROD/"
	Q
HINT6	S O="BIRD" D HERE I '$T S O="SNAKE" D HERE
	Q
HINT7	S I=HOLDNG>1 F L=LP,LP1,LP2 Q:'I  I L>0 S I=^ADVG(G,L,"O")="/"
	I I
	K I Q
HINT8	I ^ADVG(G,"EMERA","P")=-1,^ADVG(G,"PLATI","P")=-1
	Q
HINT9	I 1
	Q
TRS1	I "/EMERA/"'[TOTING S M=117 D SPK
	E  S LNEW=199-LP
	Q
TRS2	S O="EMERA",L=LP,RET="TR1" D DROP Q
TRS3	S O="TROLL" I ^ADVG(G,O,"P")=1 S ^("P")=0,P=1 D PSPK S L=117 D MOVE S L=122 D MOVEF S O="TROLL2",L=0 D MOVE,MOVEF S O="CHASM" D JUGGLE Q
	S LNEW=239-LP S:^("P")=0 ^("P")=1 Q:TOTING'["/BEAR/"
	S ^ADVG(G,"CHASM","P")=1,^ADVG(G,"TROLL","P")=2,O="BEAR",L=LNEW,M=162 D DROP,SPK S ^ADVG(G,O,"F")=-1,^("P")=3
	S:^ADVG(G,"SPICE","P")<0 TALLY2=TALLY2+1 S LP2=LNEW,RET="DEAD^ADV8" Q
TRB	S L3=$S($E(^ADV(LP1,"c")):LP2,1:LP1),LP2=LP1,LP1=LP I L3=LP S M=91 D SPK
	E  S MOV="A" F Z=0:0 S MOV=$O(^ADV(LP,MOV)) Q:MOV]"ZZ"  F J=1:1:^(MOV,0) S Y=^(J) I $P(Y,"\",2)="TR2" S L=$P(Y,"\",3),LL(L)="" I L=L3 S LNEW=L3 G TRB1
	E  S L="" F Z=0:0 S L=$O(LL(L)) Q:L=""  I $D(^ADV(L,"FORCED",1)),$P(^(1),"\",3)=L3 S LNEW=L3 Q
	E  S M=140 D SPK
TRB1	K L3,LL,MOV Q
TRC	S M=$S(LP<8:57,1:58) D SPK Q
TRL	I DETAIL<3 S M=15 D SPK
	S DETAIL=DETAIL+1,WZDARK=0,^ADVG(G,LP,"A")=0 Q
TRN	Q
YES	S M=Q D SPK,KBD I U?1"Y".1"ES" S M=Y D:M SPK
	E  I U'?1"N".1"O" W "   Please answer the question." G YES
	E  S M=N D:M SPK
	K M Q
KBD	W:S ! R !,W:600 G:'$T TIMO^ADV S U=W F I=1:1 Q:U?.CNPU  I $E(U,I)?1L S U=$E(U,1,I-1)_$C($A(U,I)-32)_$E(U,I+1,99)
	K I Q
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
JUGGLE	S L=^ADVG(G,O,"L") I L>0 S X=^ADVG(G,L,"O"),K=$F(X,"/"_O_"/") I K S ^("O")="/"_O_$E(X,1,K-$L(O)-2)_$E(X,K,255)
	K K,L,X Q
LIQ	S O=^ADVG(G,"BOTTL","P") S:O<0 O=-1-O S O=$P("WATER//OIL","/",O+1) Q
