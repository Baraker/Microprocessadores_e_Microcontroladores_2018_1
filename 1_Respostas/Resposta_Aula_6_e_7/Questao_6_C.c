#include <stdio.h>

unsigned long long DuploFatorial(unsigned long long n);

int main(void){
	unsigned long long n;
	scanf("%llu", &n);
	printf("%llu\n", DuploFatorial(n));
	return 0;
}

unsigned long long DuploFatorial(unsigned long long n){
	if (!(n%2))
	{
		if (!n)
			return 1;
		else
			return n*DuploFatorial(n-2);
	}
	else
	{
		if (n == 1)
			return 1;
		else
			return n*DuploFatorial(n-2)
	}
}
