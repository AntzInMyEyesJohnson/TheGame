///FreeflowCheck(kills_required,radius,obj);
result = false;
if (kill_combo_count >= argument[0] && state != stateUNIQUE){
    var xx,yy,radius,obj,prec,notme,result;
    xx = x;
    yy = y;
    radius = argument[1];
    obj = argument[2];
    prec = false;
    notme = true;
    
    if (instance_exists(obj)){
        target_list = collision_circle_list(xx,yy,radius,obj,prec,notme);
        if (target_list != noone){
            for (var i = 0;i < ds_list_size(target_list);i++){
                if (target_list[| i].comscript != ceDeath and target_list[| i].comscript != ceDestroy and target_list[| i].comscript != ceDeathSpawn){
                    if (target_list[| i].comscript == ceChargeAttack or target_list[| i].comscript == ceAim or target_list[| i].comscript == ceAttack){
                        result = true;
                        if (ds_list_find_index(ff_list,target_list[| i]) == -1){
                            ds_list_add(ff_list,target_list[| i]);
                            ff_alarm = ff_alarm_set;
                        }
                    }
                }
            }
        }
        if (ds_exists(target_list,ds_type_list)){ds_list_destroy(target_list);}
    }
}

return result;

