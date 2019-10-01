connect_button_handle = findobj(gcf,'Tag', 'Connect');
move_button_handle = findobj(gcf,'Tag', 'Move');
stop_button_handle = findobj(gcf,'Tag', 'Stop');
home_button_handle = findobj(gcf,'Tag', 'Home');


speed_mmps_handle = findobj(gcf,'Tag', 'speed_mmps');
set(speed_mmps_handle,'String',200)

callback = get(connect_button_handle, 'Callback');
callback(connect_button_handle, []);