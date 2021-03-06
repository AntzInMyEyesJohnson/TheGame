///ceWanderToXY();

//perform projectile and player checks
checkType = H;

//set direction and accelerate to that speed
move_speed = max_speed - (10/room_speed);
destdir = point_direction(x,y,xx,yy);
hspd += lengthdir_x(max_speed/3,destdir);
vspd += lengthdir_y(max_speed/3,destdir);

/*using paths not hspd and vspd
//move towards player
hspd = 0;
vspd = 0;
spd += 20/room_speed;
spd = clamp(spd,0, max_speed);
GetPathToObject(epath,obj_player,spd);
*/

//when close to destination start picking out new destination
if(point_distance(x,y,xx,yy)< 10){
    comscript = cePatrolArea;
    exit;
}

//sprite changes
sprite_index = ani_move;
img_spd = max(abs(hspd),abs(vspd))/image_number;
