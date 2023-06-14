%{
#include "stdio.h"
int yylval;
extern int lineCounter;
%}

variable [a-z_]+
float [+-]?[0-9]*(\.)[0-9]+
integer [+-]?[0-9]+
newline [\n]
char [\'][a-zA-Z][\']
comment !!.*

%%
"BRAIN"				{return TOKENBEGIN;}
"DEAD"				{return TOKENEND;} 			
"str"				return (STR_TYPE);
"int" 				return(INT_TYPE);
"float" 			return(FLOAT_TYPE);
"AND" 				return(AND);
"OR"				return(OR);
"==" 				return(EQUAL);
"if" 				return(IF);
"then" 				return(THEN);
"else" 				return(ELSE);
"while"				return(WHILE);
"print" 			return(PRINT);
"for" 				return(FOR);
"," 				return(COMMA);
"(" 				return(LEFT_BRACKET);
")" 				return(RIGHT_BRACKET);
"{" 				return(LEFT_CURLY_BRACKET);
"}"				return(RIGHT_CURLY_BRACKET);
"["				return(LEFT_SQUARE_BRACKET);
"]"				return(RIGHT_SQUARE_BRACKET);
"+" 				return(PLUS_OPT);
"-" 				return(SUB_OPT);
"/" 				return(DIV_OPT);
"*" 				return(MULT_OPT);
"^"				return(NEWLINE);
">" 				return(GREATER_THAN);
"<" 				return(LESS_THAN);
">=" 				return(GREATER_OR_EQUAL_THAN);
"<=" 				return(LESS_OR_EQUAL_THAN);
"!="				return(NOT_EQUAL);
"?=" 				return(IS_EQUAL);
":"				return(COLON);
! 				return(NOT);
{integer} 			return(INTEGER);
{float} 			return(FLOAT);
{variable} 			return(VARIABLE);
{newline} 			{lineCounter++;}
[A-Z_]+ 			return(CONST);
\; 				return(SEMICOLON);
{comment} 			return(COMMENT);
[ \r\t]+ ;
. 				return(INVALID);
%%

int yywrap() { return 1; }

