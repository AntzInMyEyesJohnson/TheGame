///CombatPossibleWith();
var indexResult = -1;
var mindist = -1;
if (!ds_list_empty(obj_player.combatList)){
    for(var i = 0; i < ds_list_size(obj_player.combatList)-1;i++)
    {
        var dist = point_distance(obj_player.x,obj_player.y,obj_player.combatList[| i].x,obj_player.combatList[| i].y);
        if (mindist == -1 or dist < mindist){
            mindist = dist;
            indexResult = i;
        }
    }
}
Id = obj_player.combatList[| indexResult];
return Id;
