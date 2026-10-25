
INCLUDE Irvine32.inc

.data
    a dd ?
    b dd ?
    str1 byte "Enter first number: ", 0
    str2 byte "Enter second number: ", 0
    str3 byte "Greater number = ", 0

.code
main PROC

    mov edx, offset str1
    call WriteString
    call ReadInt
    mov a, eax              ; Store first number

    mov edx, offset str2
    call WriteString
    call ReadInt
    mov b, eax              ; Store second number

    mov eax, a
    cmp eax, b
    jg L1                   ; Keep a if it is greater
    mov eax, b              ; Otherwise, select b

L1:
    call Crlf
    mov edx, offset str3
    call WriteString
    call WriteInt           ; Display greater number in EAX

    call Crlf
    exit
main ENDP
END main
