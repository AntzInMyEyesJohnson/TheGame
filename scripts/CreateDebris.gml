///CreateDebris(sprite, bouncing, [bounce_dist], [bounce_dir], [scale], [shadow_sprite],[rotate],[spray_blood]);
var n = sprite_get_number(argument[0]);
for (var i = 0; i < n; i++;){
with(instance_create(x, y, obj_debris)){
    if argument_count > 2{
        var bounce_dist = argument[2] + random(argument[2]);
        if argument_count > 3{
            var bounce_dir = argument[3];
            if argument_count > 4{
                scale_factor = argument[4];
                if argument_count > 5{
                    shadow_sprite = argument[5];
                    if argument_count > 6{
                        rotate = argument[6];
                        if argument_count > 7{
                        spray_blood = argument[7];
                    }
                    }
                }
            }
        }
    }
    sprite_index = argument[0];
    bouncing = argument[1];
    if (bouncing){
        target_x = x + lengthdir_x(bounce_dist,bounce_dir);
        target_y = y + lengthdir_y(bounce_dist,bounce_dir);
    } else {
        hspeed = lengthdir_x(bounce_dist,bounce_dir);
        vspeed = lengthdir_y(bounce_dist,bounce_dir);
    }      
    image_index = i;
}
}
