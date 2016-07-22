///GunslingerSpecial();
GetSpecialInput();
/*###############SPECIAL UPGRADE*/
//check for the ability upgrade if not already upgraded
if (special_power_up == false and !ds_list_empty(attached_upgrades)){
    for(var i = 0;i < ds_list_size(attached_upgrades);i++){
        if (attached_upgrades[| i] == SPEC_MOVE){
            //if present then gunslingers special slows time
            special_power_up = true;
            break;
        }
    }
}

//do power up time stop
if (special_power_up == true){
    if (special_keyp){ 
        if (!deadeye and deadeye_juice_left > 0){
            deadeye = true;
        } else {
            deadeye = false;
        } 
    }      
}

//when gunslinger runs out of deadeye 'juice' then turn off deadeye variable
if (deadeye_juice_left <= 0){
    deadeye_juice_left = 0;
    deadeye = false;
}

if (deadeye == true){
    //subtract form gunslinger deadeye juice
    deadeye_juice_left -= 2/room_speed;
    //since gunslinger is the exception to the time stop
    time_exception = true;
    time_stop = true;
    //TODO create time warp bubble
    //##################
} else {
    //reset time variables
    time_exception = false;
    time_stop = false;
}
