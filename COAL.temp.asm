; MASM interface with code and output

INCLUDE c:\Users\pc\.vscode\extensions\istareatscreens.masm-runner-0.9.1\native\irvine\Irvine32.inc

.data
    message BYTE "MASM is working successfully!", 0

.code
main PROC

    mov edx, OFFSET message
    call WriteString
    call Crlf

    exit
main ENDP
END main