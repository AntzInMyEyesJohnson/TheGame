///ceInitParry();
var result = false;
//set global var 'parried' to true so player knows hes being parried and exits if player is already being parried
if (parried){
    comscript = cePatrolArea;
    result = false;
} else {
    parried_enemy = self.id;
    parried = true;
    result = true;
}
//freeze screen a little less than when hit
if (hitby_dmg_type == obj_projectile_melee){
    global.screenfreeze = 5;
} else {
    global.screenfreeze = 3;
}

ani_alarm = alarm_len;
//play parry sound
PlaySound(snd_parry_deny,2,12,random_range(.9,1.1));

return result;
