function errorStatus = COM_API_Jog(axisNum,distance_mm,speed_mmps)

if ~libisloaded('AMC4030')
    loadlibrary('AMC4030.dll', @ComInterfaceHeader);
end

calllib('AMC4030','COM_API_SetComType',2);
errorStatus = calllib('AMC4030','COM_API_OpenLink',24,115200);
if (errorStatus == 1)
    errorStatus = calllib('AMC4030','COM_API_Jog',axisNum,distance_mm,speed_mmps);
end