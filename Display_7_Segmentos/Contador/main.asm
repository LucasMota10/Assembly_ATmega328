.nolist
.include "m328Pdef.inc"
.list

.equ LED_PIN0 = PD0 
.equ LED_PIN1 = PD1 
.equ LED_PIN2 = PD2 
.equ LED_PIN3 = PD3 
.equ LED_PIN4 = PD4
.equ LED_PIN5 = PD5 
.equ LED_PIN6 = PD6

.def REG = r21
.def aux = r16

.org 0x0000
	rjmp main

main:
	sbi DDRD, LED_PIN0
	sbi DDRD, LED_PIN1
	sbi DDRD, LED_PIN2
	sbi DDRD, LED_PIN3
	sbi DDRD, LED_PIN4
	sbi DDRD, LED_PIN5
	sbi DDRD, LED_PIN6
	
	ldi REG, 0x00
	
loop:

	cpi REG, 10
	BRSH default
	cpi REG, 0
	BREQ zero
	cpi REG, 1
	BREQ um
	cpi REG, 2
	BREQ dois
	cpi REG, 3
	BREQ tres
	cpi REG, 4
	BREQ quatro
	cpi REG, 5
	BREQ cinco
	cpi REG, 6
	BREQ seis
	cpi REG, 7
	BREQ sete
	cpi REG,8
	BREQ oito
	cpi REG, 9
	BREQ nove
	

default:
	ldi REG, 0x00
	rjmp loop
zero:
	
	ldi aux, 0b00111111
	out PORTD, aux
	inc REG
	rcall delay_500ms
	rjmp loop 
um:
	ldi aux, 0b00000110
	out PORTD, aux
	inc REG
	rcall delay_500ms
	rjmp loop
dois:
	ldi aux, 0b01011011
	out PORTD, aux
	inc REG
	rcall delay_500ms
	rjmp loop
tres:
	ldi aux, 0b01001111
	out PORTD, aux
	inc REG
	rcall delay_500ms
	rjmp loop
quatro:
	ldi aux, 0b01100110
	out PORTD, aux
	inc REG
	rcall delay_500ms
	rjmp loop
cinco:
	ldi aux, 0b01101101
	out PORTD, aux
	inc REG
	rcall delay_500ms
	rjmp loop
seis:
	ldi aux, 0b01111101
	out PORTD, aux
	inc REG
	rcall delay_500ms
	rjmp loop
sete:
	ldi aux, 0b00000111
	out PORTD, aux
	inc REG
	rcall delay_500ms
	rjmp loop 
oito:
	ldi aux, 0b01111111
	out PORTD, aux
	inc REG
	rcall delay_500ms
	rjmp loop 
nove:
	ldi aux, 0b01101111
	out PORTD, aux
	inc REG
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

	
