section .data
    msg db 'Digite algo: ', 0Ah
    lengthMsg equ $-msg

    msgWrite db 'Voce digitou: ', 0Ah
    lengthMsgWrite equ $-msgWrite

section .bss
    valor resb 5

section .text
global _start

_start:
    mov eax, 4               ;codigo output
    mov ebx, 1
    mov ecx, msg             ;messagem
    mov edx, lengthMsg       ;tamanho da msg
    int 80h                  ;chama kernel

    mov eax, 3               ;codigo write
    mov ebx, 1               ;File descriptor (stdout)
    mov ecx, valor           ;variavel
    mov edx, 5               ;tamanho permitido da variuvel
    int 80h

    mov eax, 4               ;codigo output
    mov ebx, 1
    mov ecx, msgWrite        ;messagem
    mov edx, lengthMsgWrite  ;tamanho da msg
    int 80h                  ;chama kernel

    mov eax, 4               ;codigo output
    mov ebx, 1
    mov ecx, valor           ;messagem
    mov edx, 5               ;tamanho da msg
    int 80h                  ;chama kernel

_exit:
    mov eax, 1               ;sair
    mov ebx, 0   
    int 80h
