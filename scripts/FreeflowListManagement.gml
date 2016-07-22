///FreeflowListManagement();
if (round(ff_alarm) == 0){
    ds_list_clear(ff_list);
}
//countdown the free flow alarm
if (ff_alarm >= 0){ff_alarm--;}

//if enemies are in their charge or aim coms and in the free flow list (aka free flow list is not empty)
if (!ds_list_empty(ff_list)){
    //cycle through the free flow list
    for(var i = 0;i < ds_list_size(ff_list);i++){
        //delete enemy from list if they die or don't exist
        if (!instance_exists(ff_list[| i]) || ff_list[| i].comscript == ceDeath || ff_list[| i].comscript == ceDestroy || ff_list[| i].comscript == ceDeathSpawn){
            ds_list_delete(ff_list,ds_list_find_index(ff_list,ff_list[| i]));
        }
    }
}
