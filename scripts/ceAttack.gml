///ceAttack();
var type,number,buffer,create_count,spread,random_spread;
spread = 0;
type = argument[VARATKTYPE];
number = argument[VARATKNUMBER];
buffer = argument[VARATKBUFFER];
random_spread = argument[VARATKRANDOM];

//perform projectile and player checks
checkType = H;

if (buffer){
    create_count = 1;
}else{
    create_count = number;
}

//set alarm length and start animation alarm, 
//get direction, create projectiles and play attack sound
alarm_len = 20;
if (ani_alarm <= -1){
    ani_alarm = alarm_len;
    destdir = point_direction(x,y,xx,yy);
    if (create_count mod 2 != 0){
        spread = destdir + ((create_count div 2)*20);
    } else {
        spread = destdir + (((create_count div 2)*20)-10);
    }
     
    repeat(create_count){
        var projectile = instance_create(x+lengthdir_x(6,spread),y+lengthdir_y(6,spread),type);
        projectile.creator = self.id;
        projectile.accuracy = spread;
        if (random_spread == true){
            spread -= irandom(20);
        } else {
            spread -= 20;
        }
    }
    PlaySound(sound_eattack,.5,choose(8,9),random_range(.9,1.1));
}

//sprite change and use script to animate with respect to the time left in the alarm
sprite_index = ani_attack;
image_index = AnimateToAlarm(alarm_len,ani_alarm);

//start attack command end script or continue shooting 
if (round(ani_alarm) == 0){
    //for consecutive shots
    shot_count++;
    if (buffer){
        if (shot_count >= number){
            move_speed = 0;
            //reset shot count and go to next command
            comscript = argument[COMENDATTACK];
        }else{
            //so the script runs again.
            comscript = ceAttack;
        }
    } else {
        comscript = argument[COMENDATTACK];
    }
}

ani_alarm--;

