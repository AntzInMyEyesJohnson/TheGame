///ceVulnerable();

//perform projectile and player checks
checkType = H;

//slow down
if (hspd != 0 or vspd != 0){
    hspd *= decel;
    vspd *= decel;
}

// set time spent vulnerable, create effects, and set type of vulnerability
if (ani_alarm <= -1){
    alarm_len = 120;
    ani_alarm = alarm_len;
    var vuln_effect = instance_create(x,y,obj_effect_vuln);
    vuln_effect.creator = self.id;
    vuln_effect.effect_type = vuln_type;
}

sprite_index = ani_vulnerable;
image_index = AnimateToAlarm(alarm_len,ani_alarm);

//start end command if being vulnerable alarm is over  
if (round(ani_alarm) == 0){
    //next command
    comscript = argument[COMENDVULN];
}

ani_alarm--

