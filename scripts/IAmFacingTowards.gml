///IAmFacingTowards(thing);
var result = false;
var thing = argument[0];
//if we're actually looking at the thing
if (instance_exists(thing)) {
    direction_to_thing = point_direction(x,y,thing.x,thing.y);
    relative_direction_to_thing = abs(direction - direction_to_thing);
    half_field_of_view = 45;
    if (relative_direction_to_thing < half_field_of_view or
        relative_direction_to_thing > (360 - half_field_of_view)){
        result = true;
    }
}

return result;
