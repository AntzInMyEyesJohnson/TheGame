///CombatExit();
GetAbilityInput();
var result = false;
var dist_MtoM = point_distance(obj_mouse.x,obj_mouse.y,mouse_x,mouse_y);
if (ds_list_empty(obj_player.combatList) or dist_MtoM > 380 or combat_target == -1){
    result = true;    
}
return result;
