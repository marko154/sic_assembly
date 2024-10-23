primer  START   0
first   LDA     x
        JSUB    poly
        STA     result
        J       halt
poly
        STB     polyB
        RMO     A, B
        MULR    A, B
        MUL     #3
        ADDR    B, A
        LDB     polyB
        RSUB

halt    J      halt
.data
x       WORD    2
polyB   WORD    0
result  WORD    0
        END    first
