%%   /*BAI DU System ==>Mars Geodetic System 
%   * BD-09 to GCJ-02  
%   * @param bdlat,bdlon
%   * @return gcjlat,gcjlon
%   * @reference https://www.cnblogs.com/love540376/p/6484165.html
%   */ 
function[gcjat,gcjon] = BD09_To_GCJ02(bdlat,bdlon)
     x = bdlon - 0.0065;
     y = bdlat - 0.006;  
     x_pi = pi * 3000.0 / 180.0;
     z = sqrt(x * x + y * y) - 0.00002 * sin(y * x_pi);  
     theta = atan2(y, x) - 0.000003 * cos(x * x_pi);  
     gcjon = z * cos(theta);  
     gcjat = z * sin(theta);  
end  