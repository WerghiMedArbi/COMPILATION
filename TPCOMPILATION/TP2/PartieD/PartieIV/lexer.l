%{
	/* definition */

	/* build command: flex lexer.l */
	#include<stdio.h>
	#include<math.h>
	#include "parser.tab.h"
%}

%%
stop {return STOP;}
[0-9]+ {yylval.num=atoi(yytext); return NB;}
produit {return PROD;}
somme {return SOM;}
soustraction {return SUS;}
division {return DIV;}
puissance {return PUI;}
racine {return RAC;}
[,|.] {return yytext[0];}
[$] {return FIN;}
[ \t\n] {}
. {printf("Erreur\t");}
%%
int yywrap()
{return 1;}
