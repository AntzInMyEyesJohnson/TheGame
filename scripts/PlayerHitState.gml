///PlayerHitState();    
if (hit_timer == 0){
    hspd += incoming_khspd;
    vspd += incoming_kvspd;
    player_health -= incoming_damage;
    //subtract from combo alarm quicker if hit
    if (kill_combo_alarm > 0){kill_combo_alarm -= round(kill_combo_alarm/2);}
    hit_length = .15;
}
if (player_health <= 0){
    state = stateDEATH;
}
if (hit_timer > hit_length){
    state = stateFREE;
}
