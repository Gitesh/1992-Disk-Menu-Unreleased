
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
	move.l	#text,-(sp)	;place address ont        ATAX
          CRACKED
          TIMEBLAST

MENU 37   OPERATION WOLF
          TOPGUN                   ;total crap. get SKYCHASE instead 
 
MENU 38   MISSION ELEVATOR
          IKARI WARRIORS
          FLINTSTONES
          MUNSTERS
          CHECKERS

MENU 47   RAMBO 3
          TRANSPUTER
          FREE CLIMBING
          YAHTZEE
          ZXYM

MENU 35   PAC-MANIA
          SOLOMANS KEY
          INTERNATIONAL KATATE     } great disk, get it. 
          PEPSI CHALLANGE
          HARRIER STRIKE MISSION
          METROCROSS
          HELLFIRE

MENU ??   F.O.F.T.
          FOOTBALL MANAGER 2
          SCREEMING WINGS          ;shoot-em-up, great samples
          MOUSE TRAP
          BOMBJACK

MENU ??   ENDURO RACER
          CHUBBY GRISTLE
          ELIMINATOR
          NEBULOUS

MENU ??   TURBO CUP
          FLYING SHARK             ;good shoot-em-up
          SNAFFUX.BOB

MENU ??   SPEEDBALL
          LIVE & LET DIE
          CHUCKIE EGG

=========================================================================


*******************
 * The Medway Boys *
  *******************

CHUCK ROCK

GODS (2 DISKS)                    ;bitmap bros game

SPEEDBALL 2                       ;original was bugged no one noticed!

TOKI                              ;100% arcade conversion

LED STORM                         ;nice game, nice chip music

NAVY SEALS                        
SKULL AND CROSSBONES              ; both on one disk

MENU 10   HONDA RVF
          DARKSIDE
          SKULLDIGGERY+
          3D POOL
          SAVAGE 1,2, & 3

MENU 37   PIRATES

MENU 40   XENON 2

MENU 43   STUNT CAR RACER
          FAST LANE
          ANNALS OF ROME

MENU 75   KICKOFF 2
          DYNASTY WARS

MENU 76   FLOOD
          GAZZA'S SOCCER
          MUSIC+SOURCE

MENU 84   BACK TO THE FUTURE 2
          PROFESSOR MORIARTI
          GAME CRACKER 4

MENU 93   MICROPROSE SOCCER
          RICK DANGEROUS 2
          VIRUS PROTECTOR 3
        
MENU 98   JAMES POND
          LOTUS ESPRIT TURBO CHALLENGE

===============================================================


********************
 *  Pompey Pirates  *
  ********************


MENU 005  TVS SPORTS FOOTBALL
          LOMBARD RAC RALLY

MENU 006  F-16 COMBAT PILOT
          F-16 EDITOR
          MIDI MAZE

MENU 010  POPULOUS                ;hours of gameplay
          PROMISED LAND (EXT)     ;is too addictive
          FUSION

MENU 013a KID GLOVES
          SHOOT'EM UP CONST. KIT

MENU 018  BATMAN
          SNOOPY
          TOOBIN

MENU 020  INTERPHASE
          HARD DRIVING
          SUPER SCRAMBLE

MENU 025  PLAYER MANAGER
          ULTIMATE DARTS
          CONQUEROR
          SPY VS SPY 2
          FASTCOPY 3
          UNIV. ITEM SELECTOR 3
          
MENU 029  INFESTATION
          INFESTATION INTRO
          LODE RUNNER            
          TURBO ST

MENU 032  WARHEAD
          THE CARTOGRAPHER
          CLOUD KINGDOMS

MENU 039  RESOLUTION 101
          KLAX
          A-DEBUG
          PACK-ICE

MENU 045  FLOOD
          BLUE ANGELS
          PACK ICE V2.11
          POMPEY PACKER V1.5

MENU 051  FALCON MISSION 2
          FALCON COCKPIT GUIDE
          FALCON MAPS
          SLY SPY SECRET AGENT

MENU 053  TURRICAN


MENU 055  ITALY 1990
          THE CRYPT
          CASTLE MASTER
          DEFSEL
          CLOUD KINGDOMS TRAINER
          
MENU 058  PROFLIGHT
          MURDER
          THE SPY WHO LOVED ME

MENU 061  A.T.F. 2                ;fantastic game
          NITRO
          PINHEAD 1.8

MENU 062  STRIDER 2
          ROBOCOP 2

MENU 063  SHADOW DANCER
          ON PULL

