;R15 - x
;R14 - N
;R13 - contador

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