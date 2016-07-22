///PlayerHitByMelee
incoming_enemy_melee = instance_place(x,y,obj_enemy_projectile_melee);
if (instance_exists(incoming_enemy_melee)){
    if (incoming_enemy_melee.state == 'attack'){
        return true;
    } else {
        return false;
    }
} else {
    return false;
}
