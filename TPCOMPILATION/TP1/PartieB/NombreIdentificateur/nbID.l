id [a-zA-Z]([a-zA-Z0-9]|_)*
nb [0-9]+ 
%%
{id} printf ("[%s]: identficateur\n", yytext);
{nb} printf("[%s]:  un nombre \n", yytext); 

.* {printf("Ce n'est pas un identificateur ni un nombre \n");}
%%
int yywrap() {return 1;}
int main()
{
yylex();
}






