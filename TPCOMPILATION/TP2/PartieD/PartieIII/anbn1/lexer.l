%{
	/* definition */

	/* build command: flex lexer.l */
	#include "parser.tab.h"
%}

/* rules */
%%

[aA] {return A;}
[bB] {return B;}
\n { return EOL; }
. {}

%%

int yywrap(){
return 1;
}
