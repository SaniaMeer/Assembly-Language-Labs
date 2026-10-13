INCLUDE Irvine32.inc

.data
    a dd ?
    b dd ?
    c1 dd ?
    d dd ?
    e dd ?
    y dd ?

    str1 byte "Enter a value for a, b, c1, d, e: ", 0
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

        call ReadInt
        mov  e,eax

        mov eax,a
        add eax,b
        sub eax,d
        mov esi,EAX

        mov eax,c1
        mov ebx,d
        mov edx,0
        div ebx

        add edx,a
        mov eax,edx

        mul ESI
        mul e
        
        mov y,eax
        
        mov  edx, OFFSET str2
        call WriteString
        call Crlf

        mov  eax, y
        call WriteInt


exit
    main ENDP
    END main