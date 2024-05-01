%%
[a-zA-Z]+ {printf ("C'est une chaine");}
.* {printf("Ce n'est pas une chaine");}
%%
int yywrap(){return 1;}


int main(int argc, char *argv[]) {
    ++argv, --argc;
    if (argc > 0)
        yyin = fopen(argv[0], "r");
    else
        yyin = stdin;

    FILE *output_file = freopen("resultat.txt", "w", stdout); // Redirection de la sortie standard vers resultat.txt
    if (output_file == NULL) {
        perror("Error opening file");
        return 1;
    }

    yylex();

    fclose(output_file); // Fermeture du fichier de sortie redirigé
    return 0;
}

