ORG 0

Reset:

loadi 1
out SqGenDur
loadi 0
out hex0

loadi 63
store song0length
loadi 111
store song1length
loadi 136
store song2length
loadi 118
store song3length
loadi 126
store song4length

in Switches
and Bit0
jpos playSong0

in Switches
and Bit1
jpos playSong1

in Switches
and Bit2
jpos playSong2

in Switches
and Bit3
jpos playSong3

in Switches
and Bit4
jpos playSong4

in Switches
and Bit5
jpos playSong5

in Switches
and Bit6
jpos playSong6

loadi 0
out dps
out hex1

jump Reset

playSong0:
load Start0
store Index
load EndIndex0
store EndIndex
load song0length
store NotesLeft
jump Loop

playSong1:
load Start1
store Index
load EndIndex1
store EndIndex
load song1length
store NotesLeft
jump Loop

playSong2:
load Start2
store Index
load EndIndex2
store EndIndex
load song2length
store NotesLeft
jump Loop

playSong3:
load Start3
store Index
load EndIndex3
store EndIndex
load song3length
store NotesLeft
jump Loop

playSong4:
load Start4
store Index
load EndIndex4
store EndIndex
load song4length
store NotesLeft
jump Loop

playSong5:
load Start5
store Index
load EndIndex5
store EndIndex
loadi 2
store NotesLeft
jump Loop

playSong6:

loadi 8
out SqGenDur
load A4mem
out SqGen

call WaitForSpace

loadi 4
out SqGenDur
load C4mem
out SqGen

call WaitForSpace

jump Reset


Index: DW 0
EndIndex: DW 0
NotesLeft: DW 0

Loop:
    call WaitForSpace

	iload index
	out SqGen

	; restart at end of song
	load Index
	sub EndIndex
	jzero Reset

	; display duration left, in notes
    load NotesLeft
    addi -1
	store NotesLeft

	; increment to next note
	load Index
	addi 1
	store Index
	jump Loop

PlayPause:

in Switches
and bit9
jzero Paused

loadi 1
out SqGenPause

return

Paused:

; instruct peripheral to pause
loadi 0
out SqGenPause

; re-check switches while paused.
jump PlayPause

return

; "Mary had a little lamb" song
Start0: DW Song0
EndIndex0: DW EndSong0
Song0:
		DW SL
		DW SL
		DW SL
		DW E5
		DW E5
		DW SL
		DW D5
		DW C5
		DW SL
		DW D5
		DW SL
		DW E5
		DW SL
		DW E5
		DW SL
		DW E5
		DW E5
		DW E5
		DW SL
		DW D5
		DW SL
		DW D5
		DW SL
		DW D5
		DW D5
		DW SL
		DW SL
		DW E5
		DW SL
		DW G5
		DW SL
		DW G5
		DW G5
		DW G5
		DW SL
		DW E5
		DW E5
		DW SL
		DW D5
		DW C5
		DW SL
		DW D5
		DW SL
		DW E5
		DW SL
		DW E5
		DW SL
		DW E5
		DW sl
		DW E5
		DW SL
		DW D5
		DW SL
		DW D5
		DW SL
		DW E5
		DW SL
		DW D5
		DW SL
		DW C5
		DW C5
		DW C5
		dw sl
EndSong0: DW sl

Start1: DW Song1
EndIndex1: DW EndSong1

