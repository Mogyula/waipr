%{
    #include "myshit.tab.h"
    #include "proba.h"
    #include <stdlib.h>
    void yyerror(char *);
%}

%%

[A-Za-z]+[A-Za-z0-9]*	{
		yylval.strValue=yytext;
		return IDENTIFIER;	
		}

[0-9]+      {
                yylval.iValue = atoi(yytext);
                return INTEGER;
            }

[;=()-+*/\n]      return *yytext;

[ \t\q]       ; /* skip whitespace */

.           yyerror("invalid character");

%%

int yywrap(void) {
    return 1;
}
