print	START	0
first	CLEAR	X
loop	LDCH	text, X
	WD	out
	TIX	#len
	JLT	loop
halt	J	halt

.data
out	BYTE	0xAB
text	BYTE 	C'SIC/XE'
	BYTE	10
end	EQU     *
len	EQU     end - text
	END	first