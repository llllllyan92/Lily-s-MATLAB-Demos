classdef UnconnectedLines < ModelAdvisor.EdittimeCheck
    properties(Access=private)
        ii=0;
    end
    methods
        function obj=UnconnectedLines(checkId)
            obj=obj@ModelAdvisor.EdittimeCheck(checkId);
            obj.traversalType = edittimecheck.TraversalTypes.ACTIVEGRAPH;                       
        end
        
        function violation = blockDiscovered(obj, blk)
            violation = [];
            if(strcmp(get(blk,'BlockType'),'SubSystem'))
                fullPath = [get(blk, 'Path'),'/', get(blk, 'Name')];
                unconnectedLines = find_system(fullPath,...
                    'SearchDepth', '1',...
                    'FindAll','On',...
                    'Connected', 'off',...
                    'Type', 'line');
                if(~isempty(unconnectedLines))
                    violation = ModelAdvisor.ResultDetail;
                    ModelAdvisor.ResultDetail.setData(violation,'SID',Simulink.ID.getSID(blk));
                    % disp(Simulink.ID.getSID(blk))
                    violation.CheckID = obj.checkId;
                    violation.Description = 'Unconnected line(s) detected in the following subsystem(s).';
                    violation.title = 'Unconnected Line';
                    violation.ViolationType = 'warn';
                end
            end
        end  
    
        
        function violation = finishedTraversal(obj)            
            violation = [];
        end
        
        function success = fix(obj, violation)
            success = true;
        end
    end
end