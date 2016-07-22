///ceHit();

//perform projectile and player checks
checkType = HR;

//slow down
if (hspd != 0 or vspd != 0){
    hspd *= decel;
    vspd *= decel;
}

//set time spent hit alarm length and start animation alarm
alarm_len = 22;
if (ani_alarm <= -1){
    if (!ceInitHit()){exit;}
}

move_speed = knockback;
//knockback from projectile
hspd = Tween(EASEOUTQUINT,lengthdir_x(knockback/2,destdir),lengthdir_x(knockback/12,destdir),ani_alarm,alarm_len);
vspd = Tween(EASEOUTQUINT,lengthdir_y(knockback/2,destdir),lengthdir_y(knockback/12,destdir),ani_alarm,alarm_len);

//sprite change and use script to animate with respect to the time left in the alarm
sprite_index = ani_hit;
if (round(ani_alarm) >= (alarm_len)){
    image_index = 0;
} else if (round(ani_alarm) >= (alarm_len-1)){
    image_index = 1;
} else {
    image_index = Tween(EASEOUTQUINT,2,(alarm_len-1)/(image_number-3),ani_alarm,alarm_len-1);
}

//continue patrolling after being hit
if (round(ani_alarm) == 0){
    if (react_count != 0){react_count++;}
    ani_alarm = -1;
    hspd = 0;
    vspd = 0;
    comscript = argument[COMENDHIT];
    exit;
}

ani_alarm--;
