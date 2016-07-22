///PlayerLockedState();
if (locked_timer == 0){
    time_stop = true;
    time_exception = true;
    hspd = incoming_khspd;
    vspd = incoming_kvspd;
    player_health -= incoming_damage;
    //subtract from combo alarm quicker if hit
    if (kill_combo_alarm > 0){kill_combo_alarm -= round(kill_combo_alarm/2);}
}

if (locked_timer >= locked_length){
    time_stop = false;
    time_slow = false;
    time_exception = false;
    if (player_health <= 0){
        state = stateDEATH;
        exit;
    }
    
    if (keyboard_check_pressed(vk_anykey) or mouse_check_button_pressed(mb_any)){
        hspd = 0;
        vspd = 0;
        state = stateFREE;
    }
}

/*
PlayerHeavyMovement(6);
time_stop = true;
time_exception = true;
if (instance_exists(parried_enemy)){
    var pdir = point_direction(parried_enemy.x,parried_enemy.y,x,y);
    if (parried_push == true){
        hspd = lengthdir_x(move_speed*2,pdir);
        vspd = lengthdir_y(move_speed*2,pdir);
    }
    if (round(pdir/180) == 1){
        img_xsc = -1;
    }else {
        img_xsc = 1;
    }
}

if (!parried){
    time_stop = false;
    time_exception = false;
    parried_click_count = 0;
    parried_push = false;
    state = stateFREE;
}
