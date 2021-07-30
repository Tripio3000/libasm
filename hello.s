	global	_start

	section .text

_start:
	mov	rax, 0x2000004
	mov	rdi, 1
	mov	rsi, str
	mov	rdx, str.len
	syscall

	mov	rax, 0x2000001
	xor	rdi, rdi
	syscall

	section .data
str:	db	"Hello world!"
.len:	equ	$ - str
