///ceChargeAttack();
var ch_length;
ch_length = argument[VARCHARLENGTH];
//perform projectile and player checks
checkType = H;

//slow down
if (hspd != 0 or vspd != 0){
    hspd *= decel;
    vspd *= decel;
}

//set charging alarm length and start animation alarm
if (ani_alarm <= -1){
    alarm_len = irandom_range(ch_length-5,ch_length+5);
    ani_alarm = alarm_len;
}

if (ani_alarm == round(alarm_len/2)){
    comscript = ceAim;
    ani_alarm--;//so that it doesnt aim again after returning from aiming 
}

//sprite change and use script to animate with respect to the time left in the alarm
sprite_index = ani_charge;
image_index = AnimateToAlarm(alarm_len,ani_alarm);

//attack the player when 
if (round(ani_alarm) == 0){
    hspd *= .1;
    vspd *= .1;
    comscript = ceAttack;
}

ani_alarm--;
