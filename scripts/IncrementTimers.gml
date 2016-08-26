///IncrementTimers();

//alarms
if (attack_alarm >= 0){attack_alarm--;}
if (ani_alarm >= 0){ani_alarm--;}
if(ani_atkwindow >= 0){ani_atkwindow--;}
if (death_alarm >= 0){death_alarm--;}

//timers
hit_timer += 1/room_speed;
action1_timer += 1;
action2_timer += 1;
locked_timer += 1;
ff_timer += 1;

//juice
if (state != stateSPECIAL){
    if (juice1_left >= juice1_max) {
        juice1_left = juice1_max;
    } else {
        juice1_left += 1/room_speed;
    }
} else {
    if juice1_left > 0 {
        juice1_left -= 1/room_speed;
    } else {
        juice1_left = 0;
    }
}
if (state != stateSPECIAL){
    if (juice2_left >= juice2_max) {
        juice2_left = juice2_max;
    } else {
        juice2_left += 1/room_speed;
    }
} else {
    if juice2_left > 0 {
        juice2_left -= 1/room_speed;
    } else {
        juice2_left = 0;
    }
}
