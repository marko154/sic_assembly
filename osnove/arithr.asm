primer  START   0
arithr  LDS     x
        LDT     y
        ADDR    S, T
        STS     sum
.diff
        SUBR    S, T
        SUBR    S, T
        STS     diff
.prod
        LDA     x
        MUL     y
        STA     prod
.quot
        LDA     x
        DIV     y
        STA     quot
.mod    
        LDA     quot
        MUL     y
        STA     mod
        LDA     x
        SUB     mod
        STA     mod
halt    J      halt
. podatki
x       WORD    9
y       WORD    2
sum     WORD    0
diff    WORD    0
prod    WORD    0
quot    WORD    0
mod     WORD    0
        END    arithr
