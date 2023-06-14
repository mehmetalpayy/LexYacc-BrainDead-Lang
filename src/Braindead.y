%{
    #include <stdio.h>
    void yyerror(const char *s);
    int yylex();
%}

%start program

%token INTEGER FLOAT STRING IDENTIFIER PLUS_OPT SUB_OPT DIV_OPT MULT_OPT INT_TYPE FLOAT_TYPE STR_TYPE
%token CONST VARIABLE
%token AND OR NOT EQUAL
%token IF THEN ELSE WHILE FOR PRINT
%token LEFT_BRACKET RIGHT_BRACKET LEFT_CURLY_BRACKET RIGHT_CURLY_BRACKET LEFT_SQUARE_BRACKET RIGHT_SQUARE_BRACKET
%token GREATER_THAN LESS_THAN GREATER_OR_EQUAL_THAN LESS_OR_EQUAL_THAN NOT_EQUAL IS_EQUAL
%token COMMA SEMICOLON COLON RETURN INVALID
%token NEWLINE TOKENBEGIN TOKENEND COMMENT
%left PLUS_OPT SUB_OPT
%left MULT_OPT DIV_OPT
%right EXP_OPT



%%

program: TOKENBEGIN LEFT_CURLY_BRACKET stmts RIGHT_CURLY_BRACKET TOKENEND;

stmts: stmts stmt | stmt;

stmt : non_block_statement NEWLINE | building_expression | COMMENT ;
 
non_block_statement : assignment_statement | variable_definition | print_statement ;
 
assignment_statement : left_hand_side COLON EQUAL right_hand_side ;
 
left_hand_side : variable_definition | VARIABLE ;
 
right_hand_side : expression ;
 
expression : conditional_expression ;

conditional_expression : or_state ;
 
or_state : and_state
     | or_state OR and_state ;
 
and_state : equality_expressions
     | and_state AND equality_expressions ;
 
equality_expressions : logical_expressions
     | equality_expressions equality_operators logical_expressions ;
 
logical_expressions : mathematical_expressions
| logical_expressions logical_operators mathematical_expressions ;
 
mathematical_expressions : edm_expressions
     | mathematical_expressions mathematical_operators edm_expressions ;
 
edm_expressions : basic_expressions
     | edm_expressions edm_operators basic_expressions ;

basic_expressions : VARIABLE | CONST | basic_types
     | LEFT_BRACKET expression RIGHT_BRACKET ;

print_statement : PRINT LEFT_CURLY_BRACKET expression RIGHT_CURLY_BRACKET ;

building_expression : if_expression | if_else_expression | loop_statements ;
 
if_expression : IF LEFT_BRACKET conditional_expression RIGHT_BRACKET struct ;
 
if_else_expression : IF LEFT_BRACKET conditional_expression RIGHT_BRACKET struct ELSE struct ;
 
loop_statements : while_expression | for_expression ;
 
while_expression : WHILE LEFT_BRACKET conditional_expression RIGHT_BRACKET struct ;
 
for_expression : FOR LEFT_BRACKET assignment_statement SEMICOLON conditional_expression SEMICOLON assignment_statement RIGHT_BRACKET struct ;
 
variable_definition: type_names LEFT_SQUARE_BRACKET VARIABLE RIGHT_SQUARE_BRACKET ;

edm_operators : MULT_OPT | DIV_OPT ;
 
mathematical_operators : PLUS_OPT | SUB_OPT ;
 
logical_operators :  LESS_THAN | GREATER_THAN | LESS_OR_EQUAL_THAN | GREATER_OR_EQUAL_THAN ;
 
equality_operators : IS_EQUAL |NOT_EQUAL ;
 
struct :  LEFT_CURLY_BRACKET stmts RIGHT_CURLY_BRACKET |  LEFT_CURLY_BRACKET RIGHT_CURLY_BRACKET ;
 
type_names : INT_TYPE | FLOAT_TYPE | STR_TYPE ;
 
basic_types : INTEGER | FLOAT | STRING ;



%%
#include "lex.yy.c"
int lineCounter=1;
int check = 0;
void yyerror(const char *s)
{
    printf ("%s on line %d\n", s, lineCounter);
    check = 1;
}

int main(void)
{
    yyparse();
    if ( check == 0 )
    {
        printf ("OK!\n");
    }
}
 

