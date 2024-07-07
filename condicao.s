section .data
   msg db 'Digite um numero de 0 a 10: ', 0Ah
   lengthMsg equ $-msg

   msgWrite db 'Voce acertou: ', 0Ah
   lengthMsgWrite equ $-msgWrite

   msgWriteE db 'Voce errou ', 0Ah
   lengthMsgWriteE equ $-msgWriteE

section .bss
   valor resb 2


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

   cmp byte [ecx], "2"
   jne _errou

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
   jmp _exit

_errou:
   mov eax, 4               ;codigo output
   mov ebx, 1
   mov ecx, msgWriteE        ;messagem
   mov edx, lengthMsgWriteE  ;tamanho da msg
   int 80h                  ;chama kernel

_exit:
   mov eax, 1               ;sair
   mov ebx, 0   
   int 80h
