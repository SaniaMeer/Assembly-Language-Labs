
INCLUDE Irvine32.inc

.data
    num dd ?
    i dd ?
    fact dd ?
    str1 byte "Enter a number: ", 0
    str2 byte "Factorial = ", 0

.code
main PROC

    mov edx, offset str1
    call WriteString
    call ReadInt
    mov num, eax            ; Store input number

    mov fact, 1             ; Start factorial from 1
    mov i, 1                 ; Start counter from 1

L1:
    mov eax, i
    cmp eax, num
    jg L2                   ; Exit when counter exceeds input

    mov eax, fact
    imul eax, i             ; Multiply factorial by current counter
    mov fact, eax            ; Save updated factorial

    inc i
    jmp L1                  ; Repeat multiplication

L2:
    call Crlf
    mov edx, offset str2
    call WriteString
    mov eax, fact
    call WriteInt           ; Display final factorial

    call Crlf
    exit
main ENDP
END main
