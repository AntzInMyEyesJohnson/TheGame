///VikingChecks(current_state);
var current_state = argument[0];

GetMovementInput();
GetMainInput();
GetAbilityInput();
GetSpecialInput();
GetPickUpInput();

if (current_state == stateDEATH){
    state = stateDEATH;
    exit; 
}
    
if (current_state == stateUNIQUE or player_health == 1){
    if (juice1_left > 0){//berserk juice
        state = stateUNIQUE;
        exit;
    }
}

if ((special_keyp and special_power_up)){//just a shield to weapon swap
    state = stateSPECIAL;
    exit;
}

if (ability_keyc and weapon_number == 1 and ability_power_up and action2_timer >= action2_length){ 
    if (current_state != stateACTION2){
        ActionInit(x,y,obj_mouse.x,obj_mouse.y,16,snd_viking_draw_shield);
    }
    state = stateACTION2;
    exit;    
}

if ((ability_keyc and weapon_number == 1 and action1_timer > action1_length)){
    if (current_state != stateACTION1){
        ActionInit(x,y,obj_mouse.x,obj_mouse.y,16,snd_viking_draw_shield);
    }    
    state = stateACTION1;
    exit;
}

if ((current_state == stateHIT) or (PlayerHitByProjectile())){
    state = stateHIT;
    exit;
}

if (ability_keyc and weapon_number == 2 and ability_power_up and action2_timer >= action2_length){ 
    if (current_state != stateACTION2){
        ActionInit(x,y,obj_mouse.x,obj_mouse.y,16,snd_weapon_ax01);
    }
    state = stateACTION2;
    exit;    
}

if ((ability_keyc and weapon_number == 2 and action1_timer > action1_length)){
    if (current_state != stateACTION1){
        ActionInit(x,y,obj_mouse.x,obj_mouse.y,16,snd_weapon_ax01);
    }    
    state = stateACTION1;
    exit;
}

if ((current_state == stateATTACK) or (main_keyp and attack_alarm < 0)){
    if (current_state != stateATTACK)
        {AttackInit(obj_projectile_melee,.4,snd_weapon_ax01,10);}
    state = stateATTACK;
    exit;
}

if (current_state == stateFREE){
    state = stateFREE;
    exit;
}
