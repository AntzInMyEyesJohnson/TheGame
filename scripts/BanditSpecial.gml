///BanditSpecial();
GetSpecialInput();
/*###############SPECIAL MOVE UPGRADE*/
//check for the special move upgrade if not already upgraded
if (special_power_up == false and !ds_list_empty(attached_upgrades)){
    for(var i = 0;i < ds_list_size(attached_upgrades);i++){
        if (attached_upgrades[| i] == SPEC_MOVE){
            //if present then bandit can assassinate
            special_power_up = true;
            break;
        }
    }
}

if (special_power_up == true){
    if (special_keyp){ 
        if (!shadow and shadow_juice_left > 0){
            shadow = true;
        } else {
            shadow = false;
        } 
    }      
}

//when gunslinger runs out of shadow 'juice' then turn off shadow variable
if (shadow_juice_left <= 0){
    shadow = false;
}

if (shadow == true){
    //subtract form gunslinger shadow juice
    shadow_juice_left -= 2/room_speed;
    //lower the assassination and teleport delays
    between_assassinate_time = .1;
    between_teleport_time = .2;
    //since gunslinger is the exception to the time stop
    time_exception = false;
    time_slow = true;
    //TODO create time warp bubble
    //##################
} else {
    //reset the assassination and teleport delays
    between_assassinate_time = .4;
    between_teleport_time = .5;
    //reset time variables
    time_exception = false;
    time_slow = false;
}