MENU 064  HEROQUEST
          LLAMATRON (1 MEG)

MENU 065  PUZZNIC
          PANG
          WELLTRIS

MENU 066  CHASE HQ 2
          LOOPZ
          EDD THE DUCK

MENU 070  CARVUP
          JUDGE DREDD             ;nice game

MENU 073  HARD DRIVIN'2
          NARC

MENU 074  TEAM SAZUKI
          INSECTS IN OUTER SPACE
          ZOMBIES FROM THE CRYPT
          
MENU 076  THE KILLING GAME SHOW   ;great intro, ok game

MENU 079  LEMMINGS
          STE MENU FIXES
          UNIVERSAL ITEM SELECTOR

MENU 082  Z-OUT
          POMPEY PACKER V1.99
          JAMPACKER V3
          
MENU 085  PRO TENNIS TOUR 2
          LLAMATRON (512K)

MENU 088  MERCS
          FASTCOPY PROFESSIONAL   ; pre-release version
          DEVPAC V2.25

MENU 094  MEGA LO MANIA
          FAST COPY PROFFESIONAL  ; release version with many new options

MENU 095  HUNTER
          LOTUS TURBO II
          HEAD OVER HEALS         ;speccy clasic converted
          
MENU 099  WOLF CHILD
          BLUES BROTHERS

MENU 108a ROBOCOP 3 DISK 1        ;brilliant fast 3d  game

MENU 108b ROBOCOP 3 DISK 2        ;again, my type of game!

MENU 110  PUSHOVER                ;great lemmings type game

IN THEIR FINEST HOUR THE BATTLE OF BRITAIN

================================================================


 ********************
  *  The Replicants  *
   ********************

MAGIC POCKETS                     ; a bitmap bros game

XENON II                          ; a bitmap bros game

PAPERBOY                          ; classic, ok.

ONSLAUGHT                         ; nice game, too difficult

SWIV                              ; ok shoot-em-up

HUMAN KILLING CLOUD (2 DISKS)     ; brill, my type of game!

METAL MUTANTS                     

=========================================================================


*****************
 *  Revoloution  *
  *****************

MENU  9   TOTAL ECLIPSE
          GRAND MONSTER SLAM

MENU 10   MICROPROSE SOCCER
          SAVAGE
          MILLENIUM 2.2

=========================================================================


***********
 *  OTHER  *
  ***********


MENU 36a  BACK TO THE FUTURE 2
          DAYS OF THUNDER         ; FOF 
          SHADOW OF THE BEAST (a)
                                  
MENU 36b  SHADOW OF THE BEASY (B) ; FOF

MENU 71a  TOTAL RECALL (A)
          TOUNAMENT GOLF          ; G-Force
          NOVA

MENU 71b  TOTAL RECALL (B)        ; G-Force

menu  3   RODLAND +
          BLUES BROTHERS
          JIMMY WHITES W. SNOOKER ; Awesome

MENU  7   DELUXE PAINT            ; Slippery Sid & Slimeballs
          PRINT
          VIEWER
          CONVERT

MENU 111  HARLEQUIN               ; superior

ART 1     DEGAS ELITE
          HYPER PAINT
          PAINT POT
          SPECTRUM 512
          FLEXIDUMP V3.02         ; F.C.C.
          FLEXI CATALOGUE
          CUSTOM EDITOR
          FONT EDITOR
          FONT CONVERT

          VIZ
          INSECTS IN SPACE        ; now 5

          PAKI BASH
          SPEEDBALL 2
          SASH DOC 1              ; the crack connection
          CRACKING MUSAX

          A.P.B
          NIGHT WALK              ; birdy 

          RICK DANGEROUS
          SWITCHBLADE
          BLACK LAMP
          3D POOL
          MYTH

          EMPIRE STRIKES BACK
          CHUCKIE EGG
          ENDURO RACER
          JOE BLADE
          SKYCHASE

JUMPING JACK'S SON                ; M.C.A.

RAINBOW ISLANDS                   ; Equinox

BEACH VOLLY                       ; Manolo Le Gitao

CALAFORNIA GAMES                  ; V8

TECHNOCOP                         ; cracked by the abc man



UNIVERSAL RUGBY SIM

FINAL FIGHT (2 disks)

=================================================================


***********
 *  DEMOS  *
  ***********

THE DECADE DEMO                   ; inner circle

AMIGA DEMO                        ; the execptions

CUDDLY DEMO                       ; the carebears

WHATTA HECK 