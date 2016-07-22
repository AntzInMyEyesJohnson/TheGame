///ceAttackThrice();

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

//set attacking alarm length and start animation alarm, 
//get direction, create projectiles and play attack sound
alarm_len = 15;
if (ani_alarm <= -1){
    ani_alarm = alarm_len;
    destdir = point_direction(x,y,xx,yy);
    var spread = -30;
    repeat(3){
        var projectile = instance_create(x+lengthdir_x(6,destdir+spread),y+lengthdir_y(6,destdir+spread),eprojectile_type);
        projectile.creator = self.id;
        projectile.accuracy = destdir + spread;
        spread += 30;
    }
    PlaySound(sound_eattack,.5,choose(8,9),random_range(.9,1.1));
}

//sprite change and use script to animate with respect to the time left in the alarm
sprite_index = ani_attack;
image_index = AnimateToAlarm(alarm_len,ani_alarm);

//start end command if shot sequence is over  
if (round(ani_alarm) == 0){
    //next command
    comscript = argument[COMENDATTACK];
}

ani_alarm--;




