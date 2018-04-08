int Potencia(int x, int N){
	if (N == 0)
		return 1;
	else
		return x*Potencia(x, N-1);
}