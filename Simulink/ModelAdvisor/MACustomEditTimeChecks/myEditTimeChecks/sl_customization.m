function sl_customization(cm)
% register custom checks 
cm.addModelAdvisorCheckFcn(@defineModelAdvisorChecks);

% -----------------------------
% defines Model Advisor Checks
% -----------------------------
function defineModelAdvisorChecks
defineMyChecks;