///SamuraiChecks(_current_state);
var _current_state = argument[0];

GetMovementInput();
GetMainInput();
GetAbilityInput();
GetSpecialInput();
GetPickUpInput();

if (_current_state == stateDEATH){
    state = stateDEATH;
    exit;
}
    
if (_current_state == stateUNIQUE){
    state = stateUNIQUE;
    exit;
}
        
if (FreeflowCheck(kills_required,300, obj_enemy_parent))
{
    if (FreeflowAbility() == ffMAIN and main_keyp)
    {
        ff_alarm = ff_alarm_set;
        ff_type = ffMAIN;
        ff_timer = -4;
        state = stateUNIQUE;
        exit;
    }
    if (FreeflowAbility() == ffABIL and ability_keyp)
    {
        ff_alarm = ff_alarm_set;
        ff_type = ffABIL;
        ff_timer = -4;
        state = stateUNIQUE;
        exit;
    }
}

if (special_keyp and special_power_up and juice1_left > 0){
    if (_current_state != stateSPECIAL){
        ThousandSwordsInit(110,view_wview,view_hview);
        state = stateSPECIAL;
        exit;
    } else {//so it toggles
        state = stateFREE;
        exit;
    }
}

if ((_current_state == stateSPECIAL)){
    state = stateSPECIAL;
    exit;
}

if (_current_state == stateLOCKED or PlayerHitByProjectile(obj_enemy_projectile_special)){
    state = stateLOCKED;
    exit;
}

if ((_current_state == stateHIT) or (PlayerHitByProjectile())){
    state = stateHIT;
    exit;
}
    
if ((_current_state == stateACTION2) or (ability_keyp and ability_power_up)){ 
    if (_current_state != stateACTION2 and action2_timer >= action2_length){
        ActionInit(x,y,obj_mouse.x,obj_mouse.y,22,snd_weapon_katana2);
    }
    state = stateACTION2;
    exit;    
}

if (_current_state == stateACTION1 and ability_keyp and can_combo){
    action_combo++;
    action_combo = clamp(action_combo,0,5);
    ActionInit(x,y,obj_mouse.x,obj_mouse.y,22,snd_dtest1);
    state = stateACTION1;
    exit;
}

if ((_current_state == stateACTION1) or (ability_keyp)){
    if (_current_state != stateACTION1){
        if(action1_timer > action1_length){
            action_combo = 0;
            ActionInit(x,y,obj_mouse.x,obj_mouse.y,22,snd_dtest1);
        }
    }
    state = stateACTION1;
    exit;
}

if (main_keyp and (attack_alarm < 0 or (_current_state == stateATTACK and attack_alarm <= (round(attack_length/2))))){//12 = .2*60;
    AttackInit(obj_projectile_melee,.4,10,snd_samurai_attack);
    ani_atkcombo = SetAttackAnimation(_current_state);    
    state = stateATTACK;
    exit;
}

if (_current_state == stateATTACK){
    state = stateATTACK;
    exit;
}

if (_current_state == stateFREE){
    state = stateFREE;
    exit;
}
