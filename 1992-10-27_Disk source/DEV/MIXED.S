
lowres	equ	0
medres	equ	1
hires	equ	2

	dc.w	$a00a		;turn off mouse
	clr.l	-(sp)		;push parameters for supermode
	move.w	#$0020,-(sp)	;onto the stack
	trap	#1		;call the gemdos routine
	addq.w	#6,sp		;correct the stack
	move.l	d0,savesp	;save the old stack value
	move.l	#mypal,-(sp)	;address of palette in memory
	move.w	#$0006,-(sp)	;function 6-setpalette
	trap	#14		;set the palette
	addq.w	#6,sp
	move.w	#lowres,-(sp)	;place mode required on stack
	move.l	#-1,-(sp)	;dont effect screen address
	move.l	#-1,-(sp)	;dont effect screen address
	move.w	#$0005,-(sp)	;function 5-setscreen
	trap	#14		;set the screen resolution
	add.w	#12,sp
	move.w	#$0002,-(sp)	;function 2-physbase
	trap	#14		;calculate the address
	addq.w	#2,sp		;correct the stack
	move.l	d0,screenbase	;save the base address for later
	move.l	#clearscreenz,$bc	;trap #15 vector
	trap	#15			;clear the screen
	move.l	$70,oldaddress		;save old vbl address
	move.l	#vbl,$70.w		;new address
	move.l	#text,-(sp)	;place address onto stack
	move.w	#$0009,-(sp)	;function 9-print line
	trap	#1		;print the text
	addq.w	#6,sp
	move.w	#$0001,-(sp)	;function 1-conin
	trap	#1		;wait for a key
	addq.w	#2,sp
	move.l	oldaddress,$70		;restore VBL address
	move.l	#gempal,-(sp)	;address of palette in memory
	move.w	#$0006,-(sp)	;function 6-setpalette
	trap	#14		;set the palette
	addq.w	#6,sp
	move.l	savesp,-(sp)	;push on old stack value
	move.w	#$0020,-(sp)	;function $0020-user mode
	trap	#1		;put 68000 into user mode
	addq.w	#6,sp		;correct stack after the 2 pushes
	clr.w	-(sp)		;function 0-terminate program
	trap	#1		;now go back to gem


clearscreenz
	move.l	screenbase,a0		;start of screen
	move.w	#32000-1,d7		;loop for 32000 bytes
fill	move.l	#$aaff,(a0)+  		;fill wil %10101010
	dbra	d7,fill			;all the screen
	rte				;finish exception

vbl	movem.l	d0-d7/a0-a6,-(sp)	;save registes on stack
	move.w	#5000,d6		;wait till visible
top	dbra	d6,top
	move.w	#$700,d7		;first color=white
bars	move.w	d7,$ffff8240		;set pallete color
	move.w	#500,d6			;delay for band
delay	dbra	d6,delay
	sub.w	#$100,d7		;count colors $777,$666-$000
	bcc.s	bars			;brach to 'bars' if not done
	movem.l	(sp)+,d0-d7/a0-a6	;restore registers
	rte				;quit exception





savesp	dc.l	0	;storage for stack in memory
screenbase
	dc.l	0	;where the top of the screen is located
oldaddress
	dc.l	0

mypal	dc.w	$007,$000,$000,$777,$000,$000,$000,$000
	dc.w	$707,$770,$000,$000,$000,$000,$000,$777

gempal	dc.w	$001,$777,$777,$777,$777,$777,$777,$777
	dc.w	$777,$777,$777,$777,$777,$777,$777,$777

text	dc.b	13,10
	dc.b	"||||||/\                        /\||||||"
	dc.b 	13,10
	dc.b	"||||||\/  WELCOME TO THE MEGA   \/||||||"
	dc.b 	13,10
	dc.b	"||||||                            ||||||"
	dc.b 	13,10
	dc.b	"||||||/\   BITMAP COLLECTION    /\||||||"
	dc.b 	13,10
	dc.b	"||||||\/                        \/||||||"
	dc.b	13,10
	dc.b	"||||||        IN 100% M\C         ||||||"
	dc.b    13,10
	dc.b    "||||||                            ||||||"
	dc.b 	13,10
	dc.b	" ||||                              |||| "
	dc.b	13,10
	dc.b	"  ||                                ||  "
	dc.b	13,10
	dc.b	"                                        "
	dc.b	13,10
	dc.b    " During the slideshow, press Q to quit, " 
	dc.b    13,10
	dc.b    "                                        "
	dc.b	13,10
	dc.b    "     Press ALT+HELP to change music.    "
	dc.b    13,10
	dc.b 	"                                        "
	dc.b	13,10
	dc.b	" Look at those high-res ASCII graphics! "
	dc.b	13,10
	dc.b 	"                                        "
	dc.b	13,10
	dc.b 	"                                        "
	dc.b	13,10
	dc.b    "  \\|||//                       ^ ^     "
	dc.b	13,10
	dc.b	"   \O O/          oo          (.) (.)   "
	dc.b	13,10
	dc.b	"    \o/         \(  )/      |\ { ^ } /| "
	dc.b	13,10
	dc.b    "     |         ^  ^^  ^         ^ ^     "
	dc.b	13,10
	dc.b    " FIDO DIDO       FROG           BAT     "
	dc.b	13,10
	dc.b    "_---------_______----___________---_____"
	dc.b	0
	even
