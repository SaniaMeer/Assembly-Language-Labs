INCLUDE Irvine32.inc

.data
    num dd ?
    a dd ?
    str1    byte "Enter number: ", 0

.code
    main PROC

        ;get number
        mov  edx,offset str1
        call WriteString
        call ReadInt
        mov  num,eax

        ;logic
        cmp  eax,0
        jg   positive
        jl   negative 

positive:
        mov  ecx,num
        mov  edi,1
        mov  esi,eax
L1:
        mov  a,ECX
        mov  ecx,edi

L2:
        mov  eax,esi
        call WriteDec
        loop L2
        inc  edi
        call Crlf
        mov  ecx,a
        loop L1
        jmp  next

negative:
        mov  ebx,num
        neg  ebx

        mov  ecx,ebx

        mov  esi,num
        mov  edi,1
L3:
        mov  a,ECX
        mov  ecx,edi

L4:
        mov  eax,esi
        call WriteInt

        loop L4
        inc  edi
        call Crlf
        mov  ecx,a
        loop L3

next:


exit
    main ENDP
    END main