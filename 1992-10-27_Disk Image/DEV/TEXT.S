		clr.w	-(sp)
		move.l	#filename,(sp)
		move.w	#$3d,-(sp)
		trap	#1
		addq.l	#8,sp

		move.w	d0,filehandle
		move.l	#buffer,-(a7)
		move.l	#80*24,-(a7)
		move.w	d0,-(a7)
		move.w	#$3f,-(a7)
		trap #1
		lea	12(a7),a7

		clr.b	nullterm
		move.l	#buffer,-(a7)
		move.w	#9,-(a7)
		trap #1
		addq.l	#6,a7

		move.w	#2,-(a7)
		move.w	#2,-(a7)
		trap 	#13
		addq.l	#4,a7
		move.w	filehandle,d0

filename	dc.b "a:\dev\mega.s",0
		bss

buffer		ds.b 80*24

nullterm	ds.b 1

filehandle	ds.w 1