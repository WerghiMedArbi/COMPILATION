%{
/* build command: bison -d -t parser.y  */
/* build exe command: gcc lex.yy.c parser.tab.c */
/* test command : somme 2,5. produit 3,6,2. soustraction 9,6,2. division 27,3,2. puissance 2,3. racine 25. $ */

#include <stdio.h>
#include <string.h>
#include<stdlib.h>
#include <math.h>

int yylex(void);
int yyerror(char *s);
int getInput();
/*liste des variable*/
char resultat[]= "Le resultat sera :\n";
char mystr[30];
%}

%union{
  int num;
	float flo;
  char sym;
}

%token<num> NB
%token FIN;
%token STOP;
%token SOM;
%token SUS;
%token PROD;
%token DIV;
%token PUI;
%token RAC;
%type<num> listesom listeprod listesus listepui
%type<flo> listediv listerac

%%

output:
STOP{exit(1);}|liste {printf("%s",resultat);} {getInput();}
;

liste:
SOM listesom'.' liste{strcat(resultat,"Somme =");sprintf(mystr, "%d\n", $2);strcat(resultat,mystr); }
|PROD listeprod'.' liste{strcat(resultat,"Produit =");sprintf(mystr, "%d \n", $2);strcat(resultat,mystr); }
|SUS listesus'.' liste{strcat(resultat,"Soustraction =");sprintf(mystr, "%d \n", $2);strcat(resultat,mystr); }
|DIV listediv'.' liste{strcat(resultat,"Division =");sprintf(mystr, "%g \n", $2);strcat(resultat,mystr); }
|PUI listepui'.' liste{strcat(resultat,"Puissance =");sprintf(mystr, "%d \n", $2);strcat(resultat,mystr); }
|RAC listerac'.' liste{strcat(resultat,"Racine Carre =");sprintf(mystr, "%g \n", $2);strcat(resultat,mystr); }
|FIN
;

listesom:
NB {  $$ = $1; }
|listesom ',' NB {  $$ = $1+$3;};

listeprod:
NB {  $$ = $1; }
|listeprod ',' NB { $$ = $1*$3;};

listesus:
NB {  $$ = $1; }
|listesus ',' NB { $$ = $1 - $3;};

listediv:
NB {  $$ = (float)$1; }
|listediv ',' NB { $$ = (float)$1 / (float)$3;};

listepui:
NB {  $$ = $1; }
|listepui ',' NB { $$ = pow($1,$3);};

listerac:
NB {  $$ = (float)sqrt($1); }
;

%%
#include "lex.yy.c"
int yyerror(char *s)
{
 printf ("%s", s);
 return (0);
}

int getInput(){
resultat[0] = '\0';
strcat(resultat,"Le resultat sera :\n");
printf("\nSaisir votre mot a verifier: \n");
yyparse();
printf("\n");
return 1;
}

int main()
{

getInput();

}
