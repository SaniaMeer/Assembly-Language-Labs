
INCLUDE c:\Users\pc\.vscode\extensions\istareatscreens.masm-runner-0.9.1\native\irvine\Irvine32.inc

.data
    arr dd 5 dup(?)
    i dd ?
    j dd ?
    temp dd ?
    str1 byte "Enter 5 numbers: ", 0
    str2 byte "Sorted numbers: ", 0

.code
main PROC

    mov edx, offset str1
    call WriteString

    mov i, 0

L1:
    call ReadInt
    mov ebx, i
    mov arr[ebx*4], eax     ; Store input in the array
    inc i
    cmp i, 5
    jl L1                   ; Input all 5 numbers

    mov i, 0

L2:
    mov j, 0                ; Reset inner loop for each pass

L3:
    mov ebx, j
    mov eax, arr[ebx*4]     ; Get current element
    mov edx, arr[ebx*4+4]   ; Get next element

    cmp eax, edx
    jle L4                  ; Skip swap if already in order

    mov temp, eax           ; Save first number temporarily
    mov eax, edx
    mov arr[ebx*4], eax     ; Put smaller number first
    mov eax, temp
    mov arr[ebx*4+4], eax   ; Put larger number second

L4:
    inc j
    mov eax, 4
    sub eax, i              ; Comparisons decrease after each pass
    cmp j, eax
    jl L3                   ; Compare the next adjacent pair

    inc i
    cmp i, 4
    jl L2                   ; Repeat sorting passes

    call Crlf
    mov edx, offset str2
    call WriteString

    mov i, 0

L5:
    mov ebx, i
    mov eax, arr[ebx*4]
    call WriteInt           ; Display current sorted element
    call Crlf

    inc i
    cmp i, 5
    jl L5                   ; Display all 5 elements

    exit
main ENDP
END main
