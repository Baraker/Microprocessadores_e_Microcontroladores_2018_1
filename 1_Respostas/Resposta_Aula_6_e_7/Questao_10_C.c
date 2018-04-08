#include <stdio.h>
#include <stdlib.h>

void Ler_Componentes(int* vetor, int n);
int Palindromo(int* vetor, int tamanho);

int main(void)
{
	int tamanho, i;					// tamanho do vetor, i = contador
	int* vetor;					// vetor
	scanf("%d", &tamanho);
	vetor = malloc (tamanho * 4);		//alocando memória para o vetor de inteiros = 4 bytes
	Ler_Componentes(vetor, tamanho);
	printf("%d\n", Palindromo(vetor, tamanho));
	return 0;
}

void Ler_Componentes(int* vetor, int n){
	int i;
	for(i = 0; i < n; i++){
		scanf("%d", &vetor[i]);
	}
}

int Palindromo(int* vetor, int tamanho){
	if (!tamanho%2)
	{
		for (int i = 0; i < tamanho/2; ++i)
		{
			if (vetor[i] != vetor[tamanho - 1 - i])		
				return 0;
		}
		return 1;
	}
	else
	{
		for (int i = 0; i < (tamanho-1)/2 + 1; ++i)
		{
			if (vetor[i] != vetor[tamanho - 1 - i])
				return 0;
		}
		return 1;
	}
}