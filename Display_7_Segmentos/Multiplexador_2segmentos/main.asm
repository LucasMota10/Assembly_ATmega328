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

	rcall show_dec
	rcall delay_multiplex
	rcall show_uni
	rcall delay_multiplex

	rcall delay_contagem
	inc REG
	rjmp loop

show_dec:
	
	cpi Decimal, 6
	BRSH default_decimal

	cpi Decimal, 0
	BREQ zero_decimal

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

	ret

default_decimal:
	
	ldi Decimal, 0x00

	ret

zero_decimal:

	cbi PORTB, Control_B1; B1 = 0
	sbi PORTB, Control_B2; B2 = 1
	ldi aux, 0b00111111
	out PORTD, aux

	ret
um_decimal:
	
	cbi PORTB, Control_B1; B1 = 0
	sbi PORTB, Control_B2; B2 = 1
	ldi aux, 0b00000110
	out PORTD, aux
	ret

dois_decimal:
	
	cbi PORTB, Control_B1; B1 = 0
	sbi PORTB, Control_B2; B2 = 1
	ldi aux, 0b01011011
	out PORTD, aux
	

	ret

tres_decimal:
	
	cbi PORTB, Control_B1; B1 = 0
	sbi PORTB, Control_B2; B2 = 1
	ldi aux, 0b01001111
	out PORTD, aux
	
	ret

quatro_decimal:

	cbi PORTB, Control_B1; B1 = 0
	sbi PORTB, Control_B2; B2 = 1
	ldi aux, 0b01100110
	out PORTD, aux
	
	ret

cinco_decimal:
	
	cbi PORTB, Control_B1; B1 = 0
	sbi PORTB, Control_B2; B2 = 1
	ldi aux, 0b01101101
	out PORTD, aux
	
	ret

show_uni:
	
	cpi REG, 10
	BRSH default_uni

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

	ret
default_uni:

	ldi REG, 0x00
	ret
zero:
	sbi PORTB, Control_B1; B1 = 1
	cbi PORTB, Control_B2; B2 = 0
	ldi aux, 0b00111111
	out PORTD, aux
	
	ret

um:

	sbi PORTB, Control_B1; B1 = 1
	cbi PORTB, Control_B2; B2 = 0
	ldi aux, 0b00000110
	out PORTD, aux
	
	ret

dois:

	sbi PORTB, Control_B1; B1 = 1
	cbi PORTB, Control_B2; B2 = 0
	ldi aux, 0b01011011
	out PORTD, aux
	
	ret
tres:
	
	sbi PORTB, Control_B1; B1 = 1
	cbi PORTB, Control_B2; B2 = 0
	ldi aux, 0b01001111
	out PORTD, aux
	
	ret
quatro:
	
	sbi PORTB, Control_B1; B1 = 1
	cbi PORTB, Control_B2; B2 = 0
	ldi aux, 0b01100110
	out PORTD, aux
	

	ret
cinco:

	sbi PORTB, Control_B1; B1 = 1
	cbi PORTB, Control_B2; B2 = 0
	ldi aux, 0b01101101
	out PORTD, aux
	

	ret

seis:
	
	sbi PORTB, Control_B1; B1 = 1
	cbi PORTB, Control_B2; B2 = 0
	ldi aux, 0b01111101
	out PORTD, aux

	ret
sete:
	
	sbi PORTB, Control_B1; B1 = 1
	cbi PORTB, Control_B2; B2 = 0
	ldi aux, 0b00000111
	out PORTD, aux
	
	
	ret
oito:
	
	sbi PORTB, Control_B1; B1 = 1
	cbi PORTB, Control_B2; B2 = 0
	ldi aux, 0b01111111
	out PORTD, aux
	
	ret
nove:
	
	sbi PORTB, Control_B1; B1 = 1
	cbi PORTB, Control_B2; B2 = 0
	ldi aux, 0b01101111
	out PORTD, aux
	inc Decimal
	ret


delay_multiplex:
	ldi r18, 2
dmp_outer:
	ldi r19, 100
dmp_inner:
	nop
	dec r19
	brne dmp_inner
	dec r18
	brne dmp_outer
	ret

delay_contagem:
	ldi r18, 255
dc_outer:
	ldi r19, 255
dc_inner:
	nop
	dec r19
	brne dc_inner
	dec r18
	brne dc_outer
	ret