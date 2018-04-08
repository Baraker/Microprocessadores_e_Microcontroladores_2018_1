;	R15 	- entrada S e saída raiz(S)
;	R14 	- Variável x
;	R13 	- Contador i
;	R12		- Variável auxiliar
;	R11		- Variável auxiliar


Raiz:			cmp.w	#0, R15
				jz		end_loop_Raiz
				cmp.w	#1, R15
				jz		end_loop_Raiz
				PUSH.w	R11					;guarde R11 na pilha
				MOV.w	R15, R11			;guarde o valor de R15 em R11
				MOV.w	#100, R13			;inicie o contador i em 100
				MOV.w	#1, R14				;inicie a variável x em 1
				MOV.w	R14, R12			;R12 = x
loop_raiz:		rla.w	R12					;R12 = x/2
				rra.w	R14					;R14 = x*2
				MOV.w	R11, R15			;R15 = S
				call	#div				;R15 = S/(x*2)
				add.w	R15, R12			;R12 = x/2 + S/(x*2)	
				MOV.w	R12, R14			;R14 = x/2 + S/(x*2)
				dec.w	R13					;R13 --
				cmp.w	#0, R13				;R13 = 0 ?
				jnz		loop_raiz 			;se R13 != 0, pule para label a loop_raiz
				MOV.w	R14, R15			;MOVa raiz(S) para R15
				POP.w	R11					;recupere o valor de R11 da pilha
end_loop_Raiz:	ret