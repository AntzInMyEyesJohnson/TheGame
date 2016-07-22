///ReactCheck();

//returns whether a projectile is in range to dodge/parry/block/deflect
var result = false;

if (react_count > 0){
    if (!parried){
        //cycle through nearest projectiles and record their direction,relative direction, and dist.
        for(var i = 0; i < instance_number(obj_projectile_parent);i++){
            incoming_player_projectile = instance_nth_nearest(x,y,obj_projectile_parent,i);
            var proj_travel_dir = point_direction(0,0,incoming_player_projectile.hspd,incoming_player_projectile.vspd);
            var proj_to_me_dir = point_direction(incoming_player_projectile.x,incoming_player_projectile.y,x,y);
            var proj_to_me_dist = point_distance(x,y,incoming_player_projectile.x,incoming_player_projectile.y);
            //when the bullet is traveling towards us and has not already hit us
            if ((proj_travel_dir == median(proj_to_me_dir-25,proj_travel_dir,proj_to_me_dir+25) and proj_to_me_dist <= 60) or 
                (instance_place(x,y,incoming_player_projectile) and distance_to_object(player) <= 25)){
                //get the type of projectile about to hit us
                hitby_dmg_type = incoming_player_projectile.object_index;
                //set dest direction to the direction of the projectile relative to us.
                destdir = proj_to_me_dir;
                //subtract from react counter
                react_count--;
                //reset ani alarm for the dodge in case it isnt at -1
                ani_alarm = -1;
                //slow down to a stop
                hspd = 0;
                vspd = 0;
                result = true;
                break;
            }
        }
    }
}

return result;

/*
//returns whether a projectile is in range to dodge/parry/block/deflect
var result = false;

if (!parried){
    //cycle through nearest projectiles and record their direction,relative direction, and dist.
    for(var i = 0; i < instance_number(obj_projectile_parent);i++){
        incoming_player_projectile = instance_nth_nearest(x,y,obj_projectile_parent,i);
        var proj_travel_dir = point_direction(0,0,incoming_player_projectile.hspd,incoming_player_projectile.vspd);
        var proj_to_me_dir = point_direction(incoming_player_projectile.x,incoming_player_projectile.y,x,y);
        var proj_to_me_dist = point_distance(x,y,incoming_player_projectile.x,incoming_player_projectile.y);
        //when the bullet is traveling towards us and has not already hit us
        if ((proj_travel_dir == median(proj_to_me_dir-25,proj_travel_dir,proj_to_me_dir+25) and proj_to_me_dist <= 60) or (instance_place(x,y,incoming_player_projectile) and distance_to_object(player) <= 50)){
            //get the type of projectile about to hit us
            hitby_dmg_type = incoming_player_projectile.object_index;
            //set dest direction to the direction of the projectile relative to us.
            destdir = proj_to_me_dir;
            result = true;
            break;
        }
    }
}

return result;
