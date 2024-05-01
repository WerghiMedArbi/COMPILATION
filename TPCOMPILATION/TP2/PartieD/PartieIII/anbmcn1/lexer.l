%{
	/* definition */

	
	#include "parser.tab.h"
    int a_count = 0;
    int c_count = 0;
%}

/* rules */
%%

a { a_count++; yylval = strdup(yytext); return A; }
b+ { yylval = strdup(yytext); return B; }
c { c_count++; yylval = strdup(yytext); return C; }
\n { return EOL; }
. {}

%%

int yywrap(){
    if (a_count != c_count) {
        fprintf(stderr, "Error: Different number of 'a's and 'c's\n");
        exit(EXIT_FAILURE);
    }
    return 1;
}