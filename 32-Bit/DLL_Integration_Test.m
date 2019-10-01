%% Motor DLLs

% Load the Automation DLL
if libisloaded('AMC4030')
    unloadlibrary('AMC4030');
end

loadlibrary('AMC4030.dll', 'ComInterface.h');
libfunctions('AMC4030')

ErrStatus = calllib('AMC4030','COM_API_SetComType',2);
ErrStatus = calllib('AMC4030','COM_API_OpenLink',24,115200);
ErrStatus = calllib('AMC4030','COM_API_Jog',0,100.0,10.0);

%% System calls
status = system(command);

%% Create header
% Run the following command in MATLAB only once to create the prototype file:
loadlibrary('AMC4030.dll', 'ComInterface.h', 'mfilename', 'ComInterfaceHeader');
% Change the call to loadlibrary in your MATLAB to the following:
loadlibrary('AMC4030.dll', @ComInterfaceHeader)