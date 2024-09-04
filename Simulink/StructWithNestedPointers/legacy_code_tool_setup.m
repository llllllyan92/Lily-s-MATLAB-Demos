% using legacy code tool 


 def=legacy_code('initialize');
def.HeaderFiles={'myTypes.h'};
def.SourceFiles={'mySource.c'};
def.SFunctionName='pass_pointer_members';
def.OutputFcnSpec='double y1= wrapper(MyStruct u1[1])';
legacy_code('sfcn_cmex_generate',def); % generate the C files of the S-Function
legacy_code('compile',def); % compile to mex
legacy_code('slblock_generate', def);
creatingData;