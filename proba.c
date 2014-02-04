#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "proba.h"

Variable* variables = NULL; //a változók tömbje
Variable* tmp;
int varcount = 0;


void addVariable(int value, char* name){
	varcount++;
	tmp = realloc(variables, varcount*sizeof(Variable));
	variables=tmp;
	variables[varcount-1].value=value;
	variables[varcount-1].name=name;
}

int getVariable(char* name){
	int i;
	for(i=0; i<varcount; i++){
		if(!strcmp(variables[i].name,name) ){
			return variables[i].value;
		}
	}
	return 0;
}
