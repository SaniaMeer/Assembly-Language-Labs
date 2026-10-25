INCLUDE c:\Users\pc\.vscode\extensions\istareatscreens.masm-runner-0.9.1\native\irvine\Irvine32.inc

.data
    arr dd 5 dup(?) ;array of 5 integers
    i dd ? ;counter variable
    maxNum dd ?
    str1 byte "Enter 5 numbers: ", 0
    str2 byte "Maximum number = ", 0

.code
main PROC

    mov edx, offset str1
    call WriteString

    mov i, 0 ;starts counter at 0

L1:
    call ReadInt
    mov ebx, i
    mov arr[ebx*4], eax ;Array indexes start at zero and each element occupies 4 bytes
    inc i
    cmp i, 5 ;Checks whether the counter has reached 5
    jl L1 ;Repeats while i is less than 5

    mov eax, arr[0]
    mov maxNum, eax
    mov i, 1

L2:
    mov ebx, i
    mov eax, arr[ebx*4]
    cmp eax, maxNum
    jle L3 ;jump if the current number is less than or equal to the maximum number
    mov maxNum, eax

L3:
    inc i
    cmp i, 5
    jl L2

;display the maximum number
    call Crlf
    mov edx, offset str2
    call WriteString
    mov eax, maxNum
    call WriteInt

    call Crlf
    exit
main ENDP
END main