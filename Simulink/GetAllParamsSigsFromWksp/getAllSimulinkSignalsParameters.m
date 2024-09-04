%% 创建一批数据用于测试
% 实际运行中跳过本节，直接运行下面一节获取所有信号和参数即可
mySig1 = Simulink.Signal;
mySig2 = Simulink.Signal;
mySig2.DataType = 'int8';
myParam1 = Simulink.Parameter;
myParam1.Value = 11;
myParam2 = Simulink.Parameter;
myParam2.DataType = 'boolean';
myParam2.Value = 1;

%% 找到workspace所有变量
allVars = whos;

%% 以下用来存储对所有变量类型的判断结果
isParam = zeros(1,length(allVars));
isSig = zeros(1,length(allVars));
for ii=1:length(allVars)
    isParam(ii) = evalin('base',['isa(',allVars(ii).name,',"Simulink.Parameter"',');']);
    isSig(ii) = evalin('base',['isa(',allVars(ii).name,',"Simulink.Signal"',');']);
end
% 筛选出所有 Simulink.Parameter
allParams = allVars(boolean(isParam));
% 筛选出所有 Simulink.Signal
allSigs = allVars(boolean(isSig));

%% 创建新参数
% 创建为 mpt.Parameter —— 我本地没有 myPackage 包
% 请自行修改为对应的 myPackage.Parameter
for ii = 1:length(allParams)
    % 读取原数据类型
    originalDataType = evalin('base',[allParams(ii).name,'.DataType']);
    % 读取原值
    originalValue = evalin('base',[allParams(ii).name,'.Value']);
    % 创建参数
    % 这里请将 mpt.Parameter 修改为 myPackage.Parameter
    evalin('base',[allParams(ii).name,' = mpt.Parameter;'] );
    % 复原数据类型
    evalin('base',[allParams(ii).name,'.DataType = "', originalDataType, '";']);
    % 复原数值 —— 区分空和非空
    if(isempty(originalValue))
        evalin('base',[allParams(ii).name,'.Value = [];']);
    else
        evalin('base',[allParams(ii).name,'.Value =',num2str(originalValue),';']);
    end
    % 设置 Storage Class 为 ExportToFile
    % 这里请自行修改为 ExportToFile_Anew
    evalin('base',[allParams(ii).name,'.CoderInfo.StorageClass = "Custom";']);
    evalin('base',[allParams(ii).name,'.CoderInfo.CustomStorageClass = "ExportToFile";']);
    % 设置 Memory Section 为 MemConst
    % 这里请自行修改为 Default_Anew
    evalin('base',[allParams(ii).name,'.CoderInfo.CustomAttributes.MemorySection = "MemConst";'])
end

%% 创建新信号
% 类似，请：
% 修改信号类型为 myPackage.Signal
% 修改 Storage Class 为 ExportToFile_Anew
% 修改 Memory Section 为 Default_Anew
% Signal 没有 Value
for ii = 1:length(allSigs)
    originalDataType = evalin('base',[allSigs(ii).name,'.DataType']);
    evalin('base',[allSigs(ii).name,' = mpt.Signal;'] );
    evalin('base',[allSigs(ii).name, '.DataType = "', originalDataType, '";']);
    evalin('base',[allSigs(ii).name,'.CoderInfo.StorageClass = "Custom";']);
    evalin('base',[allSigs(ii).name,'.CoderInfo.CustomStorageClass = "ExportToFile";']);
    evalin('base',[allSigs(ii).name,'.CoderInfo.CustomAttributes.MemorySection = "MemConst";'])
end