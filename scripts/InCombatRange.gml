///InCombatRange(range);
var range = 160;
if (argument_count > 0){
    range = argument[0];
}

if (instance_exists(obj_player)) {
    if (point_distance(x,y,obj_player.x,obj_player.y) <= range){
        if (ds_list_find_index(obj_player.combatList,id) == -1){
            ds_list_add(obj_player.combatList,id);
        }
    } else {
        while (ds_list_find_index(obj_player.combatList,id) != -1){
            ds_list_delete(obj_player.combatList,ds_list_find_index(obj_player.combatList,id));
        }
    }
}
