id [a-zA-Z]([a-zA-Z0-9]|_)*

%%
{id} printf ("[%s]: identficateur\n", yytext);
.* {printf("Ce n'est pas un identificateur\n");}
%%
int yywrap() {return 1;}
int main()
{
yylex();
}
