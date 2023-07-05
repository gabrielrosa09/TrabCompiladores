### Para rodar o código

- Baixe o Flex
`sudo apt-get install flex`
- Para rodar
``` bash
1 - flex valida_data.l
2 - gcc lex.yy.c -o valida_data
3 - ./valida_data < entrada.txt
```