;"Happy Birthday" Song
Song1:
		DW SL
		DW SL
		DW C4
		DW SL
		DW SL
		DW C4
		DW SL
		DW D4
		DW D4
		DW D4
		DW SL
		DW C4
		DW C4
		DW C4
		DW SL
		DW F4
		DW F4
		DW F4
		DW SL
		DW E4
		DW E4
		DW E4
		DW E4
		DW E4
		DW E4
		DW SL
		DW SL
		DW C4
		DW SL
		DW SL
		DW C4
		DW SL
		DW D4
		DW D4
		DW D4
		DW SL
		DW C4
		DW C4
		DW C4
		DW SL
		DW G4
		DW G4
		DW G4
		DW SL
		DW F4
		DW F4
		DW F4
		DW F4
		DW F4
		DW F4
		DW SL
		DW SL
		DW C4
		DW SL
		DW SL
		DW C4
		DW SL
		DW C5
		DW C5
		DW C5
		DW SL
		DW A4
		DW A4
		DW A4
		DW SL
		DW F4
		DW F4
		DW SL
		DW F4
		DW SL
		DW E4
		DW E4
		DW E4
		DW SL
		DW D4
		DW D4
		DW D4
		DW D4
		DW D4
		DW D4
		dw d4
		dw d4
		dw d4
		dw d4
		dw sl
		dw sl
		DW SL
		DW SL
		DW A4#
		DW SL
		DW SL
		DW A4#
		DW SL
		DW A4
		DW A4
		DW A4
		DW SL
		DW F4
		DW F4
		DW F4
		DW SL
		DW G4
		DW G4
		DW G4
		DW SL
		DW F4
		DW F4
		DW F4
		DW F4
		DW F4
		DW F4
		dw sl
EndSong1: DW sl

Start2: DW Song2
Index2: DW Song2
EndIndex2: DW EndSong2

;"Barbie Girl" Song
Song2:
		DW SL
		DW SL
		DW G4#
		DW G4#
        DW E4
		DW E4
		DW G4#
		DW G4#
		DW C5#
		DW C5#
		DW A4
		DW A4
		DW A4
		DW A4
		DW A4
		DW SL
		DW SL
		dw sl
		DW F4#
		DW F4#
		DW D4#
		DW D4#
		DW F4#
		DW F4#
		DW B4
		DW B4
		DW G4#
		DW G4#
		DW G4#
		DW G4#
		DW F4#
		DW F4#
		DW E4
		DW E4
		DW SL
		DW SL
		DW E4
		DW E4
		DW C4#
		DW C4#
		DW E4
		DW E4
		DW F4#
		DW F4#
		DW F4#
		DW F4#
		DW C4#
		DW C4#
		DW C4#
		DW C4#
		DW SL
		DW SL
		DW SL
		dw sl
		DW F4#
		DW F4#
		DW E4
		DW E4
		DW G4#
		DW G4#
		DW G4#
		DW G4#
		DW F4#
		DW F4#
		DW F4#
		DW F4#
		DW G4#
		DW G4#
        DW E4
		DW E4
		DW G4#
		DW G4#
		DW C5#
		DW C5#
		DW A4
		DW A4
		DW A4
		DW A4
		DW A4
		DW SL
		DW SL
		dw sl
		DW F4#
		DW F4#
		DW D4#
		DW D4#
		DW F4#
		DW F4#
		DW B4
		DW B4
		DW G4#
		DW G4#
		DW G4#
		DW G4#
		DW F4#
		DW F4#
		DW E4
		DW E4
		DW SL
		DW SL
		DW E4
		DW E4
		DW C4#
		DW C4#
		DW E4
		DW E4
		DW F4#
		DW F4#
		DW F4#
		DW F4#
		DW C4#
		DW C4#
		DW C4#
		DW C4#
		DW SL
		DW SL
		DW SL
		dw sl
		DW F4#
		DW F4#
		DW E4
		DW E4
		DW G4#
		DW G4#
		DW G4#
		DW G4#
		DW F4#
		DW F4#
		DW F4#
		DW F4#
		DW E4
		DW E4
		DW C4#
		DW C4#
		dw c4#
		dw sl
EndSong2: DW sl

Start3: DW Song3
EndIndex3: DW EndSong3

