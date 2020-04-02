#include <stdio.h>
#include <dlfcn.h>
#include <stddef.h>

void (*hello_Ariel)(void);
int main()
{
    void* lib = dlopen("./libhello_Ariel.so",RTLD_NOW);
    if(lib == NULL)
    {
        printf("No such Lib exists");
    }
    else
    { 
        hello_Ariel = dlsym(lib,"hello_ariel");
        if(hello_Ariel==NULL)
        {
            printf("cant load lib hello function");
        }
        else
        {
            hello_Ariel();
        }
        
    }
    
    return 0;
}