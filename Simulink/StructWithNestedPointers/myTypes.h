#ifndef __MY_TYPES_H__
#define __MY_TYPES_H__
typedef struct
{
    double a;
    int b;
    double c;
          
} MyStruct;

 struct S
{
    double a;
    int b;
    double* c_ptr;
          
};
typedef struct S MyStructWithPointers;

double wrapper(MyStruct* u1);
double legacy_function(MyStructWithPointers* internal_struct);
#endif