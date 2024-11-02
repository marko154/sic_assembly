sumN    START   0
        LDA     #4
        JSUB    subN
halt    J       halt

. TODO finish
.sum 1, ... , n
sumN    CMP     #0
        PUSH    L
        JEQ     sumOut
        RMO     A, B
        SUB     #1
        JSUB    sumN
        POP     L
        ADDR    B, A

sumOut  RSUB

nlA     WORD
        END     sumN
