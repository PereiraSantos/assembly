section .data
filename db 'readme.txt', 0h

section .bss
    fd_in  resb 1
    info resb  26

section .text
global _start

_start:
    ;abre arquivo
    mov eax, 5
    mov ebx, filename
    mov ecx, 0
    int 80h

    ;atribuir na variavel
    mov [fd_in], eax

    ;ler conteudo do aquivo
    mov eax, 3              
    mov ebx, [fd_in]
    mov ecx, info           
    mov edx, 26            
    int 80h

    ;fecha arquivo
    mov eax, 6
    mov ebx, [fd_in]
    int  0x80 

    ;printa o conteudo do arquivo
    mov eax, 4
    mov ebx, 1
    mov ecx, info
    mov edx, 26
    int 0x80

    mov eax,1             
    int 0x80 
