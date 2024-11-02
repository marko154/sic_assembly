echo	START   0
first
	+LDA	#12345
	JSUB	num
	JSUB	nl
	+LDA	#txt
	JSUB	string
	JSUB	nl
halt	J       halt


.print char in register A
char	WD      #1
	RSUB

.print new line
nl	STA     nlA
	STL     nlL
	LDCH    #10
	JSUB    char
	LDA     nlA
	LDL	nlL
	RSUB

.print a string from memory address stored in register A
string	STL	stringL
	STA	stringA
	STA	sAddr
loop	CLEAR	A
	+LDCH    @sAddr
	COMP	#0
	JEQ	break
	JSUB    char
	LDA	sAddr
	ADD	#1
	STA	sAddr
	J     	loop
break	LDL	stringL
	LDA	stringA
	RSUB

. A -> A % 10 TODO: improve this
mod10 	STT	modT
	RMO	A, T
	DIV	#10
	MUL	#10
	SUBR	A, T
	RMO	T, A
	LDT	modT
	RSUB

.print number in register A
num	STL	numL
	CLEAR	B
	LDS	#10
loop1 	COMP	#0
	JEQ	end1
	RMO	A, T
	JSUB	mod10
	MULR	S, B
	ADDR	A, B
	RMO	T, A
	DIV	#10
	J	loop1
end1	RMO	B, A
	CLEAR	B
loop2 	COMP	#0
	JEQ	end2
	RMO	A, T
	JSUB	mod10
	ADD	#48
	JSUB	char
	MULR	S, B
	ADDR	A, B
	RMO	T, A
	DIV	#10
	J	loop2
end2	LDL	numL
	RSUB

txt	BYTE    C'hello world!'
	BYTE    0
nlA	RESW	1
nlL	RESW	1
sAddr	RESW	1
stringA	RESW	1
stringL	RESW	1
modB	RESW	1
modT	RESW	1
numL	RESW	1
stack	RESW	100
	END     first
