%{
	/* definition */

	/* build command: flex lexer.l */
	#include "parser.tab.h"
%}

/* rules */
%%

[aA] {return A;}
[bB] {return B;}
[cC] {return C;}
\n { return EOL; }
. {}

%%

int yywrap(){
return 1;
}
