///EnemyHitState(sprite,blood_type,next_state);
sprite_index = argument[0];
var blood = argument[1];
var exit_state = argument[2];
if (hooked){
    if instance_exists(obj_player){
        hook_dir = point_direction(x,y,obj_player.x,obj_player.y);
    }
    hspd = lengthdir_x(hook_spd,hook_dir);
    vspd = lengthdir_y(hook_spd,hook_dir);
    img_spd = 0;
    image_index = 2;
    //increment hook spd after initilizing it to zero in enemy hit by projectile script
    if (hook_spd <= 4){
        hook_spd += 1;
    }
    if (!instance_exists(obj_projectile_special)){
        hooked = false;
        hit_timer = 2;
        move_speed = 40/room_speed;
        hspd = lengthdir_x(hook_spd,hook_dir-180);
        vspd = lengthdir_y(hook_spd,hook_dir-180);
    } else {
        exit;
    }
}
//decelerate
hspd *= decel;
vspd *= decel;
//move_speed determined when hit
img_spd = 0;
if (hit_timer == 0){
    hit_length = 20;
    //set image_index to purple hit index
    image_index = 0;
    hit_direction = point_direction(obj_player.x,obj_player.y,x,y);
    //init blood
    CreateParticle(blood,hit_direction,part_amount);
}else if (hit_timer == 1){
    //continue blood
    CreateParticle(blood,hit_direction,part_amount);
}
//set index to white index
if (hit_timer == 2){
    image_index = 1;
}        
//set index to hit index after white index
if (hit_timer == 3){
    image_index = 2;
}
//set index to hit index after white index
if (hit_timer == 12){
    image_index = 3;
}
//exit hit state
if (hit_timer >= hit_length){
    if (LoS_ToObject(obj_player)){
        ResetStateTimers();
        state = exit_state;
    } else {
        ResetStateTimers();
        state = 'idle';
    }
}
