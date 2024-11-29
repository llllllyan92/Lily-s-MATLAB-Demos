rootDir = pwd;
%%
cd([rootDir,'\Version1\']);
load_system('untitled');
curChecksum1 = Simulink.BlockDiagram.getChecksum('untitled'); % 获取校验码
modelVersion1 = get_param('untitled','ModelVersion'); % 获取模型版本号
close_system('untitled');
%%
cd([rootDir,'\Version2\']);
load_system('untitled'); % 两个模型须同名
curChecksum2 = Simulink.BlockDiagram.getChecksum('untitled');
modelVersion2 = get_param('untitled','ModelVersion');
close_system('untitled');
%%
if(~isequal(curChecksum1,curChecksum2)&&isequal(modelVersion1,modelVersion2))
    error("Model changed!");
end