; "I'm Blue" Song
Song3:
		DW SL
		DW SL
		DW A4#
		DW A4#
		DW A4#
		DW A4#
		DW G4
		DW G4
		DW A4#
		DW A4#
		DW C5
		DW C5
		DW F4
		DW F4
		DW A4
		DW A4
		DW A4#
		DW A4#
		DW A4#
		DW A4#
		DW G4
		DW G4
		DW A4#
		DW A4#
		DW G4
		DW G4
		DW D5#
		DW D5#
		DW D5#
		DW D5#
		DW D5
		DW D5
		DW C5
		DW C5
		DW A4#
		DW A4#
		DW A4#
		DW A4#
		DW G4
		DW G4
		DW A4#
		DW A4#
		DW C5
		DW C5
		DW F4
		DW F4
		DW A4
		DW A4
		DW A4#
		DW A4#
		DW A4#
		DW A4#
		DW G4
		DW G4
		DW A4#
		DW A4#
		DW G4
		DW G4
		DW D5#
		DW D5#
		DW D5#
		DW D5#
		DW D5
		DW D5
		DW C5
		DW C5
		DW A4#
		DW A4#
		DW A4#
		DW A4#
		DW G4
		DW G4
		DW A4#
		DW A4#
		DW C5
		DW C5
		DW F4
		DW F4
		DW A4
		DW A4
		DW A4#
		DW A4#
		DW A4#
		DW A4#
		DW G4
		DW G4
		DW A4#
		DW A4#
		DW G4
		DW G4
		DW D5#
		DW D5#
		DW D5#
		DW D5#
		DW D5
		DW D5
		DW C5
		DW C5
		DW A4#
		DW A4#
		DW A4#
		DW A4#
		DW G4
		DW G4
		DW A4#
		DW A4#
		DW A4
		DW A4
		DW C4
		DW C4
		DW F4
		DW F4
		DW G4
		DW G4
		DW G4
		DW G4
		dw g4
		dw sl
EndSong3: DW sl

Start4: DW Song4
EndIndex4: DW EndSong4

; "Jingle Bell" Song
Song4:
		DW SL
		DW SL
		DW E4
		DW SL
		DW E4
		DW SL
		DW E4
		DW E4
		DW E4
		dw sl
	    DW E4
		DW SL
		DW E4
		DW SL
		DW E4
		DW E4
		DW E4
		dw SL
		DW E4
		DW E4
		DW G4
		DW G4
		DW C4
		DW C4
		DW C4
		DW D4
		DW E4
		DW E4
		DW E4
		DW E4
		DW SL
		DW SL
		dw sl
		dw sl
		DW F4
		DW SL
		DW F4
		DW SL
		DW F4
		DW F4
		DW SL
		DW F4
		DW F4
		dw f4
		DW E4
		DW SL
		DW E4
		DW E4
		dw sl
		DW SL
		dw e4
		dw sl
		DW D4
		DW SL
		DW D4
		dw sl
		DW E4
		dw sl
		DW D4
		DW SL
		dw sl
		dw sl
		DW G4
		dw g4
		dw sl
		dw sl
		DW E4
		DW SL
		DW E4
		DW SL
		DW E4
		DW E4
		DW E4
		dw sl
	    DW E4
		DW SL
		DW E4
		DW SL
		DW E4
		DW E4
		DW E4
		dw SL
		DW E4
		DW E4
		DW G4
		DW G4
		DW C4
		DW C4
		DW C4
		DW D4
		DW E4
		DW E4
		DW E4
		DW E4
		DW SL
		DW SL
		dw sl
		dw sl
		DW F4
		DW SL
		DW F4
		DW SL
		DW F4
		DW F4
		DW SL
		DW F4
		DW F4
		dw f4
		DW E4
		DW SL
		DW E4
		DW E4
		dw sl
		DW SL
		DW G4
		DW SL
		DW G4
		dw sl
		DW F4
		DW F4
		DW SL
		DW D4
		DW C4
		DW C4
		dw c4
		dw sl
EndSong4: DW sl

Start5: DW Song5
EndIndex5: DW EndSong5

; Frequency tester
Song5:
		DW C4
		DW C4
		DW C4
		DW C4
        DW A4
        DW A4
        DW A4
EndSong5: DW A4


;useful constants
Hex0: EQU &H004
Hex1: EQU &H005
SqGen: EQU &H020
SqGenDur: EQU &H021
SqGenSpace: EQU &H022
SqGenPause: EQU &H023
Switches: EQU &H000
LEDs: EQU &H001
DPs:       EQU &H0E0

