function defineMyChecks

% Create ModelAdvisor.Check object and set properties.
rec = ModelAdvisor.Check('advisor.edittimecheck.UnconnectedLines');
rec.Title = 'Edit-time: Check if there are unconnected lines';
rec.CallbackHandle = 'MyEditTimeChecks.UnconnectedLines'; 
mdladvRoot = ModelAdvisor.Root;
mdladvRoot.publish(rec, 'MyChecks'); 
end