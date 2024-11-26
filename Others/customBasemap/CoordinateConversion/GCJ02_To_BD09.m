%%   /*Mars Geodetic System ==> BAI DU System
%   * GCJ-02 to BD-09  
%   * @param gcjlat,gcjlon
%   * @return bdlat,bdlon
%   * @reference https://www.cnblogs.com/love540376/p/6484165.html
%   */ 
 function [bdlat,bdlon] = GCJ02_To_BD09(gcjlat,gcjlon)
    x_pi = pi * 3000.0 / 180.0;
    z = sqrt(gcjlon * gcjlon + gcjlat * gcjlat) + 0.00002 * sin(gcjlat * x_pi);  
    theta = atan2(gcjlat, gcjlon) + 0.000003 * cos(gcjlon * x_pi);  
    bdlon = z * cos(theta) + 0.0065;  
    bdlat = z * sin(theta) + 0.006;   
 end  