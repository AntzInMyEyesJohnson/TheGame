///ceDodge();

//perform projectile and player checks
checkType = H;

//set time spent hit alarm length and start animation alarm
alarm_len = 12;
if (ani_alarm <= -1){
    ceInitDodge();
}

//set direction and tween the dodge
destdir = point_direction(0,0,xx,yy);
move_speed = max_speed*6;
hspd = Tween(EASEOUTCIRC, 0, lengthdir_x(move_speed,destdir), ani_alarm, alarm_len);
vspd = Tween(EASEOUTCIRC, 0, lengthdir_y(move_speed,destdir), ani_alarm, alarm_len);

//sprite change and use script to animate with respect to the time left in the alarm
sprite_index = ani_dodge;
image_index = AnimateToAlarm(alarm_len,ani_alarm);

//find another patrol point after dodging
if (round(ani_alarm) == 0){
    comscript = argument[COMENDREACT];
}

ani_alarm--;

/*
//set time spent hit alarm length and start animation alarm
alarm_len = 7;
if (ani_alarm <= -1){
    ani_alarm = alarm_len;
}


//do so move speed decelerates towards end
if (round(ani_alarm) <= 2){
    //slow down at end of dodge
    move_speed = max_speed*(round(ani_alarm)+1);
}else {
    //set move speed to higher value so can dodge at a faster speed
    move_speed = max_speed*4;
}
//set direction and dodge
destdir = point_direction(x,y,xx,yy);
hspd = lengthdir_x(move_speed,destdir);
vspd = lengthdir_y(move_speed,destdir);

//sprite change and use script to animate with respect to the time left in the alarm
sprite_index = ani_dodge;
image_index = AnimateToAlarm(alarm_len,ani_alarm);

//find another patrol point after dodging
if (round(ani_alarm) == 0){
    comscript = argument[COMENDREACT];
}


ani_alarm--;


