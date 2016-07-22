///scr_part_warpring_init_dir(direction);
//initialize our global warpring particle
global.pt_warpring = part_type_create();
var pt = global.pt_warpring;

//warpring particle settings
part_type_shape(pt,pt_shape_ring);
part_type_size(pt,0,0,.01,0);
part_type_scale(pt,.6,.3);
part_type_color3(pt,c_white,c_white,c_ltgray);
part_type_alpha2(pt,.7,.3);
part_type_speed(pt,.1,1,0,0);
part_type_direction(pt,argument[0],argument[0],0,0);
part_type_orientation(pt,0,0,0,0,0);
part_type_gravity(pt,0,270);
part_type_blend(pt,0);
part_type_life(pt,7,60);

//warpring lines
/*
part_type_shape(pt3,3)
part_type_size(pt3,1,1,0,0)
part_type_speed(pt3,20,24,0,0)
part_type_orientation(pt3,0,0,0,0,1)
part_type_direction(pt3,0,360,0,0)
part_type_color3(pt3,c_white,c_white,c_white)
part_type_alpha2(pt3,0.5,0)
part_type_blend(pt3,1)
part_type_life(pt3,15,25)
part_type_gravity(pt3,0,270)
part_type_sprite(pt3,spr_line,0,0,0)
