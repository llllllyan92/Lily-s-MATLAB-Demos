%% Load Data
load('dataDefinitions.mat');
%% Open Model
modelName = 'myMdlR2022a';
open_system(modelName);
%% Wrap-up, clear workspace
clear modelName
%% Get Coder Dictionary Object for Current Opened Model
myCoderDictionaryObj = coder.dictionary.open(bdroot);
%% Add Storage Classes to Coder Dictionary
storageClassesSection = getSection(myCoderDictionaryObj,'StorageClasses');
sc8EntryObj = addEntry(storageClassesSection,'MyStorageClassU8');
sc16EntryObj = addEntry(storageClassesSection,'MyStorageClassU16');
sc32EntryObj = addEntry(storageClassesSection,'MyStorageClassU32');
%% Add Memory Sections to Coder Dictionary
memorySectionsSection = getSection(myCoderDictionaryObj,'MemorySections');
ms8EntryObj = addEntry(memorySectionsSection,'MemorySectionU8');
ms16EntryObj = addEntry(memorySectionsSection,'MemorySectionU16');
ms32EntryObj = addEntry(memorySectionsSection,'MemorySectionU32');
%% Set MemSec for Storage Class Entries
set(sc8EntryObj,'MemorySection','MemorySectionU8');
set(sc16EntryObj,'MemorySection','MemorySectionU16');
set(sc32EntryObj,'MemorySection','MemorySectionU32');
%% Set Pre-Post Statements for Memory Section Entries
set(ms8EntryObj,'PreStatement','/*Add your Prestatement for U8*/');
set(ms8EntryObj,'PostStatement','/*Add your Poststatement for U8*/');
set(ms16EntryObj,'PreStatement','/*Add your Prestatement for U16*/');
set(ms16EntryObj,'PostStatement','/*Add your Poststatement for U16*/');
set(ms32EntryObj,'PreStatement','/*Add your Prestatement for U32*/');
set(ms32EntryObj,'PostStatement','/*Add your Poststatement for U32*/');
%% Wrap-up, clear workspace
clear -regexp ^ms[0-9]+EntryObj$ ^sc[0-9]+EntryObj$ [a-z]+Section$ myCoderDictionaryObj
%% Get Code Mapping Object
myCodeMappingObj = coder.mapping.api.get (bdroot);
%% Add Resolved Signals to Code Mapping
allLineHnadles = find_system (bdroot,'FindAll','On','Type', 'line');
areSignalsResolved = cell2mat(get(allLineHnadles,'MustResolveToSignalObject'));
resolvedSignals = allLineHnadles(areSignalsResolved);
areSignalsConnectedToRootLevelIO = cellfun(@(x)isequal(x,bdroot),get(resolvedSignals,'Parent'));
nonRootLevelSignals = resolvedSignals(~areSignalsConnectedToRootLevelIO);
if length(nonRootLevelSignals) > 1
    addSignal(myCodeMappingObj,cell2mat(get(nonRootLevelSignals,'SrcPortHandle'))');
else
    addSignal(myCodeMappingObj,get(nonRootLevelSignals,'SrcPortHandle'));
end
%% Get All Signals from Code Mapping
sigHandles = find(myCodeMappingObj,'Signals');
%% Set Storage Class for All Signals
arrayfun(@(sigIn)setSigMemSecByDataType(myCodeMappingObj, sigIn), sigHandles);
% % This is equivalent to the following for loop:
  % for ii=1:length(sigHandles)
  %     setMemSecByDataType(myCodeMappingObj,sigHandles(ii));
  % end
%% Set Memory Section for Root-level IO
rootLevelSignals = resolvedSignals(areSignalsConnectedToRootLevelIO);
areSignalsConnectedToRootLevelIn = cellfun(@(x)isequal(x,'Inport'),get(cell2mat(get(rootLevelSignals,'SrcBlockHandle')),'BlockType'));
rootLevelInputSignals = rootLevelSignals(areSignalsConnectedToRootLevelIn);
rootLevelOutputSignals = rootLevelSignals(~areSignalsConnectedToRootLevelIn);
arrayfun(@(sigIn)setInportMemSecByDataType(myCodeMappingObj, sigIn), rootLevelInputSignals);
arrayfun(@(sigIn)setOutportMemSecByDataType(myCodeMappingObj, sigIn), rootLevelOutputSignals);
%% Wrap-up, clear workspace
clear allLineHnadles areSignalsResolved resolvedSignals sigHandles areSignalsConnectedToRootLevelIO
clear nonRootLevelSignals rootLevelSignals areSignalsConnectedToRootLevelIn rootLevelInputSignals rootLevelOutputSignals
clear myCodeMappingObj
%% Local Functions
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