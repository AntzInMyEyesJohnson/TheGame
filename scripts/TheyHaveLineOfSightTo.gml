///TheyHaveLineOfSightTo(they_object,sight_to_object);
they_object = argument[0];
sight_to_object = argument[1];
result = false;

if (instance_exists(they_object) and instance_exists(sight_to_object)) {
    if (collision_line(they_object.x,they_object.y,sight_to_object.x,sight_to_object.y,obj_wall,true,true) == noone){
        result = true;
    }
}

return result;
