///PlayerHitByProjectile(incoming_projectile_type);
if (argument_count >= 1){
    var projectile_incoming = argument[0];
} else {
    var projectile_incoming = obj_enemy_projectile_parent;
}
var result = false;
incoming_enemy_projectile = instance_place(x,y,projectile_incoming);
if (incoming_enemy_projectile != noone){
    if (ds_list_find_index(hitby_list,incoming_enemy_projectile) == -1){
        ds_list_add(hitby_list,incoming_enemy_projectile);
        hitby_list_timer = room_speed*10;
        //set incoming variables so there is no 'object not found' errors
        incoming_khspd = incoming_enemy_projectile.hspd;
        incoming_kvspd = incoming_enemy_projectile.vspd;
        incoming_damage = incoming_enemy_projectile.damage;
        incoming_creator = incoming_enemy_projectile.creator;
        hit_timer = 0;
        locked_timer = 0;
        locked_length = incoming_enemy_projectile.se_duration;
        result = true;
    }
} 

return result
