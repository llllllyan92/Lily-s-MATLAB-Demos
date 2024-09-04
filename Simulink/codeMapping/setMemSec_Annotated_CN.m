
%% 加载数据
load('dataDefinitions.mat');
%% 打开模型
modelName = 'myMdlR2022a'; %此处为模型名称
open_system(modelName);
%% 清理 Workspace - 可以不执行
clear modelName
%% 获取当前打开的顶层模型的 Embedded Coder Dictionary
myCoderDictionaryObj = coder.dictionary.open(bdroot);
%% 向 Embedded Coder Dictionary 中添加 Storage Classes
% 注意此处 Embedded Coder Dictionary 中如果已经有同名的 Storage Class 会产生报错
storageClassesSection = getSection(myCoderDictionaryObj,'StorageClasses');
sc8EntryObj = addEntry(storageClassesSection,'MyStorageClassU8');
sc16EntryObj = addEntry(storageClassesSection,'MyStorageClassU16');
sc32EntryObj = addEntry(storageClassesSection,'MyStorageClassU32');
%% 向 Embedded Coder Dictionary 中添加 Memory Section
memorySectionsSection = getSection(myCoderDictionaryObj,'MemorySections');
ms8EntryObj = addEntry(memorySectionsSection,'MemorySectionU8');
ms16EntryObj = addEntry(memorySectionsSection,'MemorySectionU16');
ms32EntryObj = addEntry(memorySectionsSection,'MemorySectionU32');
%% 为刚才添加的 Storage Class 配置 Memory Section
set(sc8EntryObj,'MemorySection','MemorySectionU8');
set(sc16EntryObj,'MemorySection','MemorySectionU16');
set(sc32EntryObj,'MemorySection','MemorySectionU32');
%% 为刚才添加的 Memory Section 配置需要插入的 Pre-Post Statements
% 请根据需要替换第二个参数，行与行之间用 newline 分割，示例如
% ['First line', newline, 'second line', newline, 'third line']
set(ms8EntryObj,'PreStatement',['/*Add your Prestatement*/', newline, '/*for U8*/']);
set(ms8EntryObj,'PostStatement',['/*Add your Poststatement*/', newline, '/*for U8*/']);
set(ms16EntryObj,'PreStatement',['/*Add your Prestatement*/', newline, '/*for U16*/']);
set(ms16EntryObj,'PostStatement',['/*Add your Poststatement*/', newline, '/*for U16*/']);
set(ms32EntryObj,'PreStatement',['/*Add your Prestatement*/', newline, '/*for U32*/']);
set(ms32EntryObj,'PostStatement',['/*Add your Poststatement*/', newline, '/*for U32*/']);
%% 清理 Workspace - 可以不执行
clear -regexp ^ms[0-9]+EntryObj$ ^sc[0-9]+EntryObj$ [a-z]+Section$ myCoderDictionaryObj
%% 获取模型的 Code Mapping
myCodeMappingObj = coder.mapping.api.get (bdroot);
%% 将关联有 Signal 对象的非 Root-level 信号添加到 Code Mapping
% 获取所有连线句柄
allLineHnadles = find_system (bdroot,'FindAll','On','Type', 'line');
% 判断连线是否关联 Signal
areSignalsResolved = cell2mat(get(allLineHnadles,'MustResolveToSignalObject'));
% 取出关联 Signal 的连线句柄
resolvedSignals = allLineHnadles(areSignalsResolved);
% 判断信号是否与顶层IO口相连（通过Parent是否为顶层模型来判断）
areSignalsConnectedToRootLevelIO = cellfun(@(x)isequal(x,bdroot),get(resolvedSignals,'Parent'));
% 取出非顶层的信号，通过 addSignal 添加到 Code Mapping
nonRootLevelSignals = resolvedSignals(~areSignalsConnectedToRootLevelIO);
if length(nonRootLevelSignals) > 1
    addSignal(myCodeMappingObj,cell2mat(get(nonRootLevelSignals,'SrcPortHandle'))');
else
    addSignal(myCodeMappingObj,get(nonRootLevelSignals,'SrcPortHandle'));
end
%% 从 Code Mapping 获得所有刚才添加的信号记录
sigHandles = find(myCodeMappingObj,'Signals');
%% 在 Code Mapping 中为信号设置 Storage Class (以此来设置 Memory Section )
arrayfun(@(sigIn)setSigMemSecByDataType(myCodeMappingObj, sigIn), sigHandles);
% % 以上 arrayfun 等效于以下的 for 循环:
  % for ii=1:length(sigHandles)
  %     setMemSecByDataType(myCodeMappingObj,sigHandles(ii));
  % end
% 本地函数 setMemSecByDataType 调用了 setSignal
%% 为顶层 IO （Inport 和 Outport）设置 Memory Section
rootLevelSignals = resolvedSignals(areSignalsConnectedToRootLevelIO);
areSignalsConnectedToRootLevelIn = cellfun(@(x)isequal(x,'Inport'),get(cell2mat(get(rootLevelSignals,'SrcBlockHandle')),'BlockType'));
rootLevelInputSignals = rootLevelSignals(areSignalsConnectedToRootLevelIn);
rootLevelOutputSignals = rootLevelSignals(~areSignalsConnectedToRootLevelIn);
% 本地函数 setInportMemSecByDataType 和 setOutportMemSecByDataType
% 分别调用了 setInport 和 setOutport
arrayfun(@(sigIn)setInportMemSecByDataType(myCodeMappingObj, sigIn), rootLevelInputSignals);
arrayfun(@(sigIn)setOutportMemSecByDataType(myCodeMappingObj, sigIn), rootLevelOutputSignals);
%% Wrap-up, clear workspace
clear allLineHnadles areSignalsResolved resolvedSignals sigHandles areSignalsConnectedToRootLevelIO
clear nonRootLevelSignals rootLevelSignals areSignalsConnectedToRootLevelIn rootLevelInputSignals rootLevelOutputSignals
clear myCodeMappingObj
%% 本地函数定义
function setSigMemSecByDataType(cmObjIn, sigHandleIn)
    dt = evalin('base',[get(sigHandleIn,'Name'),'.DataType']);
    switch dt
        case 'uint8'
            setSignal(cmObjIn,sigHandleIn,'StorageClass','MyStorageClassU8');
        case 'uint16'
            setSignal(cmObjIn,sigHandleIn,'StorageClass','MyStorageClassU16');
        case 'uint32'
            setSignal(cmObjIn,sigHandleIn,'StorageClass','MyStorageClassU32');
        otherwise
            setSignal(cmObjIn,sigHandleIn,'StorageClass','auto');
    end
end

function setInportMemSecByDataType(cmObjIn, sigHandleIn)
    dt = evalin('base',[get(sigHandleIn,'Name'),'.DataType']);
    switch dt
        case 'uint8'
            setInport(cmObjIn,get(sigHandleIn,'SrcBlockHandle'),'StorageClass','MyStorageClassU8');
        case 'uint16'
            setInport(cmObjIn,get(sigHandleIn,'SrcBlockHandle'),'StorageClass','MyStorageClassU16');
        case 'uint32'
            setInport(cmObjIn,get(sigHandleIn,'SrcBlockHandle'),'StorageClass','MyStorageClassU32');
        otherwise
            setInport(cmObjIn,get(sigHandleIn,'SrcBlockHandle'),'StorageClass','auto');
    end
end

function setOutportMemSecByDataType(cmObjIn, sigHandleIn)
    dt = evalin('base',[get(sigHandleIn,'Name'),'.DataType']);
    switch dt
        case 'uint8'
            setOutport(cmObjIn,get(sigHandleIn,'Des'),'StorageClass','MyStorageClassU8');
        case 'uint16'
            setOutport(cmObjIn,get(sigHandleIn,'DstBlockHandle'),'StorageClass','MyStorageClassU16');
        case 'uint32'
            setOutport(cmObjIn,get(sigHandleIn,'DstBlockHandle'),'StorageClass','MyStorageClassU32');
        otherwise
            setOutport(cmObjIn,get(sigHandleIn,'DstBlockHandle'),'StorageClass','auto');
    end
end