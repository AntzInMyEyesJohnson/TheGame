///VikingSpecial();
GetSpecialInput();
/*###############SPECIAL MOVE UPGRADE*/
//check for the special move upgrade if not already upgraded
if (special_power_up == false and !ds_list_empty(attached_upgrades)){
    for(var i = 0;i < ds_list_size(attached_upgrades);i++){
        if (attached_upgrades[| i] == SPEC_MOVE){
            //if present then viking goes berserk
            special_power_up = true;
            break;
        }
    }
}

if (special_power_up == true){
    if (special_keyp){ 
        if (!berserk and berserk_juice_left >= berserk_juice_max){
            berserk = true;
        } else {
            berserk = false;
        } 
    }      
}

if (round(player_health) == 1){
    if (!berserk and berserk_juice_left >= berserk_juice_max){
        berserk = true;
    } 
}

//when gunslinger runs out of berserk 'juice' then turn off berserk variable
if (berserk_juice_left <= 0){
    berserk = false;
}

if (berserk == true){
    //subtract form gunslinger berserk juice
    berserk_juice_left -= 2/room_speed;
    //since gunslinger is the exception to the time stop
    time_exception = true;
    time_slow = true;
    //TODO create time warp bubble
    //##################
} else {
    //reset time variables
    time_exception = false;
    time_slow = false;
}
