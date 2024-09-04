
load myTypes.mat;
t=[0:0.1:10]';

a=timeseries(sin(t),t);
b=timeseries(int32(ones(length(t),1)),t);
 c=timeseries(exp(t),t);
leaves={a,b,c};
BusTimeseries = ...
  Simulink.SimulationData.createStructOfTimeseries('MyStruct',leaves);
save BusTimeseries BusTimeseries
u=BusTimeseries;