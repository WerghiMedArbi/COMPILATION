pairpair (aa|bb)*((ab|ba)(aa|bb)*(ab|ba)(aa|bb)*)*
%%
{pairpair} { printf("[%s] : nombre pair de a et de b \n", yytext); }
a*b*     { printf("[%s] : des a d'abord et des b ensuite \n", yytext); }

.        { printf("Non reconnu : [%s]\n", yytext); }
%%


int yywrap() {
    return 1;}

int main() {
    printf("Enter string: ");
    yylex();
 return 1;
}
