.nolist
.include "m328Pdef.inc"
.list

.equ LED_PIN0 = PB0
.equ LED_PIN1 = PB1
.equ LED_PIN2 = PB2
.equ LED_PIN3 = PB3
.def REG = r21


.org 0x0000
	rjmp main

main:
	sbi DDRB, LED_PIN0
	sbi DDRB, LED_PIN1
	sbi DDRB, LED_PIN2
	sbi DDRB, LED_PIN3
	
	ldi REG, 0x00
	
loop:
	inc REG
	out PORTB, REG
	rcall delay_500ms
	
	rjmp loop
	
delay_500ms:
	ldi r20,132 
delay2:
	ldi r19,164
delay1:
	ldi r18,128
delay0:	
	dec r18
	brne delay0
	dec r19
	brne delay1
	dec r20
	brne delay2
	ret

	
