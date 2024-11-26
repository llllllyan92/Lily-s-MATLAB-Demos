%% GPS original data(NMEA01843)
% 12000.98263536;
% 3016.66617412;
%% GPS coordinate(WGS84)
wgslon=120.016377256;
wgslat=30.2777695687;    
%% baidu(BD-09)
bdlon=120.027585711;
bdlat=30.2815331044;    

% [templat,templon]=WGS84_To_GCJ02(wgslat,wgslon);
% [latitude, lontitude] = GCJ02_To_WGS84(templat,templon);
% fprintf('old:%.8f,%.8f;new:%.8f,%.8f\n',wgslat,wgslon,latitude,lontitude);
% webmap('OpenStreetMap');
% wmmarker(wgslat,wgslon);
% wmmarker(latitude,lontitude);
[templat,templon]=WGS84_To_GCJ02(wgslat,wgslon);
fprintf('amap MAP:%.8f,%.8f\n',templon,templat);
[bdLat,bdLon] = GCJ02_To_BD09(templat,templon);
fprintf('baidu MAP:%.8f,%.8f\n',bdLon,bdLat);
%matlab function to calculate the distence between two points
diff=distance(bdLat,bdLon,bdlat,bdlon,referenceEllipsoid('earth'));
fprintf('deviation:%.8f meter\n',diff);
