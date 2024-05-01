%%
(0|1)+ {printf ("C'est un nombre binaire");}
.* {printf("Ce n'est pas un nombre binaire");}
%%
int yywrap(){return 1;}
main ()
{
    yylex();
}