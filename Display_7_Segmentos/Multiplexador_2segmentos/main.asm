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
.equ Control_B1 = PB1; Display 1
.equ Control_B2 = PB2; Display 2

.def REG = r21
.def aux = r16
.def Decimal = r17

.org 0x0000
	rjmp main

zero_decimal:
	cbi PORTB, Control_B1; B1 = 0
	sbi PORTB, Control_B2; B2 = 1
	ldi aux, 0b00111111
	out PORTD, aux
	inc Decimal
	rcall delay_500ms
	rjmp loop

default:
	ldi REG, 0x00
	rjmp loop

zero:
	cbi PORTB, Control_B1; B1 = 1
	sbi PORTB, Control_B2; B2 = 0
	ldi aux, 0b00111111
	out PORTD, aux
	inc REG
	rcall delay_500ms
	rjmp loop 
um:
	cbi PORTB, Control_B1; B1 = 1
	sbi PORTB, Control_B2; B2 = 0
	ldi aux, 0b00000110
	out PORTD, aux
	inc REG
	rcall delay_500ms
	rjmp loop
	
main:
	sbi DDRD, LED_PIN0
	sbi DDRD, LED_PIN1
	sbi DDRD, LED_PIN2
	sbi DDRD, LED_PIN3
	sbi DDRD, LED_PIN4
	sbi DDRD, LED_PIN5
	sbi DDRD, LED_PIN6
	
	sbi DDRB, Control_B1
	sbi DDRB, Control_B2
	
	ldi REG, 0x00
	ldi Decimal, 0x00
	
	cbi PORTB, Control_B1; Bit 0 em B1
	cbi PORTB, Control_B2; Bit 0 em B2
loop:
	cpi Decimal, 0
	BREQ zero_decimal
	
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


dois:
	cbi PORTB, Control_B1; B1 = 1
	sbi PORTB, Control_B2; B2 = 0
	ldi aux, 0b01011011
	out PORTD, aux
	inc REG
	rcall delay_500ms
	rjmp loop
tres:
	cbi PORTB, Control_B1; B1 = 1
	sbi PORTB, Control_B2; B2 = 0
	ldi aux, 0b01001111
	out PORTD, aux
	inc REG
	rcall delay_500ms
	rjmp loop
quatro:
	cbi PORTB, Control_B1; B1 = 1
	sbi PORTB, Control_B2; B2 = 0
	ldi aux, 0b01100110
	out PORTD, aux
	inc REG
	rcall delay_500ms
	rjmp loop
cinco:
	cbi PORTB, Control_B1; B1 = 1
	sbi PORTB, Control_B2; B2 = 0
	ldi aux, 0b01101101
	out PORTD, aux
	inc REG
	rcall delay_500ms
	rjmp loop
seis:
	cbi PORTB, Control_B1; B1 = 1
	sbi PORTB, Control_B2; B2 = 0
	ldi aux, 0b01111101
	out PORTD, aux
	inc REG
	rcall delay_500ms
	rjmp loop
sete:
	cbi PORTB, Control_B1; B1 = 1
	sbi PORTB, Control_B2; B2 = 0
	ldi aux, 0b00000111
	out PORTD, aux
	inc REG
	rcall delay_500ms
	rjmp loop 
oito:
	cbi PORTB, Control_B1; B1 = 1
	sbi PORTB, Control_B2; B2 = 0
	ldi aux, 0b01111111
	out PORTD, aux
	inc REG
	rcall delay_500ms
	rjmp loop 
nove:
	cbi PORTB, Control_B1; B1 = 1
	sbi PORTB, Control_B2; B2 = 0
	ldi aux, 0b01101111
	out PORTD, aux
	inc REG
	
	cpi Decimal, 1
	BREQ um_decimal
	
	cpi Decimal, 2
	BREQ dois_decimal
	
	cpi Decimal, 3
	BREQ tres_decimal
	
	cpi Decimal, 4
	BREQ quatro_decimal
	
	cpi Decimal, 5
	BREQ cinco_decimal
	
	cpi Decimal, 6
	BRSH default_decimal
	
	
	rcall delay_500ms
	rjmp loop 
	
um_decimal:
	cbi PORTB, Control_B1; B1 = 0
	sbi PORTB, Control_B2; B2 = 1
	ldi aux, 0b00000110
	out PORTD, aux
	inc Decimal
	rcall delay_500ms
	rjmp loop
dois_decimal:
	cbi PORTB, Control_B1; B1 = 0
	sbi PORTB, Control_B2; B2 = 1
	ldi aux, 0b01011011
	out PORTD, aux
	inc Decimal
	rcall delay_500ms
	rjmp loop
tres_decimal:
	cbi PORTB, Control_B1; B1 = 0
	sbi PORTB, Control_B2; B2 = 1
	ldi aux, 0b01001111
	out PORTD, aux
	inc Decimal
	rcall delay_500ms
	rjmp loop
quatro_decimal:
	cbi PORTB, Control_B1; B1 = 0
	sbi PORTB, Control_B2; B2 = 1
	ldi aux, 0b01100110
	out PORTD, aux
	inc Decimal
	rcall delay_500ms
	rjmp loop
cinco_decimal:
	cbi PORTB, Control_B1; B1 = 0
	sbi PORTB, Control_B2; B2 = 1
	ldi aux, 0b01101101
	out PORTD, aux
	inc Decimal
	rcall delay_500ms
	rjmp loop	

default_decimal:
	ldi Decimal, 0x00
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

	
