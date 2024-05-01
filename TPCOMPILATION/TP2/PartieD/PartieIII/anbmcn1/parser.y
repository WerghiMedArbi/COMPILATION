%{
	/* definition */
	/* build command: bison -d -t parser.y  */
	/* build exe command: gcc lex.yy.c parser.tab.c */
	#include<stdio.h>
	   #include<stdlib.h>
%}


%token A B C EOL

/* rules */
%%

stmt: S EOL  { printf("Accepter\n");
              exit(0); }
;
S: A S2 C
;
S2: A S2 C | S3
;
S3: B S3 | B
;

%%



int yyerror(char *msg)
 {
  printf("Rejeter\n");
  exit(0);
 }


int main()
 {
  printf("Saisir votre mot a verifier: \n");
  yyparse();
	return 1;
 }
