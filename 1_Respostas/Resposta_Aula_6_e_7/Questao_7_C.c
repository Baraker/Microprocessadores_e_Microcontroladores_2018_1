#include <stdio.h>

/*

	Considerando que a série de Taylor de e^x vale o somatório de n = 0 até o infinito
	de x elevado a n, dividido por n fatorial. Então, podemos unir os códigos de funções anteriores.

*/

double ExpTaylor(double x);
double Fatorial(double x);
double Potencia(double x, double N);

int main(void)
{
	double x;
	scanf("%lf", &x);
	printf("%lf\n", ExpTaylor(x));
	return 0;
}

double ExpTaylor(double x){

    double Sum;
	for (double i = 0; i < 20; ++i)
	{
		Sum += Potencia(x, i)/Fatorial(i);
	}
	return Sum;
}

double Fatorial(double x){
	if (x == 0)
		return 1;
	else
		return x*Fatorial(x-1);
}

double Potencia(double x, double N){
	if (N == 0)
		return 1;
	else
		return x*Potencia(x, N-1);
}