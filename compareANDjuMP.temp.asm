INCLUDE c:\Users\pc\.vscode\extensions\istareatscreens.masm-runner-0.9.1\native\irvine\Irvine32.inc

.data
    a dd ?
    b dd ?
    c1 dd ?

    str1    byte "Enter a value for a, b, c1: ", 0
    str2    byte "even: ", 0

.code
    main PROC

        mov  edx,offset str1
        call WriteString
        call ReadInt
        mov  a,eax

        call ReadInt
        mov  b,eax

        call ReadInt
        mov  c1,eax

        ;logic
        mov  eax,a
        mov  ebx,2
        mov  edx,0
        div  EBX

        cmp  edx,0
        jne  M1

        mov  edx, OFFSET str2
        call WriteString
        call Crlf
        mov  eax,a
        call WriteInt
        call crlf

M1:

        mov  eax,b
        mov  ebx,2
        mov  edx,0
        div  EBX

        cmp  edx,0
        jne  M2

        mov  edx, OFFSET str2
        call WriteString
        call Crlf
        mov  eax,b
        call WriteInt
        call crlf

M2:

        mov  eax,c1
        mov  ebx,2
        mov  edx,0
        div  ebx

        cmp  edx,0
        jne  L1

        mov  edx, OFFSET str2
        call WriteString
        call Crlf
        mov  eax,c1
        call WriteInt
        call crlf

L1:
exit
    main ENDP
    END main