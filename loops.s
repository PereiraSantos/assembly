section	.bss
   num resb 1

section	.text
   global _start      

_start:	                
   mov ecx, 10
   mov eax, '1'
	
l1:
   mov [num], eax    ;adiciona no num o eax 1
   mov eax, 4        ;printa o primeiro valor do loop
   mov ebx, 1
   push ecx          ;adiciona na pilha 10
	
   mov ecx, num      ;adiciona 1 no ecx
   mov edx, 1        
   int 0x80          ;chama system call
	
   mov eax, [num]    ;adiciona 1 no eax
   sub eax, '0'      ;converte o caractere em AL no número de 0 a 9 "convert" character to number
   inc eax           ;incrementa 1 no eax
   add eax, '0'      ;converte o caractere em AL no número de 0 a 9 "convert" character to number
   pop ecx           ;pucha 10 da pilha
   loop l1           
	
   mov eax,1             
   int 0x80          ;chama system call     
