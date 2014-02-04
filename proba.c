#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "proba.h"

Variable* variables = NULL; //a változók tömbje
Variable* tmp;
int varcount = 0;


void addVariable(int value, char* name){
	//first we gonna check, if that given variable already existed
	//we gonna reuse getVariable for that
	tmp=checkVariable(name);
	if (tmp!=NULL) tmp->value = value;
	else{
		varcount++;
		tmp = realloc(variables, varcount*sizeof(Variable));
		variables=tmp;
		variables[varcount-1].value=value;
		variables[varcount-1].name=name;
	}
}

Variable* checkVariable(char* name){
	//this is going to return a pointer, a NULL if there was no match
        int i;
        for(i=0; i<varcount; i++){
                if(!strcmp(variables[i].name,name) ){
                        return variables+i;
                }
        }
	//if there were no matches:
	return NULL;
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
