prog	START   0
mloop	JSUB	readln
	COMP	#2 . if line == "\r\n" break
	JGT	mloop
	. TODO: print response to stdout
	LDA	#stline
	JSUB	println
	JSUB	nl
	LDA	#ctype
	JSUB	println
	JSUB	nl
	LDA	#clen
	JSUB	println
	JSUB	nl
	JSUB	cret
	LDA	#body
	JSUB	println
halt	J       halt

.print a line ending with \n from memory address stored in register A
println	STA	sAddr
loop	CLEAR	A
	+LDCH    @sAddr
	COMP	#10
	JEQ	break
	WD	#1
	LDA	sAddr
	ADD	#1
	STA	sAddr
	J     	loop
break	RSUB

nl	LDCH	#10
	WD	#1
	RSUB

cret	LDCH	#13
	WD	#1
	LDCH	#10
	WD	#1
	RSUB

. reads a line that ends with \r\n and returns its length in register A
readln	LDT	#13
	LDS	#0
	LDB	#0
rloop	LDA	#0
	RD	#0
	. WD	#1 . TODO remove me
	COMP	#10
	JEQ	rnl
	J	cont
rnl	COMPR	S, T
	JEQ	rret
cont	RMO	A, S
	RMO	B, A
	ADD	#1
	RMO	A, B
	J	rloop
rret	RMO	B, A
	ADD	#1
	RSUB


. initialize sp to the start of stack
sinit	STA     stackA
	LDA     #stack
	STA     sp
	LDA     stackA
	RSUB
. inc sp
spush	STA     stackA
	LDA     sp
	ADD     #3
	STA     sp
	LDA     stackA
	RSUB
. dec sp
spop	STA     stackA
	LDA     sp
	SUB     #3
	STA     sp
	LDA     stackA
	RSUB


sAddr	RESW	1
stline	BYTE	C'HTTP/1.1 200 OK' . status line
	BYTE	X'0D0A' . \r\n
ctype	BYTE	C'Content-Type: text/html'
	BYTE	X'0D0A' . \r\n
clen	BYTE	C'Content-Length: 21'
	BYTE	X'0D0A' . \r\n
body	BYTE	C'<h1>Hello world!</h1>'
	BYTE	X'0D0A' . \r\n
stack	RESW    1000
sp	WORD    0
stackA	WORD    0
	END     prog
