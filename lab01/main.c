#include<stdio.h>
#include<stdlib.h>
int globalCount = 0;
int gcd(int a, int b) {
	globalCount++;
	if(a>0 && b>0) {
		if(a>b) return gcd(b,a-b);
		else if(b>a) return gcd(a,b-a);
		else return a;
	}
	else return a;
}
int main(int argc, char *argv[]) {
	int a = 10, b = 15;
	if(argc>1) {
		a = atoi(argv[1]);
	  if(argc>2) b = atoi(argv[2]);
	}
	printf("gcd(a = %d, b = %d) = %d; ",a,b,gcd(a,b));
	printf("obtained in %d iterations.\n",globalCount);

	return 0;
// identifiers : user defined names like variables, that are not keywords(cant use words like "int" as indentifiers).
	// Can only bgin with letters or undescores. function names are also identfiers, including "main" even though it is a keyword. "Main" is at once a keyword and a function
	// number of identifiers in this code : 11 identifiers; 2 functions names and 9 variables ("argc" and "argv[]" are also identifiers), "atoi", "printf" are also identifers as they are function names. "if" and "else" are keywords, "return is a keyword" all control constructs are keywords.
	// Prototypes in the header files are not identifiers until we call them in the code file.
	// Stages of compilation : preprocessing -> c to assembly -> assembly to object code using assembler -> linker and loader to get the final target machine code
	// WHAT HAPPENS TO IDENTIFIERS IN STAGES OF COMPILATION?
	// gcc -c program-name.c
	// hexdump -C progrm-name.o, to examine the object file
	// ELF occurs at the beggining of the hexdump
	// "grep -c gcd program-name.s" gives the number of lines in which the word gcd appears
	// "grep gcd program-name.s" gives the 
}
