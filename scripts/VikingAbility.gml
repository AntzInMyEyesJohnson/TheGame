///VikingAbility();
GetAbilityInput();
/*###############ABILITY UPGRADE*/
//check for the ability upgrade if not already upgraded
if (ability_power_up == false and !ds_list_empty(attached_upgrades)){
    for(var i = 0;i < ds_list_size(attached_upgrades);i++){
        if (attached_upgrades[| i] == ABILI_POW){
            //if present then bandit can assassinate
            ability_power_up = true;
            break;
        }
    }
}
if (ability_keyp){
    if (ability_power_up == true){
        if (last_deflect_timer >= between_deflect_time/3){
            //reset last deflect timer
            last_deflect_timer = 0;
            //reset shield health
            shield_health = 6;
            //TODO play bringing out shield sound
            //PlaySound(snd_gunslinger_main,1,choose(9,10,11),1);
            //set new state
            state = stateACTION2;
            //make sure there isn't already a shield
            if (!instance_exists(obj_shield)){
                //create shield object
                var shield = instance_create(x,y,obj_shield);
                shield.creator = self.id;
            }
        }
    }else{//ability_power_up == false
        if (last_shield_timer >= between_shield_time/2){
            //reset last shield timer
            last_shield_timer = 0;
            //reset shield health
            shield_health = 6;
            //TODO play bringing out shield sound
            //PlaySound(snd_gunslinger_main,1,choose(9,10,11),1);
            //set new state
            state = stateACTION1;
            //make sure there isn't already a shield
            if (!instance_exists(obj_shield)){
                //create shield object
                var shield = instance_create(x,y,obj_shield);
                shield.creator = self.id;
            }
        }
    }
}

