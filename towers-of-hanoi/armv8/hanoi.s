.text
mov X0, 0x1000 // Stack Pointer
lsl X0, X0, 16

mov X1, 0x0 // Going up (folding) flag: uflag
mov X2, 0x20 // N

stur W1, [X0, 0x4]
stur W2, [X0, 0x8]
add X0, X0, 0x8

add X5, X0, 0x0 // Base Pointer

mov X6, 0x0 // tmp1
mov X7, 0x0 // tmp2
mov X8, 0x0 // tmp3

HANOI:

    ldur W3, [X0, 0x0]  // n
    sub X7, X3, 0x1 // n == 1

    // Base Case
    cmp X5, X0 
    bne N1  // len(stack) != 2
        cbnz X1, T // uflag == 1
        cbnz X7, N1 // n != 1
        
        T:        
            b DONE

    N1:
        cbnz X1, TN1 // uflag == 1
        cbnz X7, REC // n != 1

        TN1:
            sub X0, X0, 0x4

            add X3, X3, X3
            add X3, X3, 0x1
            stur X3, [X0, 0x0]
            mov X1, 0x1
            b HANOI

    REC:
        add X0, X0, 0x4
        sub X3, X3, 0x1
        stur X3, [X0, 0x0]
        b HANOI

DONE: 
    ldur X10, [X0, 0x0] // result
    HLT 0
