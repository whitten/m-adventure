C1GADV7	;ADVENTURE.  FLH, DJW/WV ; 24 JAN 83  12:16 PM
	;;1.0;C1GAMES;****;March 1, 2016;
	;FLH ; 24 JAN 83  12:16 PM
	; DJW/WV ;March 1, 2016
AVH	S M=209 Q
AVL	S M=28 F O="CLAM","OYSTE" D HERE I  S OBJ=O
	F O="DOOR","GRATE" D AT I  S OBJ=O
	S O="CHAIN" D HERE I  G:OBJ]"" AVT S OBJ=O
	Q:OBJ=""
AVL1	I OBJ="CLAM"!(OBJ="OYSTE") G AVL2
	I OBJ="DOOR" S M=$S(^C1GADV(71100.1,G,OBJ,"P")=1:54,1:111)
	E  S M=$S(OBJ="CAGE":32,OBJ="KEYS":55,OBJ="GRATE":31,OBJ="CHAIN":31,1:M)
	S O="KEYS" D HERE Q:M-31!'$T  G:OBJ="CHAIN" AVL4:VERB="LOCK",AVL3
	I CLOSNG S:'PANIC CLK2=15 S PANIC=1,M=130 Q
	S M=^C1GADV(71100.1,G,"GRATE","P")+34,(P,^("P"))=$S(VERB="LOCK":0,1:1),M=2*P+M Q
AVL2	S J=OBJ="OYSTE",M=$S(TOTING[("/"_OBJ_"/"):120,1:124)+J
	S:TOTING'["/TRIDE/" M=122+J S:VERB="LOCK" M=61
	I M=124 S O="CLAM",L=0 D MOVE S O="OYSTE",L=LP D DROP S O="PEARL",L=105 D DROP
	Q
AVL3	S P=^C1GADV(71100.1,G,"BEAR","P"),M=$S(^C1GADV(71100.1,G,"CHAIN","P")=0:37,P=0:41,1:171)
	I M=171 S ^C1GADV(71100.1,G,"CHAIN","P")=0,^("F")=0 S:P-3 (P,^C1GADV(71100.1,G,"BEAR","P"))=2 S ^C1GADV(71100.1,G,"BEAR","F")=2-P
	Q
AVL4	S O="CHAIN",L=LP,M=$S(L-130:173,^C1GADV(71100.1,G,O,"P"):34,1:172)
	I M=172 S ^C1GADV(71100.1,G,O,"P")=2,^("F")=-1 D:TOTING["/CHAIN/" DROP
	Q
	;
AVT	G:$L(^C1GADV(71100.1,G,LP,"O"),"/")-3 AV0^C1GADV5 I DFLAG>1 F DW=1:1:5 I LD(DW)=LP G AV0^C1GADV5
	S OBJ=$P(^("O"),"/",2)
AVT1	Q:TOTING[("/"_OBJ_"/")  S M=25,F=^C1GADV(71100.1,G,OBJ,"F"),P=^("P")
	I OBJ="PLANT",P'>0 S M=115
	E  I OBJ="BEAR",P=1 S M=169
	E  I OBJ="CHAIN",^C1GADV(71100.1,G,"BEAR","P") S M=170
	Q:F  I OBJ'="WATER",OBJ'="OIL" G AVT2
	D LIQ S I=O=OBJ,(O,OBJ)="BOTTL" D HERE G:$T&I AVT2 S I=TOTING["/BOTTL/",P=^C1GADV(71100.1,G,O,"P")
	G:P=1&I AVF^C1GADV6 S M=$S('I:104,P-1:105,1:M) Q
AVT2	I HOLDNG>7 S M=92 Q
	S L=LP I OBJ'="BIRD",OBJ'="CAGE" G AVT3
	S P=^C1GADV(71100.1,G,"BIRD","P") I OBJ="BIRD",P=0 S M=26 Q:TOTING["/ROD/"  S M=27 Q:TOTING'["/CAGE/"  S (P,^C1GADV(71100.1,G,"BIRD","P"))=1
	I P S O=$S(OBJ="BIRD":"CAGE",1:"BIRD") D CARRY
AVT3	S O=OBJ D CARRY,LIQ I O]"",OBJ="BOTTL" S ^C1GADV(71100.1,G,O,"L")=-1,TOTING="/"_O_TOTING,HOLDNG=HOLDNG+1
	S M=54 Q
	;
DROP	F Z=2:1:HOLDNG+1 I $P(TOTING,"/",Z)=O S TOTING=$P(TOTING,"/",1,Z-1)_"/"_$P(TOTING,"/",Z+1,99),HOLDNG=HOLDNG-1 Q
	S ^C1GADV(71100.1,G,O,"L")=L
DR1	I L>0 S ^("O")="/"_O_^C1GADV(71100.1,G,L,"O")
	Q
CARRY	Q:TOTING[("/"_O_"/")  S ^C1GADV(71100.1,G,O,"L")=-1,HOLDNG=HOLDNG+1,TOTING="/"_O_TOTING
CARRYF	S Y=^C1GADV(71100.1,G,L,"O") F Z=2:1:$L(Y,"/")-1 I $P(Y,"/",Z)=O S ^("O")=$P(Y,"/",1,Z-1)_"/"_$P(Y,"/",Z+1,99) Q
	K Y,Z Q
MOVE	S MOL=L,L=^C1GADV(71100.1,G,O,"L") D:L>0 CARRY S L=MOL D DROP Q
HERE	S L=^C1GADV(71100.1,G,O,"L") I L<0!(L=LP)
	K L Q
AT	I ^C1GADV(71100.1,G,O,"L")=LP!(^("F")=LP)
	Q
LIQ	S O=^C1GADV(71100.1,G,"BOTTL","P") S:O<0 O=-1-O S O=$P("WATER//OIL","/",O+1) Q
