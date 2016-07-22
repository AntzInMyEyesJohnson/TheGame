//scr_instant_shot([direction]);
if argument_count > 0{
    var temp_dir = argument[0];
    var temp_x = x + lengthdir_x(2,temp_dir);
    var temp_y = y + lengthdir_y(2,temp_dir);
} else {
    var temp_dir = obj_player.current_dir + random_range(-obj_player.gun_stat[obj_player.gun_type,accuracy],obj_player.gun_stat[obj_player.gun_type,accuracy]);
    var temp_x = x + lengthdir_x(34,temp_dir);
    var temp_y = y + lengthdir_y(34,temp_dir);
}
var start_x = temp_x;
var start_y = temp_y;
var collision = (position_meeting(temp_x,temp_y,obj_solid) or position_meeting(temp_x,temp_y,obj_enemy));
while (!collision and point_distance(start_x,start_y,temp_x,temp_y) < room_width){
    temp_x += lengthdir_x(4,temp_dir);
    temp_y += lengthdir_y(4,temp_dir);
    collision = (position_meeting(temp_x,temp_y,obj_solid) or position_meeting(temp_x,temp_y,obj_enemy));
}
projectile = instance_create(temp_x,temp_y,obj_player_projectile);
projectile.start_x = start_x;
projectile.start_y = start_y;

with (projectile) {
    projectile_instant = true;
    projectile_damage = obj_player.player_damage+1;
    projectile_spr = obj_player.gun_stat[obj_player.gun_type,bullet_sprite];    
    projectile_knockback_power = global.player_knockback_power;   
}



