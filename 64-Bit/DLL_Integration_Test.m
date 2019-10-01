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


%% Radar Studio
RSTD_DLL_Path ='C:\ti\mmwave_studio_02_00_00_02\mmWaveStudio\Clients\RtttNetClientController\RtttNetClientAPI.dll';
ErrStatus = Init_RSTD_Connection(RSTD_DLL_Path);


%% HSDC Pro
% 64 Bit
HSDCPRO_DLL_Path = 'C:\Program Files (x86)\Texas Instruments\High Speed Data Converter Pro\HSDCPro Automation DLL\64Bit DLL\HSDCProAutomation_64Bit.dll';
addpath('C:\Program Files (x86)\Texas Instruments\High Speed Data Converter Pro\HSDCPro Automation DLL\Manual and Examples\Automation DLL Matlab Example\64Bit Matlab\')

% 32 Bit
HSDCPRO_DLL_Path = 'C:\Program Files (x86)\Texas Instruments\High Speed Data Converter Pro\HSDCPro Automation DLL\32Bit DLL\HSDCProAutomation.dll';
addpath('C:\Program Files (x86)\Texas Instruments\High Speed Data Converter Pro\HSDCPro Automation DLL\Manual and Examples\Automation DLL Matlab Example\32Bit Matlab\')



% Load the Automation DLL
if libisloaded('HSDCProAutomation_64Bit')
    unloadlibrary('HSDCProAutomation_64Bit');
end
loadlibrary(HSDCPRO_DLL_Path, @HSDCProAutomationHeader);