///ceBlock();

//perform projectile and player checks
if (shield_health < 0){
    checkType = H;
} else {
    checkType = Hs;
}

//slow down
if (hspd != 0 or vspd != 0){
    hspd *= decel;
    vspd *= decel;
}

//set time spent hit alarm length and start animation alarm
alarm_len = 22;
if (ani_alarm <= -1){
    ani_alarm = alarm_len;
    //set the particle type direction (TWO of two steps to register)
    CreateParticle(global.pt_spark,destdir,part_amount,40);
}

//knockback from projectile
move_speed = knockback*1;
hspd = Tween(EASEOUTQUINT,lengthdir_x(knockback/4,destdir),lengthdir_x(knockback/2,destdir),ani_alarm,alarm_len);
vspd = Tween(EASEOUTQUINT,lengthdir_y(knockback/4,destdir),lengthdir_y(knockback/2,destdir),ani_alarm,alarm_len);

//sprite change and use script to animate with respect to the time left in the alarm
sprite_index = ani_block;
if (round(ani_alarm) >= (alarm_len)){
    image_index = 0;
} else if (round(ani_alarm) >= (alarm_len-1)){
    image_index = 1;
} else {
    image_index = Tween(EASEOUTQUINT,2,(alarm_len-1)/(image_number-3),ani_alarm,alarm_len-1);
}

//continue defending
if (round(ani_alarm) == 0){
    ani_alarm = -1;
    hspd = 0;
    vspd = 0;
    comscript = argument[COMENDHIT];
    exit;
}

ani_alarm--;
