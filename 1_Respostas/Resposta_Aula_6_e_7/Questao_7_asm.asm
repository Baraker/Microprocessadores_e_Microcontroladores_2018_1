/*

	Considerando que a série de Taylor de e^x vale o somatório de n = 0 até o infinito
	de x elevado a n, dividido por n fatorial. Então, podemos unir os códigos de funções anteriores.

	Usarei as funções de potência, Fatorial e Divisão.

	entretanto a função não dará certo nos moldes do exercício por conta da limitação da quantidade de bits e por não condicionar casas decimais

*/


exp_taylor:			push.w 	R6			;habilitar registradores R6, R7 e R8
					push.w 	R7			;
					push.w 	R8			;
					clr.w	R6			;R6 = Sum
					clr.w	R8			;R8 = n, contador inicia em 0
					MOV.w	R15, R7		;R7 = x, R15 precisa carregar seu valor
loop_taylor:		MOV.w	R8, R14		;R14 = n, preparar para chamar a função Potencia
					MOV.w	R7, R15		;R15 = x
					call	#Potencia	;R15 = x, R14 = n
					MOV.w	R15, R13 	;R12 = x^n
					MOV.w	R8, R15		;R15 = n
					call	#Fatorial 	;R15 = n
					MOV.w	R15, R14	;R15 = n!, R14 = n!
					MOV.w	R13, R15	;R15 = x^n
					call	#div 		;R15 = x^n, R14 = n!
					add		R15, R6		;R15 = (x^n)/(n!)
					inc.w	R8
					MOV.w	#20, R15	;R15 = 20
					cmp.w	R15, R8
					jnz		loop_taylor
					MOV.w	R6, R15
					pop.w	R6
					pop.w	R7
					pop.w	R8
					ret	
;------------------------------------------
;Altera os Registradores: R13 e R12

Potencia:			PUSH.w 	R7
					MOV.w	R15, R13	;R13 = x
					MOV.w	R13, R12	;R12 = x
					MOV.w	R12, R7		;endereço 0(0) guarda x
					dec.w	R14			;R14 = n - 1
loc1_pot:			dec.w	R13			;R13 = x - 1
loop_mult:			add.w	R12, R15	;R15 = (x - R13)*x
					dec.w	R13			;
					cmp.w	#0, R13
					jnz		loop_mult
					dec.w	R14
					cmp.w	#0, R14
					jz 		end_mult
					MOV.w	R7, R13
					MOV.w	R15, R12
					jmp		loc1_pot
end_mult:			pop.w	R7
					ret
;------------------------------------------

;------------------------------------------
;Altera os Registradores: R13 e R12

div:        		MOV.w	#16,R12
            		clr.w	R13
loop_div:   		rla.w   R15
            		rlc.w   R13
            		bis.w   #1, R15
            		sub.w   R14,R13
            		jge     loc1_div
            		add.w   R14,R13
            		bic.w   #1, R15
loc1_div:       	dec.w   R12
            		cmp.w   #0,R12
            		jnz     loop_div
            		ret
;------------------------------------------

;------------------------------------------
MULT_unsigned:		tst.w R14 				;b==0 ?
					jnz MULT_unsigned_else	;Se b não é zero, vá para o else
					clr.w R15 				;return 0
					ret
MULT_unsigned_else:	push.w R15 				;Guarde a na pilha
					dec.w R14 				;b--
					call MULT_unsigned 		;Calcule a*(b-1)
					pop.w R14				;Recupere a na pilha
					add.w R14, R15			;return a + a*(b-1)
					ret
;------------------------------------------

;------------------------------------------
MULT_signed:		tst.w	R14
					jge		MULT_signed_else
					inv.w	R15
					inc.w	R15
					inv.w	R14
					inc.w	R14
MULT_signed_else:	call	#MULT_signed
					ret
;------------------------------------------

;------------------------------------------
Fatorial:			cmp		#2, R15
					jge		#L1
					MOV.w	#1, R15
					ret
L1:					push.w	R15
					dec.w	R15
					call	#Fatorial
					pop.w	R14
					call	#MULT_signed
					ret
;------------------------------------------