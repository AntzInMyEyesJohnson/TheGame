///SamuraiChecks(current_state);
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
    
if (current_state == stateUNIQUE){
    state = stateUNIQUE;
    exit;
}

if (current_state == stateLOCKED or PlayerHitByProjectile(obj_enemy_projectile_special)){
    state = stateLOCKED;
    exit;
}
        
if (FreeflowCheck(kills_required,300, obj_enemy_parent))
{
    if (FreeflowAbility() == ffMAIN and main_keyp)
    {
        ff_alarm = ff_alarm_set;
        ff_type = ffMAIN;
        ff_timer = 0;
        state = stateUNIQUE;
        exit;
    }
    if (FreeflowAbility() == ffABIL and ability_keyp)
    {
        ff_alarm = ff_alarm_set;
        ff_type = ffABIL;
        ff_timer = 0;
        state = stateUNIQUE;
        exit;
    }
}

if (special_keyp and special_power_up and juice1_left > 0){
    if (current_state != stateSPECIAL){
        ThousandSwordsInit(40,175,100);
        state = stateSPECIAL;
        exit;
    } else {//so it toggles
        state = stateFREE;
        exit;
    }
}

if ((current_state == stateSPECIAL)){
    state = stateSPECIAL;
    exit;
}

if ((current_state == stateHIT) or (PlayerHitByProjectile())){
    state = stateHIT;
    exit;
}
    
if ((current_state == stateACTION2) or (ability_keyp and ability_power_up)){ 
    if (current_state != stateACTION2 and action2_timer >= action2_length){
        ActionInit(x,y,obj_mouse.x,obj_mouse.y,20,snd_weapon_katana2);
    }
    state = stateACTION2;
    exit;    
}

if (current_state == stateACTION1 and ability_keyp and can_combo){
    action_combo++;
    action_combo = clamp(action_combo,0,5);
    ActionInit(x,y,obj_mouse.x,obj_mouse.y,24,snd_dtest1);
    state = stateACTION1;
    exit;
}

if ((current_state == stateACTION1) or (ability_keyp)){
    if (current_state != stateACTION1){
        if(action1_timer > action1_length){
            action_combo = 0;
            ActionInit(x,y,obj_mouse.x,obj_mouse.y,24,snd_dtest1);
        }
    }
    state = stateACTION1;
    exit;
}

if (main_keyp and (attack_alarm < 0 or (stateATTACK and attack_alarm <= (attack_length-10)))){//12 = .2*60;
    AttackInit(obj_projectile_melee,.4,snd_samurai_attack,10);
    ani_atkcombo = SetAttackAnimation(current_state);    
    state = stateATTACK;
    exit;
}

if (current_state == stateATTACK){
    state = stateATTACK;
    exit;
}

if (current_state == stateFREE){
    state = stateFREE;
    exit;
}

/*
if (state == stateDEATH)
    exit;

if (state == stateFREE)
    state = stateFREE;

if ((state == stateACTION1) or (ability_keyp and action1_timer > action1_length))
{
    if (state != stateACTION1)
        {ActionInit(x,y,obj_mouse.x,obj_mouse.y,16,snd_samurai_dash);}    
    state = stateACTION1;
}
    
if ((state == stateATTACK) or (main_keyp and attack_alarm < 0))
{
    if (state != stateATTACK)
        {AttackInit(obj_projectile_melee,.4,snd_weapon_katana1,10);}
    state = stateATTACK;
}

if ((state == stateACTION2) or (ability_keyp and ability_power_up and action2_timer >= action2_length))
{ 
    if (ObjectInPath(x,y,obj_mouse.x,obj_mouse.y,10,obj_enemy_parent) and range_finder(x,y,obj_mouse.x,obj_mouse.y,200,obj_enemy_parent,false,true) <= 110)
    {
        ActionInit(x,y,obj_mouse.x,obj_mouse.y,16,snd_weapon_katana2);
        state = stateACTION2;
    }
}
    
if ((state == stateHIT) or (PlayerHitByProjectile()))
    state = stateHIT;

if ((state == stateSPECIAL) or (special_keyp and special_power_up and juice1_left > 0))
    state = stateSPECIAL;

if (state == stateUNIQUE)
    return stateUNIQUE;
    
if (FreeflowCheck(4,300, obj_enemy_parent))
{
    if (FreeflowAbility() == ffMAIN and main_keyp)
    {
        ff_alarm = ff_alarm_set;
        ff_type = ffMAIN;
        ff_timer = 0;
        state = stateUNIQUE;
    }
    if (FreeflowAbility() == ffABIL and ability_keyp)
    {
        ff_alarm = ff_alarm_set;
        ff_type = ffABIL;
        ff_timer = 0;
        state = stateUNIQUE;
    }
}

return state;
