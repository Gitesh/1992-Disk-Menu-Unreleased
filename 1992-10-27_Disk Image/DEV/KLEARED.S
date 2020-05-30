        *********************************************************
 	*						        *
        * +-------+     			        ~    ~	*
	* |   |  ||         BITMAP DEMO JUNE 92       {. } {. }	*
 	* || .|   |  Source Code (C)1992 Gitesh Ramji    ( )	*
 	* |   |   |		                        \===/	*
 	* +-------+ 						*
	* Super Pong.....Comming soon to a PDL near you!        *
	*							*
	*********************************************************


	opt 	s-				no symbols
	clr.l 	-(sp)				clear stack
	move.w 	#$20,-(sp)			super mode
	trap 	#1				call gemdos
	addq.l 	#6,sp				correct stack
	move.l 	d0,oldstk			save old sp
	bclr 	#0,$484.w			no keyclick
	dc.w	$a00a				no mouse

	move.w	#0,-(sp)
	move.l	#-1,-(sp)
	move.l	#-1,-(sp)
	move.w 	#5,-(sp)
	trap	#14
	add.l	#12,sp

	bsr on

in	equ 	0
screen	equ 	4
scr1	equ 	8
scr2	equ 	12
send1	equ 	16
send2 	equ 	20
count1	equ 	24
count2	equ 	28
back	equ 	32
flag	equ 	36


f_open		MACRO 
		move 	#\1,-(a7)
		pea 	\2(pc)
		move 	#61,-(a7)
		trap 	#1
		addq.l 	#8,a7
		endm

f_close		MACRO
		move 	\1(a6),-(a7)
		move 	#62,-(a7)
		trap 	#1
		addq.l 	#4,a7
		endm

f_read		MACRO
		move.l 	\1,-(a7)
		move.l 	#\2,-(a7)
		move 	\3(a6),-(a7)
		move 	#63,-(a7)
		trap 	#1
		adda.l 	#12,a7
		endm

		move 	#-1,-(a7)
		move 	#0,-(a7)
		move 	#21,-(a7)
		trap 	#14
		addq.l 	#6,a7
		lea 	var(pc),a6
		move 	#2,-(a7)
		trap 	#14
		addq.l 	#2,a7
		move.l 	d0,screen(a6)

		move.l 	4(a7),a0
		move.l 	$c(a0),d0
		add.l 	$14(a0),d0
		add.l 	$1c(a0),d0
		add.l 	#65536,d0
		add.l 	d0,a0 
		move.l 	a0,back(a6)
		andi.l 	#$ffffff00,back(a6)
		
		move.l	#sc2+2,-(sp)
		move.w	#6,-(sp)
		trap	#14
		addq.l	#6,sp
		
		move.l 	#sc1,a0
		move.l 	a0,scr1(a6)
		move.l 	#sc2,a0
		move.l 	a0,scr2(a6)

		addi.l 	#34,scr1(a6)
		addi.l 	#34,scr2(a6)
		move.l	scr1(a6),a0
		adda.l 	#32000,a0
		move.l 	a0,send1(a6)
		move.l 	scr2(a6),a0
		adda.l 	#32000,a0
		move.l 	a0,send2(a6)

		clr.l 	count1(a6)
		clr.l 	count2(a6)
		
scroll		bsr 	setscr
		movea.l scr1(a6),a1
		move.l 	count1(a6),d0
		cmpi 	#200,d0
		bne 	s2
		clr.l 	d0
		move.l 	d0,count1(a6)

s2		move.l 	#160,d1
		mulu 	d1,d0
		adda.l 	d0,a1
		addq.l 	#1,count1(a6)
		movea.l scr2(a6),a2
		move.l 	count2(a6),d0
		bpl 	s1
		move.l 	#199,d0
		move.l 	d0,count2(a6)

s1		mulu 	d1,d0
		adda.l 	d0,a2
		subq.l 	#1,count2(a6)
		bsr 	draw

		move 	#11,-(a7)
		trap 	#1
		addq.l 	#2,a7
		tst 	d0
		beq 	scroll
		move 	#8,-(a7)
		trap 	#1
		addq.l 	#2,a7

		clr 	flag(a6)
		bsr 	setscr
		move 	#-1,-(a7)
		move 	#1,-(a7)
		move 	#21,-(a7)
		trap 	#14
		addq.l 	#6,a7
		clr 	-(a7)
		bsr 	off
		trap 	#1

setscr		eori 	#1,flag(a6)
		beq 	set1
		move 	#-1,-(a7)
		move.l 	screen(a6),-(a7)
		move.l 	#-1,-(a7)
		move 	#5,-(a7)
		trap 	#14
		adda.l 	#12,a7
		movea.l	back(a6),a0
		rts

set1		move 	#-1,-(a7)
		move.l 	back(a6),-(a7)
		move.l 	#-1,-(a7)
		move 	#5,-(a7)
		trap 	#14
		adda.l 	#12,a7
		movea.l screen(a6),a0
		rts

draw		move 	#199,d7
		
dloop		clr.w 	d6
		rept 	20
		move 	(a1),d0
		or 	2(a1),d0
		or 	4(a1),d0
		or 	6(a1),d0
		not 	d0
		move 	d0,d1
		swap 	d1
		move 	d0,d1
		move.l 	d1,d0
		and.l 	(a2)+,d0
		or.l 	(a1)+,d0
		move.l 	d0,(a0)+
		and.l 	(a2)+,d1
		or.l 	(a1)+,d1
		move.l 	d1,(a0)+
		endr

		move.w 	$ff8800,d6	;the raster bit
		add.w 	$ff8240,d6
		move.w 	d6,$ff8240

		cmp.l 	send2(a6),a2
		blt 	d1
		suba.l 	#32000,a2
		

d1		cmp.l 	send1(a6),a1
		blt 	d2
		suba.l 	#32000,a1


d2		dbra 	d7,dloop
		rts

var		ds.l	15



		move.w 	#7,-(sp)		wait key
		trap 	#1			call gemdos
		addq.l 	#2,sp			correct stack

		bsr 	off

		dc.w	$a009			mouse on

		move.w	#1,-(SP)
		move.l	#-1,-(sp)
		move.l	#-1,-(sp)
		move.w	#5,-(sp)
		trap	#14
		add.l	#12,sp

		move.l 	oldstk,-(sp)		back into
		move.w 	#$20,-(sp)		user mode
		trap 	#1			call gemdos
		addq.l 	#6,sp  			correct stack
		clr.w 	-(sp)			terminate
		trap #1				call gemdos

zippy		movem.l d0-a6,-(sp)		save registers
		bsr 	(music+8)		call playback
		movem.l (sp)+,d0-a6		restore registers
		move.l 	oldint,-(sp)		old vbl on sp
		rts				call old vbl

on		move.l 	$70.w,oldint		save old vbl
		moveq 	#1,d0			music #1
		bsr 	music			call init
		move.l 	#zippy,$70.w		install new vbl
		rts

off		move.l 	oldint,$70.w		restore old vbl
		move.l 	#$08080000,$ff8800	clear vol. chan A
		move.l 	#$09090000,$ff8800	clear vol. chan B
		move.l 	#$0a0a0000,$ff8800	clear vol. chan C
		rts

oldstk		dc.l 0
oldint		dc.l 0
music		incbin "a:\land.mus"		music filename 
sc1		incbin "a:\front.pi1"		top screen file
sc2		incbin "a:\back.pi1"		bottom file
