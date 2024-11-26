function state=Transform_outOfChina(lat,lon)
    if (lon < 72.004 || lon > 137.8347)  
        state=1;
        return;
    end
    if (lat < 0.8293 || lat > 55.8271)  
        state=1;
        return;
    end
    state=0; 
end