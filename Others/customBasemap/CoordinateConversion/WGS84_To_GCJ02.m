%%   /*World Geodetic System ==> Mars Geodetic System 
%   * WGS84 to GCJ-02  
%   * @param wgslat,wgslon
%   * @return gcjlat,gcjlon
%   * @reference https://www.cnblogs.com/love540376/p/6484165.html
%   */ 
function [gcjlat,gcjlon] = WGS84_To_GCJ02(wgslat,wgslon)
    a = 6378245.0;
    ee = 0.00669342162296594323;
    if (Transform_outOfChina(wgslat, wgslon))%ChinaÖ®Íâ£¬×ø±ê²»ÐèÒª×ª»»
        gcjlat=wgslat;
        gcjlon=wgslon;
        return;  
    end 
    dLat = Transform_Lat(wgslon - 105.0, wgslat - 35.0);  
    dLon = Transform_Lon(wgslon - 105.0, wgslat - 35.0);  
    radLat = wgslat / 180.0 * pi;  
    magic = sin(radLat);  
    magic = 1 - ee * magic * magic;  
    sqrtMagic = sqrt(magic);  
    dLat = (dLat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * pi);  
    dLon = (dLon * 180.0) / (a / sqrtMagic * cos(radLat) * pi);  
    gcjlat = wgslat + dLat;  
    gcjlon = wgslon + dLon;  
end