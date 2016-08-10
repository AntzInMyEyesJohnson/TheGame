///CombatReady();
var result = false;
if (!ds_list_empty(obj_player.combatList)){
    result = true;
    /*
    for(var i = 0; i < ds_list_size(obj_player.combatList)-1;i++)
    {
        var dist_OtoM = point_distance(obj_player.combatList[| i].x,obj_player.combatList[| i].y,obj_mouse.x,obj_mouse.y);
        if (dist_OtoM <= 80){
            result = true;
        }
    }
    */
}
return result;
