/*

	Oproduto escalar de dois vetores a e b representa a soma do produtos das suas componentes
	de mesma ordem.

	Usarei as funções de multiplicação.

	entretanto a função não dará certo nos moldes do exercício por conta da limitação da quantidade de bits e por não condicionar casas decimais

*/

;R15 = endereço do vetor A
;R14 = endereço do vetor B
;R13 = tamanho do vetor
;R12 = contador i

prod_escalar:		clr		R12				;i = 0
					push.w	R6				;Habilita R6
					push.w	R7				;Habilita R7
					push.w	R8				;Habilita R8
					clr		R6				;R6 = 0, R6 = Soma
					add		R13, R13		;R13 = 2*R13, pois o contador andará de 2 em 2
					MOV.w	R15, R7			;R7 = &A
					MOV.w	R14, R8			;R8 = &B
loop_escalar:		MOV.w	R12(R15), R15	;R15 = R15[i]
					MOV.w	R12(R14), R14	;R14 = R14[i]
					call 	MULT_signed
					add.w	R15, R6			;R15 = A[i]*B[i], R6 recebe a soma
					incd.w	R12				;i = i + 2, pois deve seguir o endereçamento dos inteiros de 2 bytes
					cmp 	R13, R12		;R12 - R13
					jnz		loop_escalar	;pula se a flag Z estiver resetada
					MOV.w	R6, R15
					pop.w	R6
					pop.w	R7
					pop.w	R8
					ret





;------------------------------------------
MULT_unsigned:		tst.w 	R14 				;b==0 ?
					jnz 	MULT_unsigned_else	;Se b não é zero, vá para o else
					clr.w 	R15 				;return 0
					ret
MULT_unsigned_else:	push.w 	R15 				;Guarde a na pilha
					dec.w 	R14 				;b--
					call 	MULT_unsigned 		;Calcule a*(b-1)
					pop.w 	R14				;Recupere a na pilha
					add.w 	R14, R15			;return a + a*(b-1)
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