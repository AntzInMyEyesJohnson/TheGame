///ChampionSpecial(new_action1,new_action2,time_stop,time_slow,time_exception);
GetSpecialInput();
/*Can Prolly make special_power_up a globalvar and put this in controller objectSPECIAL MOVE UPGRADE*/
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
        if (!special and juice1_left > 0){
            special = true;
        } else {
            special = false;
        } 
    }      
}

//when champion runs out of special 'juice' (lol) then turn off special variable
if (juice1_left <= 0){
    special = false;
}

if (special == true){
    //subtract from champion special juice
    juice1_left -= 2/room_speed;
    //change the timer maxs' if applicable
    if (action1_timer != -1){action1_timer = argument[0];}
    if (action2_timer != -1){action2_timer = argument[1];}
    //manipulate time according to champion special arguments
    if (argument[2] == true){time_stop = argument[2];}
    if (argument[3] == true){time_slow = argument[3];}
    if (argument[4] == true){time_exception = argument[4];}
} else {
    //reset timer maxs'
    action1_timer = p_ray[curPly,ACT_T1];
    	action2_timer = p_ray[curPly,ACT_T2];
    //reset time variables
    time_stop = false;
    time_slow = false;
    time_exception = false;
}
