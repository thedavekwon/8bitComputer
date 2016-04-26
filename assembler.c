#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <math.h>
#include <string.h>

char code_mach[];
char code_bin[2304];

void retrieve(){
	FILE *fp = fopen("code.c", "r");
	fread(code_mach, 1, sizeof(code_mach), fp);
	fclose(fp);
	return;
}

void save(){
	FILE *fp = fopen("binary.asm", "r");
	fwrite(code_bin, 1, sizeof(code_bin), fp);
	fclose(fp);
	return;
}

int main(){
	retrieve();

}