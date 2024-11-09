screen	START	0
first	+LDB	#scr
	BASE	scr
	LDCH	#65
	STCH	scr
	LDX	#3
	STCH	scr, X
	LDCH	#66
	JSUB	fill
	JSUB	clear
	NOBASE
halt	J	halt

clear	LDA	#32
	JSUB	fill
	RSUB

.fill screen with symbol in register A
fill
	STL	@sp
	JSUB	spush
	STX	@sp
	JSUB	spush
	CLEAR	X
floop	+STCH	scr, X
	TIX	#scrlen
	JLT	floop
	JSUB	spop
	LDX	@sp
	JSUB	spop
	LDL	@sp
	RSUB

. paint x, y: address = screen_origin + y * cols + x

sinit   . initialize sp to the start of stack
        STA     stackA
        LDA     #stack
        STA     sp
        LDA     stackA
        RSUB
spush   . inc sp
        STA     stackA
        LDA     sp
        ADD     #3
        STA     sp
        LDA     stackA
        RSUB
spop    . dec sp
        STA     stackA
        LDA     sp
        SUB     #3
        STA     sp
        LDA     stackA
        RSUB

stack   RESW    1000
sp      WORD    0
stackA  WORD    0

scrrows	EQU	80
scrcols	EQU	25
scrlen	EQU	scrrows * scrcols

	ORG	0xb800
scr	BYTE	32
	RESB	1999
	END	first