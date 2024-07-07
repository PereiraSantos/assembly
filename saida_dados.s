section .data
    msg db 'Hola mundo', 0Ah

section .text
global _start

_start:
    mov eax, 4   ;codigo output
    mov ebx, 1
    mov ecx, msg ;messagem
    mov edx, 13  ;tamanho da msg
    int 80h      ;chama kernel

_exit:
    mov eax, 1   ;sair
    mov ebx, 0   
    int 80h
