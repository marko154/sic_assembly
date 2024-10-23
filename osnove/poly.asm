poly    START   0
        LDA     x
        MUL     x
        MUL     x
        MUL     x
        STA     result
        LDA     x
        MUL     x
        MUL     x
        MUL     #2
        ADD     result
        STA     result
        LDA     x
        MUL     x
        MUL     #3
        ADD     result
        STA     result
        LDA     x
        MUL     #4
        ADD     result
        STA     result
        LDA     result
        ADD     #5
        STA     result
halt    J       halt

x       WORD    2
result  RESW    1
        END poly
