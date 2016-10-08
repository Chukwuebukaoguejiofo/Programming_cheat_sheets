%define SYSCALL_WRITE 0x2000004
%define SYSCALL_EXIT  0x2000001



global start ; the main function name

start:
    ; write 'Brian Spinos'
    mov rax, SYSCALL_WRITE
    mov rsi, my_string
    mov rdx, my_string_length
    mov rdi, 1
    syscall ; call the kernel

    ; write 'foobar'
    mov rax, SYSCALL_WRITE
    mov rsi, my_constant
    mov rdx, my_constant_length
    mov rdi, 1
    syscall ; call the kernel

    ; exit my program
    mov rax, SYSCALL_EXIT
    mov rdi, 0
    syscall ; call the kernel

section .data

    ; to use escape sequences, use backticks
    my_string db `Brian Spinos\n`

    ; get the length of the string ; "$" means "here"
    my_string_length equ $ - my_string

    my_constant db `foobar\n`

    ; get the length of my_constant string ; "$" means "here"
    my_constant_length equ $ - my_constant


;
; # Generate object file from assembly:
; nasm -f macho64 -o hello_world.o hello_world.asm
;
; # Link object file:
; ld hello_world.o -o hello_world
;
; # Run executable:
; ./hello_world
;


; REGISTERS
; rsi: what to wite to output?
; rdx: length of output?
; rax: what to do (exit, read, write)
; rdi: status code?



; rax - temporary register; when we call a syscal, rax must contain syscall number ?
; rdi - used to pass 1st argument to functions ?
; rsi - pointer used to pass 2nd argument to functions ?
; rdx - used to pass 3rd argument to functions ?

