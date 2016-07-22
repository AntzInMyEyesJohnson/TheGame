///ObjectInPath(xx1, yy1, xx2, yy2, width, thing);
var xx1, yy1, xx2, yy2, dir, lwx, lwy, rwx, rwy, thing, death_check, dsid, result;
xx1 = argument[0];
yy1 = argument[1];
xx2 = argument[2];
yy2 = argument[3];
dir = point_direction(xx1,yy1,xx2,yy2);
lwx = lengthdir_x(argument[4]/2,dir-90);
lwy = lengthdir_y(argument[4]/2,dir-90);
rwx = lengthdir_x(argument[4]/2,dir+90);
rwy = lengthdir_y(argument[4]/2,dir+90);
thing = argument[5];
death_check = false;
if (thing == obj_enemy_parent){death_check = true;}
dsid = collision_rectangle_list(xx1+lwx,yy1+lwy,xx2+rwx,yy2+rwy,thing,false,true);
result = false;

if (ds_exists(dsid,ds_type_list)){
    if (ds_list_empty(dsid)){
        result = false;
    } else {
        if (death_check == true){
            //they are all dead and for loop never is true
            result = false;
            for(var i = 0; i < ds_list_size(dsid);i++){
                if (dsid[| i].comscript != ceDeath and dsid[| i].comscript != ceDestroy and dsid[| i].comscript != ceDeathSpawn){
                    result = true;
                }
            }
        } else {
            result = true;
        }
    }
    ds_list_destroy(dsid);
    return result;
}

return result;
