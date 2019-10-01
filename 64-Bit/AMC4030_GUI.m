function varargout = AMC4030_GUI(varargin)
% AMC4030_GUI MATLAB code for AMC4030_GUI.fig
%      AMC4030_GUI, by itself, creates a new AMC4030_GUI or raises the existing
%      singleton*.
%
%      H = AMC4030_GUI returns the handle to a new AMC4030_GUI or the handle to
%      the existing singleton*.
%
%      AMC4030_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AMC4030_GUI.M with the given input arguments.
%
%      AMC4030_GUI('Property','Value',...) creates a new AMC4030_GUI or raises
%      the existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AMC4030_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      Stop.  All inputs are passed to AMC4030_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AMC4030_GUI

% Last Modified by GUIDE v2.5 18-Apr-2019 13:16:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AMC4030_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @AMC4030_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before AMC4030_GUI is made visible.
function AMC4030_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AMC4030_GUI (see VARARGIN)

% Choose default command line output for AMC4030_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

initialize_gui(hObject, handles, false);

% UIWAIT makes AMC4030_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AMC4030_GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function speed_mmps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to speed_mmps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function speed_mmps_Callback(hObject, eventdata, handles)
% hObject    handle to speed_mmps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of speed_mmps as text
%        str2double(get(hObject,'String')) returns contents of speed_mmps as a double
speed_mmps = str2double(get(hObject, 'String'));
if isnan(speed_mmps)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

set(handles.status, 'String', speed_mmps);

% Save the new speed_mmps value
handles.data.speed_mmps = speed_mmps;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function distance_mm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to distance_mm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function distance_mm_Callback(hObject, eventdata, handles)
% hObject    handle to distance_mm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of distance_mm as text
%        str2double(get(hObject,'String')) returns contents of distance_mm as a double
distance_mm = str2double(get(hObject, 'String'));
if isnan(distance_mm)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new distance_mm value
handles.data.distance_mm = distance_mm;
guidata(hObject,handles)

% --- Executes on button press in Connect.
function Connect_Callback(hObject, eventdata, handles)
% hObject    handle to Connect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Load the Automation DLL
if libisloaded('AMC4030')
    unloadlibrary('AMC4030');
end
loadlibrary('AMC4030.dll', 'ComInterface.h');

% Establish connection
calllib('AMC4030','COM_API_SetComType',2);
ErrStatus = calllib('AMC4030','COM_API_OpenLink',24,115200);
if (ErrStatus == 1)
    set(handles.status, 'String', 'Connection is established');
else
    set(handles.status, 'String', 'Error in COM_API_OpenLink');
end

% --- Executes on button press in Move.
function Move_Callback(hObject, eventdata, handles)
% hObject    handle to Move (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ErrStatus = calllib('AMC4030','COM_API_Jog',handles.data.selected_axis,handles.data.distance_mm,handles.data.speed_mmps);
if (ErrStatus == 1)
    set(handles.status, 'String', 'Selected axis is moved');
else
    set(handles.status, 'String', 'Error in COM_API_Jog');
end

% --- Executes on button press in Stop.
function Stop_Callback(hObject, eventdata, handles)
% hObject    handle to Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (handles.data.selected_axis == 0)
    ErrStatus = calllib('AMC4030','COM_API_StopAxis',1,0,0);
    if (ErrStatus == 1)
        set(handles.status, 'String', 'x-axis is stopped');
    else
        set(handles.status, 'String', 'Error in COM_API_StopAxis');
    end
elseif (handles.data.selected_axis == 1)
    ErrStatus = calllib('AMC4030','COM_API_StopAxis',0,1,0);
    if (ErrStatus == 1)
        set(handles.status, 'String', 'y-axis is stopped');
    else
        set(handles.status, 'String', 'Error in COM_API_StopAxis');
    end
end

% --- Executes when selected object changed in unitgroup.
function unitgroup_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in unitgroup 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (hObject == handles.x_axis)
    handles.data.selected_axis = 0;
    guidata(hObject,handles)
    set(handles.status, 'String', 'x-axis is selected');
else
    handles.data.selected_axis = 1;
    guidata(hObject,handles)
    set(handles.status, 'String', 'y-axis is selected');
end

% --------------------------------------------------------------------
function initialize_gui(fig_handle, handles, isreset)
% If the data field is present and the Stop flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to Stop the data.
if isfield(handles, 'data') && ~isreset
    return;
end

handles.data.speed_mmps = 0;
handles.data.distance_mm  = 0;
handles.data.selected_axis = 0;

set(handles.speed_mmps, 'String', handles.data.speed_mmps);
set(handles.distance_mm,  'String', handles.data.distance_mm);
set(handles.status, 'String', 0);

set(handles.unitgroup, 'SelectedObject', handles.x_axis);

set(handles.text4, 'String', 'mm/s');
set(handles.text5, 'String', 'mm');

% Update handles structure
guidata(handles.figure1, handles);


% --- Executes on button press in Home.
function Home_Callback(hObject, eventdata, handles)
% hObject    handle to Home (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (handles.data.selected_axis == 0)
    ErrStatus = calllib('AMC4030','COM_API_Home',1,0,0);
    if (ErrStatus == 1)
        set(handles.status, 'String', 'x-axis is at home');
    else
        set(handles.status, 'String', 'Error in COM_API_Home');
    end
elseif (handles.data.selected_axis == 1)
    ErrStatus = calllib('AMC4030','COM_API_Home',0,1,0);
    if (ErrStatus == 1)
        set(handles.status, 'String', 'y-axis is at home');
    else
        set(handles.status, 'String', 'Error in COM_API_Home');
    end
end
