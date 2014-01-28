typedef struct{
	int value;
	char* name;
} Variable;

void addVariable(int value, char* name);
int getVariable(char* name);
