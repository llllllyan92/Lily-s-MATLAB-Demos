%%   /*Mars Geodetic System ==> World Geodetic System
%   * GCJ-02 to WGS84 
%   * @param gcjlat,gcjlon
%   * @return wgslat,wgslon
%   * @reference https://www.cnblogs.com/love540376/p/6484165.html
%   */ 
 function[wgslat, wgslon] = GCJ02_To_WGS84(gcjlat,gcjlon) 
    [mgLat,mgLon] = WGS84_To_GCJ02(gcjlat,gcjlon);
    wgslon = gcjlon * 2 - mgLon;  
    wgslat = gcjlat * 2 - mgLat;  
 end