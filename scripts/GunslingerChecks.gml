///GunslingerChecks(_current_state);
GetMovementInput();
GetMainInput();
GetAbilityInput();
GetSpecialInput();
GetPickUpInput();

var _current_state = argument[0];

if (_current_state == stateDEATH){
    state = stateDEATH;
    exit; 
}
    
if (_current_state == stateUNIQUE){
    state = stateUNIQUE;
    exit;
}

if ((_current_state == stateSPECIAL) or (special_keyp and special_power_up and juice1_left > 0)){
    state = stateSPECIAL;
    exit;
}

if ((_current_state == stateLOCKED) or (PlayerHitByProjectile(obj_enemy_projectile_special))){
    state = stateLOCKED;
    exit;
}

if ((_current_state == stateHIT) or (PlayerHitByProjectile())){
    state = stateHIT;
    exit;
}

//roll
if (_current_state == stateACTION1 or (ability_keyp and action1_timer > action1_length)){
    if (_current_state != stateACTION1){
        ActionInit(x,y,obj_mouse.x,obj_mouse.y,300,snd_dtest1);
    }
    state = stateACTION1;
    exit;
}

if (main_keyp and attack_alarm < 0){
    ani_atkcombo++;
    if (ani_atkcombo > ani_atknumber){ani_atkcombo = 0;}
    if (attack_power_up){
        AttackInit(obj_projectile_instant,.1,choose(snd_gunslinger_attack3,snd_gunslinger_attack4),6);
        CreateDebris(spr_gunslinger_main_bulletshell,false,irandom_range(4,7),image_angle+irandom_range(135,175),1);
    } else {
        AttackInit(obj_projectile_bullet,.2,choose(snd_gunslinger_attack1,snd_gunslinger_attack2),6);
        CreateDebris(spr_gunslinger_main_bulletshell,false,irandom_range(4,7),image_angle+irandom_range(135,175),1);
    }
    state = stateATTACK;
    exit;
}

if (_current_state == stateATTACK){
    state = stateATTACK;
    exit;
}
/*
if (ability_keyp and CombatReady()){
    if (CombatPossibleWith() != -1){
        combat_target = CombatPossibleWith();
        state = stateACTION1;
        exit;
    }
}*/

if (_current_state == stateFREE){
    state = stateFREE;
    exit;
}
