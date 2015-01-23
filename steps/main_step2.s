.section .init
.globl _start
_start:

// Load the GPIO address into r0.
ldr r0,=0x20200000

// Enable output on the GPIO 47 (OK led).
mov r1,#1
lsl r1,#21
str r1,[r0,#16]

// Set the value of register one.
mov r1,#1
lsl r1,#15

loop$:

// Set the GPIO 47 pin on.
str r1,[r0,#32]

// Wait to flash so humans can see it
mov r2,#0x3F0000
wait1$:
sub r2,#1
cmp r2,#0
bne wait1$

// Set the GPIO 47 pin off.
str r1,[r0,#44]

// Wait to flash so humans can see it
mov r2,#0x3F0000
wait2$:
sub r2,#1
cmp r2,#0
bne wait2$

b loop$
