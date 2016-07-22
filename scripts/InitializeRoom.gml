///InitializeRoom(width,height);
window_set_fullscreen(true);

//How big is the screen?
ScreenWidth = argument[0];//display_get_width()-200;
ScreenHeight = argument[1];//display_get_height()-200;

//Set size of window - NOT NEEDED IN FULLSCREEN
//window_set_size(ScreenWidth,ScreenHeight);

//How much of the room do we want onscreen?
view_wview = ScreenWidth;
view_hview = ScreenHeight;

//How much of our screen do we want to take up?
view_wport = ScreenWidth;
view_hport = ScreenHeight;

//Gamemaker BS
surface_resize(application_surface,ScreenWidth,ScreenHeight);

//Set cursor
SetCursorTargetReticule();
