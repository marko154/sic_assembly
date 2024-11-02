echo	START   0
first	+LDA	#txt
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
	J     loop
break	LDL	stringL
	LDA	stringA
	RSUB

txt	BYTE    C'hello world!'
	BYTE    0
nlA	RESW	1
nlL	RESW	1
sAddr	RESW	1
stringA	RESW	1
stringL	RESW	1
	END     first
