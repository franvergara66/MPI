

//Ejercicio para optimizar:
int foobar(int a, int b, int N){

int i, j, k, x, y;
x = 0;
y = 0;
k = 256;
for(i = 0; i <= N; i++) {
	for(j = i+1; j <= N; j++) {
	x = x + 4*(2*i+j)*(i+2*k);
	if(i>j)
	y = y + 8*(i-j);
	else
	y = y + 8*(j-i);
	}
}
return x;
}//end Foobar

int main(int argc, char** argv){

foobar (10,90,100000);
return 0; 
}

