///FreeflowAbility();

var mo_dir,tg_dir,ff_dir90,result;

result = ffFALSE;
mo_dir = point_direction(x,y,obj_mouse.x,obj_mouse.y);
if (!ds_list_empty(ff_list)){
    for(var i = 0;i < ds_list_size(ff_list);i++){
        if (instance_exists(ff_list[| i])){
            tg_dir = point_direction(x,y,ff_list[| i].x,ff_list[| i].y);
        }
        if (mo_dir == median(tg_dir-10,tg_dir+10,mo_dir)){
            if(ff_list[| i].comscript != ceDeath and ff_list[| i].comscript != ceDestroy and ff_list[| i].comscript != ceDeathSpawn){
                ff_target = ff_list[| i];
                ff_dir = point_direction(x,y,ff_target.x,ff_target.y);
                ff_dir90 = round(ff_dir/90);
                ff_dist = point_distance(x,y,ff_target.x,ff_target.y);
                result = ff_target.eff_type;
                break;
            }
        }
    }
}

return result;
/*
if (ff_target != noone){
    if (mo_dir == median(ff_dir-35,ff_dir+35,mo_dir)){
        if (ff_target.eff_type == ffMAIN){
            if (main_keyp){
                ff_alarm = ff_alarm_set;
                ff_type = ffMAIN;
                ff_timer = 0;
                state = stateUNIQUE;
                exit;
            }
        }
        if (ff_target.eff_type == ffABIL){
            if (ability_keyp){
                ff_alarm = ff_alarm_set;
                ff_type = ffABIL;
                ff_timer = 0;
                state = stateUNIQUE;
                exit;
            }
        }
        if (ff_target.eff_type == ffDIRM and ff_dir90 == 2){
            if (left_keyc){
                if (main_keyp){
                    ff_alarm = ff_alarm_set;
                    ff_type = ffLTAB;
                    ff_timer = 0;
                    state = stateUNIQUE;
                    exit;
                }
            }
        } 
        if (ff_target.eff_type == ffDIRM and (ff_dir90 == 0 or ff_dir90 == 4)){
            if (right_keyc){
                if (main_keyp){
                    ff_alarm = ff_alarm_set;
                    ff_type = ffRTAB;
                    ff_timer = 0;
                    state = stateUNIQUE;
                    exit;
                }
            }
        }
        if (ff_target.eff_type == ffDIRM and ff_dir90 == 1){
            if (up_keyc){
                if (main_keyp){
                    ff_alarm = ff_alarm_set;
                    ff_type = ffUTAB;
                    ff_timer = 0;
                    state = stateUNIQUE;
                    exit;
                }
            }
        }
        if (ff_target.eff_type == ffDIRM and ff_dir90 == 3){
            if (down_keyc){
                if (main_keyp){
                    ff_alarm = ff_alarm_set;
                    ff_type = ffDTAB;
                    ff_timer = 0;
                    state = stateUNIQUE;
                    exit;
                }
            }
        }
        if (ff_target.eff_type == ffSPMA){
            //if (special == true){
            if (special_keyc == true){
                if (main_keyp){
                    ff_alarm = ff_alarm_set;
                    ff_type = ffSPMA;
                    ff_timer = 0;
                    state = stateUNIQUE;
                    exit;
                }
            }
        }
        if (ff_target.eff_type == ffSPAB){
            //if (special == true){
            if (special_keyc == true){
                if (ability_keyp){
                    ff_alarm = ff_alarm_set;
                    ff_type = ffSPAB;
                    ff_timer = 0;
                    state = stateUNIQUE;
                    exit;
                }
            }
        }
    }
}
