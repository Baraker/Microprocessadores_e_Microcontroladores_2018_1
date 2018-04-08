
/*

	Função para reconhecer primos: seja um número n, testar se o resto da divisão de 2 até (n-1) é != 0. O número será primo se todos forem diferentes 

*/


Primo:		cmp.w	#0, R15
			jz		end_primo_0
			cmp.w	#1, R15
			jz		end_primo_0
			cmp.w	#2, R15
			jz		end_primo_1
			mov.w #2, R13			;R13 = i
			mov.w R15, R12			;R12 guarda o valor de x
loop_primo:	mov.w R13, R14			;R14 = i
			mov.w R12, R15			;R15 = x, seu valor inicial
			call  resto
			tst   R15
			jz	  end_primo_0
			inc.w R13
			cmp   R12, R13
			jz    end_primo_1
			jmp   loop_primo
end_primo_0:clr.w R15
			ret
end_primo_1:mov.w #1, R15
			ret