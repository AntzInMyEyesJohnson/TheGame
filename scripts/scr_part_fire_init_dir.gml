///scr_part_fire_init_dir(direction);
//initialize our global fire particle
global.pt_fire = part_type_create();
var pt = global.pt_fire;

/*
//fire particle settings
part_type_shape(pt,pt_shape_square);
part_type_size(pt,.015,.06,0,0);
part_type_scale(pt,1,1);
part_type_color3(pt,c_yellow,c_red,c_maroon);
part_type_alpha2(pt,1,.5);
part_type_speed(pt,1,3,0,0);
part_type_direction(pt,0,359,0,0);
part_type_gravity(pt,.2,270);
//part_type_orientation(pt,0,0,0,0,0)
part_type_blend(pt,true);
part_type_life(pt,4,7);
*/
part_type_shape(pt,pt_shape_square); // the fire
part_type_size(pt,.03,.06,.001,0);
part_type_scale(pt,1,1);
part_type_color3(pt,c_yellow,c_red,c_maroon);
part_type_alpha3(pt,1,0.70,.30);
part_type_speed(pt,.1,1,0,0);
part_type_direction(pt,argument[0]-90,argument[0]+90,0,0);
part_type_gravity(pt,0.1,90);
part_type_orientation(pt,0,180,0,0,1);
part_type_blend(pt,true);
part_type_life(pt,5,11);

//part_type_death(pt,1,global.pt_smoke);
