///ceTeleport();

//perform projectile and player checks
checkType = H;

//stop moving
if (hspd != 0 or vspd != 0){
    hspd = 0;
    vspd = 0;
}
//set teleporting alarm length, start animation alarm, 
//get teleport direction
alarm_len = 40;
if (ani_alarm <= -1){
    ani_alarm = alarm_len;
    var pmdir = point_direction(player.x,player.y,player.x+player.hspd,player.y+player.vspd);
    var pdir = point_direction(x,y,player.x,player.y);
    if (abs(player.hspd) >= 1 or abs(player.vspd) > 1){
        xx = player.x+lengthdir_x(30,pmdir);
        yy = player.y+lengthdir_y(30,pmdir);
    } else {
        xx = player.x+lengthdir_x(6,pdir);
        yy = player.y+lengthdir_y(6,pdir);
    }
}

//sprite change and use script to animate with respect to the time left in the alarm
sprite_index = ani_teleport;
image_index = AnimateToAlarm(alarm_len,ani_alarm);

//actually teleport to location
if (ani_alarm == round(alarm_len/2)){
    if (grid_place_meeting(xx,yy,-1)){
        var tdir = point_direction(xx,yy,x,y);
        while(grid_place_meeting(xx+lengthdir_x(1,tdir),yy+lengthdir_y(1,tdir),-1)){
            xx += lengthdir_x(1,tdir);
            yy += lengthdir_y(1,tdir);
        }
    }
    //play teleport sound
    PlaySound(snd_assassin_teleport,1.5,7,random_range(1,1.1));
    //go to teleport location
    x = xx;
    y = yy;
    //move_speed = distance_to_point(xx,yy);
    //destdir = point_direction(x,y,xx,yy);
    //hspd = lengthdir_x(move_speed,destdir);
    //vspd = lengthdir_y(move_speed,destdir); 
}

//continue next command after being hit
if (round(ani_alarm) == 0){
    if (distance_to_object(player) < 40 and LoS_ToObject(player)){
        comscript = ceChargeAttack;
    } else {
        comscript = cePatrolArea;
    }
}

//cycle through alarm
ani_alarm--;