SL:  EQU 0
C2:  EQU 65
C2#: EQU 69
D2:  EQU 73
D2#: EQU 78
E2:  EQU 82
F2:  EQU 87
F2#: EQU 93
G2:  EQU 98
G2#: EQU 104
A2:  EQU 110
A2#: EQU 117
B2:  EQU 123
C3:  EQU 131
C3#: EQU 139
D3:  EQU 147
D3#: EQU 156
E3:  EQU 165
F3:	 EQU 175
F3#: EQU 185
G3:  EQU 196
G3#: EQU 208
A3:  EQU 220
A3#: EQU 233
B3:  EQU 247
C4:  EQU 262
C4#: EQU 277
D4:  EQU 294
D4#: EQU 311
E4:	 EQU 330
F4:	 EQU 349
F4#: EQU 370
G4:  EQU 392
G4#: EQU 415
A4:  EQU 440
A4#: EQU 466
B4:  EQU 494
C5:  EQU 523
C5#: EQU 554
D5:  EQU 587
D5#: EQU 622
E5:	 EQU 659
F5:  EQU 698
F5#: EQU 740
G5:  EQU 784
G5#: EQU 831
A5:  EQU 880
A5#: EQU 932
B5:  EQU 988
C6:  EQU 1047
C6#: EQU 1109
D6:  EQU 1175
D6#: EQU 1245
E6:  EQU 1319
F6:	 EQU 1397
F6#: EQU 1480
G6:  EQU 1568
G6#: EQU 1661
A6:  EQU 1760
A6#: EQU 1865
B6:  EQU 1976
C7:  EQU 2093

noteFrequencyMap:
C2mem:  dw 65
C2#mem: dw 69
D2mem:  dw 73
D2#mem: dw 78
E2mem:  dw 82
F2mem:  dw 87
F2#mem: dw 93
G2mem:  dw 98
G2#mem: dw 104
A2mem:  dw 110
A2#mem: dw 117
B2mem:  dw 123
C3mem:  dw 131
C3#mem: dw 139
D3mem:  dw 147
D3#mem: dw 156
E3mem:  dw 165
F3mem:	 dw 175
F3#mem: dw 185
G3mem:  dw 196
G3#mem: dw 208
A3mem:  dw 220
A3#mem: dw 233
B3mem:  dw 247
C4mem:  dw 262
C4#mem: dw 277
D4mem:  dw 294
D4#mem: dw 311
E4mem:	 dw 330
F4mem:	 dw 349
F4#mem: dw 370
G4mem:  dw 392
G4#mem: dw 415
A4mem:  dw 440
A4#mem: dw 466
B4mem:  dw 494
C5mem:  dw 523
C5#mem: dw 554
D5mem:  dw 587
D5#mem: dw 622
E5mem:	 dw 659
F5mem:  dw 698
F5#mem: dw 740
G5mem:  dw 784
G5#mem: dw 831
A5mem:  dw 880
A5#mem: dw 932
B5mem:  dw 988
C6mem:  dw 1047
C6#mem: dw 1109
D6mem:  dw 1175
D6#mem: dw 1245
E6mem:  dw 1319
F6mem:	 dw 1397
F6#mem: dw 1480
G6mem:  dw 1568
G6#mem: dw 1661
A6mem:  dw 1760
A6#mem: dw 1865
B6mem:  dw 1976
C7mem:  dw 2093

noteFrequencyMapEnd: DW C7mem

