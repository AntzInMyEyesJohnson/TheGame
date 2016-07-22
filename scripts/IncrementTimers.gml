///IncrementTimers();
//gunslinger
if (lockon_juice_left >= lockon_juice_max) {
    lockon_juice_left = lockon_juice_max;
} else {
    lockon_juice_left += 1/room_speed;
}
if (deadeye_juice_left >= deadeye_juice_max) {
    deadeye_juice_left = deadeye_juice_max;
} else {
    deadeye_juice_left += 1/room_speed;
}
//samurai
/*
last_charge_timer += 1/room_speed;
if (swords_juice_left >= swords_juice_max) {
    swords_juice_left = swords_juice_max;
} else {
    if (state != stateSPECIAL){
        swords_juice_left += 1/room_speed;
    }
}
*/
//wizard
last_gravity_timer += 1/room_speed;
//bandit
last_teleport_timer += 1/room_speed;
last_assassinate_timer += 1/room_speed;
if (shadow_juice_left >= shadow_juice_max) {
    shadow_juice_left = shadow_juice_max;
} else {
    shadow_juice_left += 1/room_speed;
}
//viking
/*
if (shield_juice_left >= shield_juice_max) {
    shield_juice_left = shield_juice_max;
} else {
    shield_juice_left += 1/room_speed;
}
if (berserk_juice_left >= berserk_juice_max) {
    berserk_juice_left = berserk_juice_max;
} else {
    berserk_juice_left += 1/room_speed;
}
last_shield_timer += 1/room_speed;
last_deflect_timer += 1/room_speed;
*/
//all
//action1_alarm--;
if (juice1_left >= juice1_max) {
    juice1_left = juice1_max;
} else {
    if (state != stateSPECIAL){
        juice1_left += 1/room_speed;
    }
}
if (juice2_max > 0){
    if (juice2_left >= juice2_max) {
        juice2_left = juice2_max;
    } else {
        if (state != stateSPECIAL){
            juice2_left += 1/room_speed;
        }
    }
}
//hit state
hit_timer += 1/room_speed;


//death state
if (state == stateDEATH){
    if (death_alarm > 0){
        death_alarm--;
    }
}

if (attack_alarm >= 0){
    attack_alarm--;
}
action1_timer += 1;
action2_timer += 1;
locked_timer += 1;
ff_timer += 1;

