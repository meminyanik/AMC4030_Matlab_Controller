function errorStatus = COM_API_Home(xAxisHome,yAxisHome,zAxisHome)

if ~libisloaded('AMC4030')
    loadlibrary('AMC4030.dll', @ComInterfaceHeader);
end

calllib('AMC4030','COM_API_SetComType',2);
errorStatus = calllib('AMC4030','COM_API_OpenLink',24,115200);
if (errorStatus == 1)
    errorStatus = calllib('AMC4030','COM_API_Home',xAxisHome,yAxisHome,zAxisHome);
    % Example call to home 'x' and 'y' axes
    % errorStatus = calllib('AMC4030','COM_API_Home',1,1,0);
end