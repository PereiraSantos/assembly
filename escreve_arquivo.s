section .data
filename db 'readme.txt', 0h
contents db 'Hello worls!', 0h

section .text
global _start

_start:
    mov eax, 8
    mov ebx, filename
    mov ecx, 0777o
    int 80h

    mov edx, 12
    mov ecx, contents
    mov ebx, eax
    mov eax, 4
    int 80h

    mov eax,1             
    int 0x80
