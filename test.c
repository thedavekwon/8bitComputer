#include <stdio.h>
#include <stdlib.h> /* For exit() function*/

int main()
{
   char c[1000];
   FILE *fptr;
   if ((fptr=fopen("machine.asm","r"))==NULL){
       printf("Error! opening file");
       exit(1);         /* Program exits if file pointer returns NULL. */
   }
   fscanf(fptr,"%[^\n]",c);
   printf("Data from file:\n%s",c);
   fclose(fptr);
   return 0;
}