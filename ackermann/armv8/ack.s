.text
mov X0, 0x1000
lsl X0, X0, 16

mov X1, @M // M
mov X2, @N // N

mov X10, 0xabcd

stur W10, [X0, 0x0]

stur W1, [X0, 0x4]
stur X2, [X0, 0x8]
add X0, X0, 0x8

mov X3, 0x3 // Minimum length
mov X4, 0x3 // Current length

ACK:
    cmp X4, X3
    blt DONE

    sub X0, X0, 0x4
    ldur W1, [X0, 0x0]  
    ldur W2, [X0, 0x4]  
    add X0, X0, 0x4

    mov X5, 0x0
    
    M0:
        cbnz X1, N0
        add X15, X2, 0x1 // res = N+1

        WHILE:
            sub X4, X4, 0x1 // len--

            sub X0, X0, 0x4
            ldur W5, [X0, 0x0]

            cmp X5, X10
            bne WHILE

        stur X15, [X0, 0x0]

        b ACK

    N0:
        cbnz X2, REC

        sub X1, X1, 0x1 // M-1
        mov X2, 0x1
        
        stur X1, [X0, 0x4]
        stur X2, [X0, 0x8]

        add X0, X0, 0x8
        add X4, X4, 0x2

        b ACK

    REC: 
        sub X5, X1, 0x1 // M-1
        sub X2, X2, 0x1 // N-1

        stur X5, [X0, 0x4]
        stur X10, [X0, 0x8]
        stur X1, [X0, 0xc]
        stur X2, [X0, 0x10]

        add X4, X4, 0x4
        add X0, X0, 0x10

        b ACK

DONE: 
    ldur X7, [X0, 0x0]
    HLT 0