dw &H1C2 ; this just needs to be not C2.
noteDisplayMap:
C2dis:  dw &H0C2
C2s:    dw &H0C2
D2dis:  dw &H0D2
D2#dis: dw &H0D2
E2dis:  dw &H0E2
F2dis:  dw &H0F2
F2#dis: dw &H0F2
G2dis:  dw &H062
G2#dis: dw &H062
A2dis:  dw &H0A2
A2#dis: dw &H0A2
B2dis:  dw &H0B2
C3dis:  dw &H0C3
C3#dis: dw &H0C3
D3dis:  dw &H0D3
D3#dis: dw &H0D3
E3dis:  dw &H0E3
F3dis:	 dw &H0F3
F3#dis: dw &H0F3
G3dis:  dw &H063
G3#dis: dw &H063
A3dis:  dw &H0A3
A3#dis: dw &H0A3
B3dis:  dw &H0B3
C4dis:  dw &H0C4
C4#dis: dw &H0C4
D4dis:  dw &H0D4
D4#dis: dw &H0D4
E4dis:	 dw &H0E4
F4dis:	 dw &H0F4
F4#dis: dw &H0F4
G4dis:  dw &H064
G4#dis: dw &H064
A4dis:  dw &H0A4
A4#dis: dw &H0A4
B4dis:  dw &H0B4
C5dis:  dw &H0C5
C5#dis: dw &H0C5
D5dis:  dw &H0D5
D5#dis: dw &H0D5
E5dis:	 dw &H0E5
F5dis:  dw &H0F5
F5#dis: dw &H0F5
G5dis:  dw &H065
G5#dis: dw &H065
A5dis:  dw &H0A5
A5#dis: dw &H0A5
B5dis:  dw &H0B5
C6dis:  dw &H0C6
C6#dis: dw &H0C6
D6dis:  dw &H0D6
D6#dis: dw &H0D6
E6dis:  dw &H0E6
F6dis:	 dw &H0F6
F6#dis: dw &H0F6
G6dis:  dw &H066
G6#dis: dw &H066
A6dis:  dw &H0A6
A6#dis: dw &H0A6
B6dis:  dw &H0B6
C7dis:  dw &H0C7

noteDisplayMapEnd: dw C7dis

song0length: dw 63
song1length: dw 111
song2length: dw 136
song3length: dw 118
song4length: dw 126


;useful values
Bit0: DW &B0000000001
Bit1: DW &B0000000010
Bit2: DW &B0000000100
Bit3: DW &B0000001000
Bit4: DW &B0000010000
Bit5: DW &B0000100000
Bit6: DW &B0001000000
Bit7: DW &B0010000000
Bit8: DW &B0100000000
Bit9: DW &B1000000000


noteDisplay: DW 0

noteFrequencyMapLoc: DW noteFrequencyMap
noteDisplayMapLoc: DW noteDisplayMap

displayNotePtr: DW 0

displayNote:
    store noteDisplay
    jzero terminateMatchedZero

    load noteFrequencyMapLoc
    store displayNotePtr

finder:
    load displayNotePtr
    sub noteFrequencyMapEnd
    jzero terminateNoMatch
    jpos terminateNoMatch

    iload displayNotePtr
    sub noteDisplay
    jzero terminateMatched

    load displayNotePtr
    addi 1
    store displayNotePtr

    jump finder

terminateNoMatch:
    loadi 0
    out hex0
    out dps

    return

displayedNote: DW 0

terminateMatched:
    load displayNotePtr
    sub noteFrequencyMapLoc
    add noteDisplayMapLoc
    store displayNotePtr
    iload displayNotePtr

    ; output the C2 or whatever to the left hex display
    out hex1

    ; which note did we show?
    store displayedNote

    ; now, we need to determine whether to set the decimal point
    ; check the previous value in memory -- if the same, then
    load displayNotePtr
    addi -1
    store displayNotePtr
    iload displayNotePtr
    sub displayedNote
    jzero isSharp
    jump notSharp
isSharp:
	loadi 32
	out dps
    return

notSharp:
    loadi 0
    out dps
    return

; silent note
terminateMatchedZero:
    loadi 0
    out dps
    loadi 0
    out hex1

return

WaitForSpace:

    in SqGen
    call displayNote

    in Switches
    and Bit8
    jzero DisplayNotesLeft
    in SqGenDur
    out hex0
    jump EndDisplayDuration

    DisplayNotesLeft:
	load NotesLeft
	out hex0
    EndDisplayDuration:

    call PlayPause

	in SqGenSpace
	jzero WaitForSpace
    return
