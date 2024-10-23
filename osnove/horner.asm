.x⁴+2x³+3x²+4x+5 
.((((x + 2)x + 3)x + 4)x + 5
prog    START   0
horner  LDA     x
        ADD     #2
        MUL     x
        ADD     #3
        MUL     x
        ADD     #4
        MUL     x
        ADD     #5
        STA     result
halt    J       halt
x       WORD    2
result  RESW    0
        END horner
