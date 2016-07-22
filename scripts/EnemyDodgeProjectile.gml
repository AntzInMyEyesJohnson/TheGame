///EnemyDodgeProjectile();
projectile_in_range = collision_circle(x,y,120,obj_projectile_parent,false,true);
if (projectile_in_range != noone and dodge_cycle < 1){
    if (state != 'death' and state != 'dodge'){
        //dodge state init
        dodge_direction = point_direction(x,y,projectile_in_range.x,projectile_in_range.y);
        dodge_timer = 0;
        move_speed = 200/room_speed;
        state = 'dodge';
    }
}



