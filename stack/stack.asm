prog    START   0
        LDA     #1
        LDB     #2

        STA     @sp
        JSUB    spush
        STB     @sp
        JSUB    spush

        JSUB    spop
        LDA     @sp
        JSUB    spop
        LDB     @sp
halt    J       halt

sinit   . initialize sp to the start of stack
        STA     stackA
        LDA     #stack
        STA     sp
        LDA     stackA
        RSUB
spush   . inc sp
        STA     stackA
        LDA     sp
        ADD     #3
        STA     sp
        LDA     stackA
        RSUB
spop    . dec sp
        STA     stackA
        LDA     sp
        SUB     #3
        STA     sp
        LDA     stackA
        RSUB

stack   RESW    1000
sp      WORD    0
stackA  WORD    0
        END     prog
