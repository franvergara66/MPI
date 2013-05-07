//Ejercicio optimizado por mi:
int foobar(int a, int b, int N){

int i=0, j=1,  x=0; 
int aux,aux2;

for(i; i <= N; i++) {
	aux=i+512; 
	aux2=aux*(8*i);
	for(j; j <= N; j++) {
		x = x + aux2+(4*j*aux);
	}
}
return x;
}

int main(int argc, char** argv){

foobar (10,90,100000);
return 0; 
}

