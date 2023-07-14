    /* 
        Integrantes do grupo
        Ana Carolina Costa César - 190101750
        Ana Caroline Campos Rocha - 190083930
        Catlen Cleane Ferreira de Oliveira - 211031664
        Gabriel da Silva Rosa - 202023681
    */
%{
#include <stdio.h>
#include <stdlib.h>
int contadorDatasValidas = 0;
%}

DIA_MES31 (0[1-9]|[12][0-9]|3[01])
DIA_MES30 (0[1-9]|[12][0-9]|30)
DIA_FEV (0[1-9]|1[0-9]|2[0-8])
DIA_FEV_BISSEXTO (0[1-9]|[12][0-9])
MES_31 (0[13578]|1[02])
MES_30 (0[469]|11)
FEV (02)
ANO (19[0-9]{2}|200[0-9]|201[0-9]|202[0-3])
BISSEXTO (190[48]|191[26]|19[2468][048]|19[13579][26]|200[048]|20[1][26]|2020)
BARRA \/
WHITESPACE [ ]
TAB [\t]
QUEBRA [\n]

%%
{DIA_MES31}{BARRA}{MES_31}{BARRA}{ANO} {contadorDatasValidas++;}
{DIA_MES30}{BARRA}{MES_30}{BARRA}{ANO} {contadorDatasValidas++;}
{DIA_FEV}{BARRA}{FEV}{BARRA}{ANO} {contadorDatasValidas++;}
{DIA_FEV_BISSEXTO}{BARRA}{FEV}{BARRA}{BISSEXTO} {contadorDatasValidas++;}
.|\n {}
%%

int yywrap(void);

int main(void)
{
    yylex();
    printf("%d\n", contadorDatasValidas);
    return 0;
}

int yywrap(void)
{
    return 1;
}
