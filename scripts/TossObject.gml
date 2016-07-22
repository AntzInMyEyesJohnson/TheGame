///TossObject(sprite, image, number_of_bounces, [toss_dist], [toss_dir], [scale], [shadow_sprite],[rotating]);
with(instance_create(x, y, obj_projectile_arc)){
    if argument_count > 3{
        var toss_dist = argument[3];
        if argument_count > 4{
            var toss_dir = argument[4];
            if argument_count > 5{
                scale_factor = argument[5];
                if argument_count > 6{
                    shadow_sprite = argument[6];
                    if argument_count > 7{
                        rotating = argument[7];
                    }
                }
            }
        }
    }
    sprite_index = argument[0];
    image_index = argument[1]
    number_of_bounces = argument[2];
    target_x = x + lengthdir_x(toss_dist,toss_dir);
    target_y = y + lengthdir_y(toss_dist,toss_dir);  
}
