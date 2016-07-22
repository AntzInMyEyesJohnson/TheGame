/*
Unique -> can go into cover
Special -> deadeye time_stop
Action2 -> if enemy close stab execute and use as shield else lock on and strafe
Action1 -> stab execute
Attack2 -> revolvers with instant shot
Attack1 -> revolvers
*/
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

if ((_current_state == stateSPECIAL) or (special_keyp and special_power_up and juice_left > 0)){
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
    
if ((_current_state == stateACTION2) or (ability_keyp and ability_power_up and action2_timer >= action2_length)){ 
    if (_current_state != stateACTION2){//if (LoS_ToObject(obj_enemy_parent))
        var near = instance_nearest(x,y,obj_enemy_parent);
        if (near != noone){ 
            if (point_distance(x,y,near.x,near.y) <= 40){
                ActionInit(x,y,near.x,near.y,30,snd_gunslinger_stab);    
                state = stateACTION1;
                exit;
            } else {
                ActionInit(x,y,obj_near.x,obj_near.y,10,snd_gunslinger_lock);
                state = stateACTION2;
                exit;
            }
        } 
    }
}

if ((_current_state == stateACTION1) or (ability_keyp and action1_timer > action1_length)){
    if (_current_state != stateACTION1)
        ActionInit(x,y,obj_mouse.x,obj_mouse.y,60,snd_gunslinger_stab);    
    state = stateACTION1;
    exit;
}

if ((_current_state == stateATTACK) or (main_keyp and attack_alarm < 0)){
    if (_current_state != stateATTACK){
        if (weapon_power_up){
            AttackInit(obj_projectile_instant,.1,snd_gunslinger_attack2,8);
        } else {
            AttackInit(obj_projectile,.2,snd_gunslinger_attack1,6);
        }
    }
    state = stateATTACK;
    exit;
}

if (_current_state == stateFREE){
    state = stateFREE;
    exit;
}





