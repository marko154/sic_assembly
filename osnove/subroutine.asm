h_func	START   0
first	CLEAR	X
loop	LDA     in, X
	JSUB    poly
	STA     in, X
	TIX     #len
	TIX     #len
	TIX     #len
	JLT	loop
halt	J       halt

poly	STB     polyB
	RMO	A, B
	ADD     #2
	MULR    B, A
	ADD     #3
	MULR    B, A
	ADD     #4
	MULR    B, A
	ADD     #5
	LDB	polyB
	RSUB

.data
in	WORD    0
	WORD    5
	WORD    42
lastin	EQU     *
len	EQU     lastin - in
polyB	WORD    0
	END     h_func