///GunslingerAbility();
GetAbilityInput();
GetMainInput();
/*###############ABILITY UPGRADE*/
//check for the ability upgrade if not already upgraded
if (ability_power_up == false and !ds_list_empty(attached_upgrades)){
    for(var i = 0;i < ds_list_size(attached_upgrades);i++){
        if (attached_upgrades[| i] == ABILI_POW){
            //if present then gunslingers special slows time
            ability_power_up = true;
            break;
        }
    }
}

if (ability_keyp)
{
    //turn on lock on ability when it is not already in use.
    if (!lockedon){
        lockedon = true;   
    } 
} 

//because revolver mouse will only follow the lockedon enemy while gunslinger in lockedon mode
if (lockedon_off_delay >= 0){
    if (lockedon_off_delay == 0){
        lockedon = false;
    }
    lockedon_off_delay--;
}
if (lockedon){
    if (main_keyp){
        //if (lockedon_off_delay < 0){
            lockedon_off_delay = 20;//half a second
        //}
    }
    //TODO play 'lockedon sound
    //##################
    //TODO create 'lockedon' effects like closing bullseye
    //##################   
} 
