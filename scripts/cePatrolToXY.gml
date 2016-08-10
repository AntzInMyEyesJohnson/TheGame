///cePatrolToXY();

//perform projectile and player checks
checkType = H;

//set charging alarm length and start animation alarm
if (ani_alarm <= -1){
    alarm_len = irandom_range(30,120);
}

if(instance_exists(obj_player){
    //start chasing command if player is in range
    if(LoS_ToObject(obj_player) and ani_alarm > alarm_len and InstanceInView(self)){
        comscript = argument[COMALERT];
        exit;
    } 
}

//continue to patrol if player not spotted and within range
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
    //stop when at destination
    hspd = 0;
    vspd = 0;
    comscript = cePatrolArea;
}

//sprite changes
sprite_index = ani_move;
img_spd = max(abs(hspd),abs(vspd))/image_number;

ani_alarm++;
