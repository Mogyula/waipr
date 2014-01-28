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

%%

program:
        program command '\n'		{ }
	| 
	;
	
command:
	IDENTIFIER '=' expression ';'	{ addVariable($3,$1); }
	| IDENTIFIER			{ printf("%d\n",getVariable($1)); }
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

int main(void) {
    yyparse();
    return 0;
}
