/*

	Para verificar se um vetor está em ordem decrescente basta verificar
	se A[n] > A[n+1]

*/

;R15 = endereço do vetor
;R14 = tamanho do vetor
;R13 = contador i


Decrescente:		tst.w 	R14
					jz 	end_dec
					clr		R13				;i = 0
					push.w	R6				;Habilita R6, registrador auxiliar
					add		R14, R14		;R14 = 2*R14, pois o contador andará de 2 em 2
					MOV.w	R15, R6			;R6 = &V, R6 guarda o endereço do vetor
loop_dec:			incd.w	R13
					MOV.w	R13(R15), R12	;R12 = R15[i+1]
					decd.w	R13
					MOV.w	R13(R15), R15	;R15 = R15[i]
loc1_dec:			cmp 	R15, R12		;R15 - R12, R15 > R12?
					jl		contagem		;pula se R15 > R12
					pop.w	R6				;caso R15 <= R12, então retornamos 0 pelo R15
end_dec:			clr.w	R15
					ret
contagem:			incd.w	R13				;i = i + 2, pois deve seguir o endereçamento dos inteiros de 2 bytes
					MOV.w	R6, R15
					cmp 	R14, R13		;R12 - R13
					jnz		loop_dec		;caso o programa passe para a contagem
					pop.w	R6				;entao a ordem está decrescente até o momento;
					mov.w	#1, R15			;e se o tamanho do vetor for percorrido por completo
					ret 					;entao o vetor é decrescente