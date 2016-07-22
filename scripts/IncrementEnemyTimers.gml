///IncrementEnemyTimers();
if (time_stop and !time_exception){
    if (state == 'idle') {idle_timer++;}
    if (state == 'wander') {wander_timer++;}
    if (state == 'chase') {chase_timer++;}
    if (state == 'alert') {alert_timer++;}
    if (state == 'dodge') {dodge_timer++;}
    if (state == 'hit') {hit_timer++;}
    if (attack_alarm >= 0){
        if (attack_alarm == round(attack_alarm_time-1)){
            attack_alarm--;
        } else {
            attack_alarm-=0.1;
        }
    }
    if (charge_alarm >= 0){charge_alarm-=0.1;}
    if (bounce_alarm >= 0){bounce_alarm--;}
    if (teleport_alarm >= 0){
        if (teleport_alarm == round(teleport_alarm_time/2)){
            teleport_alarm--;
        }else{
            teleport_alarm-=0.1;
        }
    }
    if (death_alarm >= 0){death_alarm--;}
}else if (time_slow and !time_exception){
    if (state == 'idle') {idle_timer++;}
    if (state == 'wander') {wander_timer++;}
    if (state == 'chase') {chase_timer++;}
    if (state == 'alert') {alert_timer++;}
    if (state == 'dodge') {dodge_timer++;}
    if (state == 'hit') {hit_timer++;}
    if (attack_alarm >= 0){
        if (attack_alarm == round(attack_alarm_time-1)){
            attack_alarm--;
        } else {
            attack_alarm-=0.5;
        }
    }
    if (charge_alarm >= 0){charge_alarm-=0.5;}
    if (bounce_alarm >= 0){bounce_alarm--;}
    if (teleport_alarm >= 0){
        if (teleport_alarm == round(teleport_alarm_time/2)){
            teleport_alarm--;
        }else{
            teleport_alarm-=0.5;
        }
    }
    if (death_alarm >= 0){death_alarm--;}
}else {
    if (state == 'idle') {idle_timer++;}
    if (state == 'wander') {wander_timer++;}
    if (state == 'chase') {chase_timer++;}
    if (state == 'alert') {alert_timer++;}
    if (state == 'dodge') {dodge_timer++;}
    if (state == 'hit') {hit_timer++;}
    if (attack_alarm >= 0){attack_alarm--;}
    if (charge_alarm >= 0){charge_alarm--;}
    if (bounce_alarm >= 0){bounce_alarm--;}
    if (teleport_alarm >= 0){teleport_alarm--;}
    if (death_alarm >= 0){death_alarm--;}
}



