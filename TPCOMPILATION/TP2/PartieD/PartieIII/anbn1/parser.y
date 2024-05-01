%{
	/* definition */
	/* build command: bison -d -t parser.y  */
	/* build exe command: gcc lex.yy.c parser.tab.c */
	#include<stdio.h>
	   #include<stdlib.h>
%}


%token A B EOL

/* rules */
%%

stmt: S EOL  { printf("Accepter\n");
              exit(0); }
;
S: A S B |
;

%%



int yyerror(char *msg)
 {
  printf("Rejeter\n");
  exit(0);
 }

//driver code
int main()
 {
  printf("Saisir votre mot a verifier: \n");
  yyparse();
	return 1;
 }
