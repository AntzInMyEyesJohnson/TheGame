///scr_part_ice_init();
//initialize our global ice particle
global.pt_ice = part_type_create();
var pt = global.pt_ice;

//ice particle settings
part_type_shape(pt,pt_shape_square);
part_type_size(pt,.015,.06,0,0);
part_type_scale(pt,1,1);
part_type_color3(pt,c_yellow,c_aqua,c_navy);
part_type_alpha2(pt,1,.5);
part_type_speed(pt,1,3,0,0);
part_type_direction(pt,0,359,0,0);
part_type_gravity(pt,.2,270);
//part_type_orientation(pt,0,0,0,0,0)
part_type_blend(pt,true);
part_type_life(pt,4,7);
