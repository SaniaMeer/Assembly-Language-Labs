INCLUDE Irvine32.inc

.data
    num dd ?
    i dd ?
    str1 byte "Enter a number: ", 0
    str2 byte " x ", 0
    str3 byte " = ", 0

.code
main PROC

    mov edx, offset str1
    call WriteString
    call ReadInt
    mov num, eax

    mov i, 1

L1:
    mov eax, num
    call WriteInt

    mov edx, offset str2
    call WriteString

    mov eax, i
    call WriteInt

    mov edx, offset str3
    call WriteString

    mov eax, num
    imul eax, i
    call WriteInt
    call Crlf

    inc i
    cmp i, 11
    jl L1

    exit
main ENDP
END main