grammar subC;
// Reglas del parser
programa : declaraciones EOF;

declaraciones
    : declaracion
    | declaraciones declaracion
    ;

declaracion
    : tipo identificador '(' parametros? ')' '{' cuerpo '}'
    ;

tipo
    : 'int'
    | 'float'
    | 'char'
    ;

identificador
    : ID
    ;

parametros
    : parametro
    | parametros ',' parametro
    ;

parametro
    : tipo identificador
    ;

cuerpo
    : instruccion
    | cuerpo instruccion
    ;

instruccion
    : retorno
    ;

retorno
    : 'return' expresion ';'
    ;

expresion
    : expresion '+' termino
    | expresion '-' termino
    | termino
    ;

termino
    : termino '*' factor
    | termino '/' factor
    | factor
    ;

factor
    : '(' expresion ')'
    | NUMERO
    | identificador
    ;

// Tokens del lexer
ID      : [a-zA-Z] [a-zA-Z0-9]* ;
NUMERO  : [0-9]+ ;
WS      : [ \t\r\n]+ -> skip ;
