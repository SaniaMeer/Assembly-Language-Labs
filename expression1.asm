INCLUDE Irvine32.inc

.data
    a dd ?
    b dd ?
    c1 dd ?
    d dd ?
    y dd ?

    str1 byte "Enter a value for a, b, c1, d : ", 0
    str2 byte "Answer : ", 0

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

        call ReadInt
        mov  d,eax

        mov eax,a
        add eax,b
        add eax,c1
        mov esi,EAX

        mov eax,c1
        mul d
        add eax,a

        mov ebx,eax
        mov eax,esi
        mov edx,0
        div ebx
        
        mov  y, edx

        mov  edx, OFFSET str2
        call WriteString
        call Crlf

        mov  eax, y
        call WriteInt


exit
    main ENDP
    END main