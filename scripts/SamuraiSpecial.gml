///SamuraiSpecial();
if (special_keyp){
    if (special_power_up and swords_juice_left > 0){
            //reset hspd and vspd
            hspd = 0;
            vspd = 0;
            //TODO play sound
            //###############
            //set state
            state = stateSPECIAL;
            exit;
    }
}
