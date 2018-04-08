#include <stdio.h>

unsigned int Raiz_Quadrada(unsigned int S){
    
    int count;
    unsigned int x;
    count = 1000;
  	x = 1;

	for (int i = 0; i < count; ++i)
	{
		x = x/2 + S/(x*2);
	}
	return x;
}

int main(void)
{
	unsigned int Raiz;
	scanf("%u", &Raiz);
	printf("%u\n", Raiz_Quadrada(Raiz));
	return 0;
}