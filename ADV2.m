ADV2	;ADVENTURE.  FLH ; 07 FEB 83  12:39 PM
NEWLP	I CLOSNG,LNEW,LNEW<9 S LNEW=LP,M=130 D SPK S:'PANIC CLK2=15,PANIC=1
	S CONDLP=^ADV(LP,"c") I LNEW-LP,$E(CONDLP,1,2)="00" F DW=1:1:5 I DSEEN(DW),LD1(DW)=LNEW S LNEW=LP,M=2 D SPK Q
	S LP=LNEW I LP S CONDLP=^ADV(LP,"c") I $E(CONDLP,1,2)="00" D @$S(DFLAG=0:"DW1",DFLAG=1:"DW2",1:"DW3")
SHOW	G:'LP DEAD^ADV8
	S DARK=0,L=^ADVG(G,"LAMP","L") I L'<0!'LIT,L-LP!'LIT,'$E(CONDLP,3) S DARK=1
	D SHOWL G:'LP DEAD^ADV8 I $E(CONDLP) S WD1="FORCED",WD1X=^ADV(WD1) G TRAVEL^ADV3
	I LP=33,'CLOSNG,$R(10000)<2500 S M=8 D SPK
	I 'DARK S X=^ADVG(G,LP,"O") F J=2:1:$L(X,"/")-1 S O=$P(X,"/",J) D SHOWO
	S M=0 G TURN^ADV3
DW1	S:LP>14 DFLAG=1 Q
DW2	I LP>14,$R(10000)<500 D DW2A,DW2B S DFLAG=2,M=3,O="AXE",L=LP D SPK,DROP
	Q
DW2A	F I=1,2 I $R(10000)<5000 S LD($R(10000)\2000+1)=0
	Q
DW2B	F DW=1:1:5 I LD(DW)=LP S LD(DW)=18 Q
	Q
DW3	S (ND,ATTACK,STICK)=0,K="d" F DW=1:1:5 I LD(DW) D DMOV,DWARF:DSEEN(DW)
	I LD(6) S K="p",DW=6 D DMOV,PIRAT:DSEEN(DW)
	Q:'ND  I ND>1 W:S ! W !,"There are ",ND," threatening little dwarves in the room with you."
	E  S M=4 D SPK
	Q:'ATTACK  S:DFLAG=2 DFLAG=3 I ATTACK>1 W:S ! W !,ATTACK," of them throw knives at you!" S M=6
	E  S M=5 D SPK S M=52
	I STICK>1 W:S ! W !,STICK," of them get you!!"
	E  S M=M+STICK D SPK Q:'STICK
	S LP2=LP,LP=0 Q
DMOV	S Y=^ADV(LD(DW),K),N=0 F I=2:1:Y+1 S L=$P(Y,"/",I) I L-LD1(DW) S LL(N)=L,N=N+1
	S L=$S(N:LL($R(10000)*N\10000),1:LD1(DW)),LD1(DW)=LD(DW),LD(DW)=L K I,L,LL,N,Y
	S DSEEN(DW)=DSEEN(DW)&(LP>14)!(LD(DW)=LP)!(LD1(DW)=LP) S:DSEEN(DW) LD(DW)=LP Q
DWARF	S ND=ND+1 I LD(DW)=LD1(DW) S ATTACK=ATTACK+1 S:KNFL'<0 KNFL=LP S:$R(10000)<(DFLAG-2*950) STICK=STICK+1
	Q
PIRAT	Q:LP=114!(^ADVG(G,"CHEST","P")'<0)  S F=0
	F J=2:1:16 S O=$P(TR,"/",J) D PI1 E  S L=^ADVG(G,O,"L") G:L<0 STEAL S:L=LP F=1
	I TALLY2+1=TALLY,'F,^ADVG(G,"CHEST","L")=0 S L=^ADVG(G,"LAMP","L") I L<0!(L=LP),LIT G ST2
	I LD(6)-LD1(6),$R(10000)<2000 S M=127 D SPK
	Q
PI1	I O="PLATI",LP=100!(LP=101)
	Q
STEAL	S M=128 D SPK I ^ADVG(G,"MESSA","L")=0 S O="CHEST",L=114 D MOVE
	S O="MESSA",L=140 D MOVE
	F J=2:1:16 S O=$P(TR,"/",J) D PI1 E  S L=LP D:L=^ADVG(G,O,"L")&'^("F") CARRY I TOTING[("/"_O_"/") S L=114 D DROP
	G ST3
ST2	S M=186 D SPK S O="CHEST",L=114 D MOVE S O="MESSA",L=140 D MOVE
ST3	S (LD(6),LD1(6))=114,DSEEN(6)=0 Q
SHOWL	I DARK,'$E(CONDLP),WZDARK,$R(10000)<3500 S M=23,LP2=LP,LP=0 D SPK Q
	I TOTING["/BEAR/" S M=141 D SPK
	I DARK S M=16 D SPK Q
	S J=^ADVG(G,LP,"A"),^("A")=J+1#ABB,X=^ADV(LP,0) I J,X["/" W:S ! W !,$P(X,"/",2) Q
	I X W:S ! F I=1:1:X W !,^(I)
	Q
SHOWO	I O="STEPS",TOTING["/GOLD/" Q
	S P=^ADVG(G,O,"P") I P<0 Q:CLOSED  S (^("P"),P)=O="RUG"!(O="CHAIN"),TALLY=TALLY-1 I TALLY,TALLY=TALLY2,LIMIT>35 S LIMIT=35
	I O="STEPS",LP=^ADVG(G,O,"F") S P=1
	D PSPK Q
SPK	W:S ! F I=1:1:^ADV("t",M,0) W !,^(I)
	K I Q
PSPK	S N=^ADV(O,P,0) I N W:S ! F I=.1:.1:N W !,^(I)
	K I,N Q
DROP	F Z=2:1:HOLDNG+1 I $P(TOTING,"/",Z)=O S TOTING=$P(TOTING,"/",1,Z-1)_"/"_$P(TOTING,"/",Z+1,99),HOLDNG=HOLDNG-1 Q
	S ^ADVG(G,O,"L")=L
DR1	I L>0 S ^("O")="/"_O_^ADVG(G,L,"O")
	Q
CARRY	Q:TOTING[("/"_O_"/")  S ^ADVG(G,O,"L")=-1,HOLDNG=HOLDNG+1,TOTING="/"_O_TOTING
CARRYF	S Y=^ADVG(G,L,"O") F Z=2:1:$L(Y,"/")-1 I $P(Y,"/",Z)=O S ^("O")=$P(Y,"/",1,Z-1)_"/"_$P(Y,"/",Z+1,99) Q
	K Y,Z Q
MOVE	S MOL=L,L=^ADVG(G,O,"L") D:L>0 CARRY S L=MOL D DROP Q
