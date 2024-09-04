#include "myTypes.h"

double legacy_function(MyStructWithPointers* internal_struct){
 return *(internal_struct->c_ptr);   
}

double wrapper(MyStruct* u1){
    MyStructWithPointers internal_struct;
    internal_struct.a=u1->a;
    internal_struct.b=u1->b;
    internal_struct.c_ptr=&(u1->c);
    return legacy_function(&internal_struct);
}