addpath('CoordinateConversion');
%%
name = 'amap';
url = 'https://webrd04.is.autonavi.com/appmaptile?lang=zh_cn&size=1&scale=1&style=7&x=${x}&y=${y}&z=${z}';
% url = 'http://webst01.is.autonavi.com/appmaptile?style=6&x=${x}&y=${y}&z=${z}';
% url = 'http://webst01.is.autonavi.com/appmaptile?style=6&x={x}&y={y}&z={z}';
addCustomBasemap(name,url);
%% Read coordinates from .osm if needed
% dataWGS84 = load('geoSequence.mat');
osmstruct = readstruct('planet_121.171_31.281_d666304b.osm',FileType='xml');
dataWGS84.latitude = vertcat(osmstruct.node(70:90).latAttribute);
dataWGS84.longitude = vertcat(osmstruct.node(70:90).lonAttribute);
%% Convert coordinates from WGS84 if needed
dataGCJ02.latitude = zeros(size(dataWGS84.latitude));
dataGCJ02.longitude = zeros(size(dataWGS84.longitude));
for ii=1:length(dataGCJ02.latitude)
    [dataGCJ02.latitude(ii), dataGCJ02.longitude(ii)] = ...
        WGS84_To_GCJ02(dataWGS84.latitude(ii),dataWGS84.longitude(ii));
end
%%
player = geoplayer(dataGCJ02.latitude(1),dataGCJ02.longitude(1), ...
    'Basemap','amap','HistoryDepth',Inf);
for ii = 1:length(dataGCJ02.latitude)
    plotPosition(player,dataGCJ02.latitude(ii),dataGCJ02.longitude(ii));
end
%%
removeCustomBasemap('amap');