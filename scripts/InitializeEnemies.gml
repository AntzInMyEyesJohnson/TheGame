epath = path_add();
vulnerable = false;
destdir = 0;
img_xsc = 0;
hspd = 0;
vspd = 0;
knockback = 0;
xx = x;
yy = y;
decel = .85;
image_speed = 0;
img_spd = 0;
part_amount = 0;
part_alarm = 0;
player = instance_nearest(x,y,obj_player);
hitby_list = ds_list_create();//create hitbox ds list
hitby_list_timer = -1;
checkType = HR;
InitializeScreenFreezeVariables();

