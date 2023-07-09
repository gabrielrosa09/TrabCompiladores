%{
#include <stdio.h>
int contadorDatasValidas = 0;
%}

%option noyywrap

%%

[0-9]{2}\/[0-9]{2}\/[0-9]{4} {
    // Divide a string em três partes (dia, mês e ano) usando a barra como separador
    int dia = atoi(strtok(yytext, "/"));
    int mes = atoi(strtok(NULL, "/"));
    int ano = atoi(strtok(NULL, "/"));

    // Verifica se a data é inválida
    if (dia < 1 || dia > 31 || mes < 1 || mes > 12 || ano < 1900 || ano > 2023) {
        
    } else if ((mes == 4 || mes == 6 || mes == 9 || mes == 11) && dia > 30) {
        
    } else if (mes == 2 && ((ano % 4 != 0 && dia > 28) || (ano % 4 == 0 && dia > 29) || (ano == 1900 && dia > 28))) {
        
    } else {
        contadorDatasValidas++;
    }
}

.|\n {}

%%

int main() {
    // Chama o analisador léxico do Flex
    yylex();
    printf("%d", contadorDatasValidas);
    return 0;
}
