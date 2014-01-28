#include <stdlib.h>
#include <string.h>
#include "proba.h"

Variable* variables = NULL; //a változók tömbje
Variable* tmp;
int varcount = 0;


void addVariable(int value, char* name){
	varcount++;;
	tmp = realloc(variables, varcount*sizeof(int));
	variables=tmp;
	variables[varcount-1].value=value;
	variables[varcount-1].name=name;
}

int getVariable(char* name){
	for(int i=0; i<varcount; i++){
		if(!strcmp(variables[i].name,name) ){
			return variables[i].value;
		}
	}
	return 0;
}
