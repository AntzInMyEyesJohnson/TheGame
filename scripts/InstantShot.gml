///InstantShot();

var temp_dir = accuracy;
var temp_x = x;
var temp_y = y;
var start_x = temp_x;
var start_y = temp_y;
var enemy_collision = instance_position(temp_x,temp_y,obj_enemy_parent);
var wall_collision = grid_place_meeting(temp_x,temp_y,0);
while (!wall_collision and (enemy_collision == noone or (enemy_collision != noone and (enemy_collision.comscript == ceDeath or enemy_collision.comscript == ceDestroy)))and point_distance(start_x,start_y,temp_x,temp_y) < room_width){
    temp_x += lengthdir_x(4,temp_dir);
    temp_y += lengthdir_y(4,temp_dir);
    wall_collision = grid_place_meeting(temp_x,temp_y,0);
    enemy_collision = instance_position(temp_x,temp_y,obj_enemy_parent);
}
var projectile = instance_create(temp_x,temp_y,obj_projectile_instant);
projectile.creator = creator;
projectile.line_start_x = start_x;
projectile.line_start_y = start_y;
projectile.instant = false;
projectile.damage = damage;


