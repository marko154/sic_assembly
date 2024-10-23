primer  START   0
first   LDA     x
        JSUB    poly
        STA     result
        J       halt
poly
        STB     polyB
        ADD     #2
        MUL     x
        ADD     #3
        MUL     x
        ADD     #4
        MUL     x
        ADD     #5
        RSUB

halt    J      halt
.data
x       WORD    2
polyB   WORD    0
result  WORD    0
        END    first
