
INCLUDE Irvine32.inc

.data
    a dd ?
    b dd ?
    c1 dd ?
    d dd ?
    ResultA dd ?
    ResultB dd ?
    ResultC dd ?

    str1 byte "Enter a value for a, b, c1, d : ", 0
    str2 byte "A = ", 0
    str3 byte "B = ", 0
    str4 byte "C = ", 0
    str5 byte "Positive results: ", 0
    str6 byte "Highest Value: ", 0
    str7 byte "Lowest Value = ", 0
    str8 byte "Average = ", 0

.code
    main PROC
        ;input from user
        mov  edx, offset str1
        call WriteString
        call ReadInt
        mov  a, eax

        call ReadInt
        mov  b, eax

        call ReadInt
        mov  c1, eax

        call ReadInt
        mov  d, eax

        ; A = (a + b + c1) % (a - d)
        mov  eax, a
        add  eax, b
        add  eax, c1
        mov  esi, eax

        mov  eax, a
        sub  eax, d
        mov  ebx, eax

        mov  eax, esi
        cdq
        idiv ebx

        mov  ResultA, edx

        ; B = (b + c1 / d) - (a + b)
        mov  eax, c1
        cdq
        mov  ebx, d
        idiv ebx
        add  eax, b

        mov  esi, eax

        mov  eax, a
        add  eax, b

        sub  esi, eax
        mov  ResultB, esi

        ; C = (a - b) + (c1 - d)

        mov  eax, a
        sub  eax, b
        mov  ebx, eax

        mov  eax, c1
        sub  eax, d
        add  eax, ebx

        mov  ResultC, eax

        ; output results
        ; positive results
        call Crlf
        mov  edx, offset str5
        call WriteString

        mov  eax, ResultA
        cmp  eax, 0
        jle  M1
        call Crlf
        mov  edx, offset str2
        call WriteString
        mov  eax, ResultA
        call WriteInt

M1:
        mov  eax, ResultB
        cmp  eax, 0
        jle  M2
        call Crlf
        mov  edx, offset str3
        call WriteString
        mov  eax, ResultB
        call WriteInt

M2:
        mov  eax, ResultC
        cmp  eax, 0
        jle  M3
        call Crlf
        mov  edx, offset str4
        call WriteString
        mov  eax, ResultC
        call WriteInt

M3:
        ; Highest
        mov  eax, ResultA
        cmp  eax, ResultB
        jg   M4
        mov  eax, ResultB

M4:
        cmp  eax, ResultC
        jg   M6
        mov  eax, ResultC

M6:
        call Crlf
        mov  edx, offset str6
        call WriteString
        call WriteInt

        ; Lowest
        mov  eax, ResultA
        cmp  eax, ResultB
        jl   M5
        mov  eax, ResultB

M5:
        cmp  eax, ResultC
        jl   M7
        mov  eax, ResultC

M7:
        call Crlf
        mov  edx, offset str7
        call WriteString
        call WriteInt

        ; Average
        mov  eax, ResultA
        add  eax, ResultB
        add  eax, ResultC
        cdq
        mov  ebx, 3
        idiv ebx

        call Crlf
        mov  edx, offset str8
        call WriteString
        call WriteInt

        call Crlf
        exit
    main endp
    end main
