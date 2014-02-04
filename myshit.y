%{
    #include <stdio.h>
    #include "proba.h"
    int yylex(void);
    void yyerror(char *);
%}

%union
{
	int iValue;
	char* strValue;
}
%token <iValue> INTEGER
%token <strValue> IDENTIFIER
%type <iValue> expression
%nonassoc IDENTIFIER

%%

program:
        program command '\n'			{ }
	|	 
	;
	
command:
	';'				{ }
	| IDENTIFIER ';'		{ printf("%d\n",getVariable($1)); }
	| IDENTIFIER '=' expression ';'	{ addVariable($3,$1); }
	;

expression:
	INTEGER				{$$=$1;}
	| expression '+' INTEGER	{$$=$1+$3;}
	| expression '-' INTEGER	{$$=$1-$3;}
	| expression '*' INTEGER	{$$=$1*$3;}
	| expression '/' INTEGER	{$$=$1/$3;}
	| '(' expression ')' 		{$$=$2;}
	;

%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

extern int yy_flex_debug;
int main(void) {
    yydebug=0;
    yy_flex_debug = 0;
    yyparse();
    return 0;
}
