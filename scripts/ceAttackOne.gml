///ceAttackOne();

//check if there are projectiles present
if (instance_exists(obj_projectile_parent)){
    if (ReactCheck() and react_count > 0){
        //start the projectile reaction check
        comscript = argument[COMREACTRESPONSE];
        exit;
    } else if (HitCheck()){
        //start the getting hit effects
        comscript = ceHitEffect;
        exit;
    }
}

//set attacking alarm length, start animation alarm, create projectile, and play its sound
alarm_len = 15;
if (ani_alarm <= -1){
    ani_alarm = alarm_len;
    destdir = point_direction(x,y,xx,yy);
    var projectile = instance_create(x+lengthdir_x(6,destdir),y+lengthdir_y(6,destdir),eprojectile_type);
    projectile.creator = self.id;
    projectile.accuracy = destdir;
    PlaySound(sound_eattack,.4,choose(7,8),random_range(.9,1.1));
}

//sprite change and use script to animate with respect to the time left in the alarm
sprite_index = ani_attack;
image_index = AnimateToAlarm(alarm_len,ani_alarm);

//start patroling again if shot sequence is over  
if (round(ani_alarm) == 0){
    //continue patrolling
    comscript = argument[COMENDATTACK];
}
ani_alarm--;



