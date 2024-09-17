.intel_syntax noprefix

.global _start

_start:
	xor rax, rax
	mov rdi, 0xFFFFFFFF
	mov rcx, 0x0000000FFFFFFFFF

_start.loop:
	cmp rax, rcx
	je  exit

	push rdi
	xor  rdi, rdi
	pop  rdi

	inc rax
	jmp _start.loop

exit:
	mov rax, 60
	xor rdi, rdi
	syscall
