///ceRetreat();

//perform projectile and player checks
checkType = HR;

//set time spent hit alarm length and start animation alarm
alarm_len = 22;
if (ani_alarm <= -1){
    ani_alarm = alarm_len;
    hspd = 0;
    vspd = 0;
    xx = player.x;
    yy = player.y;
    //play retreat sound
    PlaySound(choose(snd_retreat1,snd_retreat2),.5,choose(5,6),random_range(.9,1.1));
}

//set direction and retreat
destdir = point_direction(xx,yy,x,y);//set during aim
move_speed = max_speed*3;
hspd = Tween(EASESMOOTH, lengthdir_x(move_speed/2,destdir), lengthdir_x(move_speed/2,destdir), ani_alarm, alarm_len);
vspd = Tween(EASESMOOTH, lengthdir_y(move_speed/2,destdir), lengthdir_y(move_speed/2,destdir), ani_alarm, alarm_len);

//sprite change and use script to animate with respect to the time left in the alarm
sprite_index = ani_retreat;
image_index = AnimateToAlarm(alarm_len,ani_alarm);

//find another patrol point after dodging
if (round(ani_alarm) == 0){
    move_speed = 0;
    hspd = 0;
    vspd = 0;
    comscript = cePatrolArea;
}

ani_alarm--;
