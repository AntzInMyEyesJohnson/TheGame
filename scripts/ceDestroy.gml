///ceDestroy();

//####will eventually siphon out####
//state = 'death';
/*
//check if the calling object should be printed to a surface before destroying itself
if (destroy_to_surface){
    surface_set_target(surf);
    draw_sprite_ext(sprite_index,image_index,x,y,sign(image_xscale)*scale_factor,sign(image_yscale)*scale_factor,0,c_ltgray,1);
    surface_reset_target();
}

//destroy any lists if they exist
if (ds_exists(hitby_list,ds_type_list)){
    ds_list_destroy(hitby_list);
}
*/

instance_destroy();
