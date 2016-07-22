///scr_part_warpline_init_dir(direction);
//initialize our global warpline particle
global.pt_warpline = part_type_create();
var pt = global.pt_warpline;

//warpline particle settings
part_type_shape(pt,pt_shape_line);
part_type_size(pt,1,1,0,0);
part_type_scale(pt,1,.075);
part_type_color3(pt,c_yellow,c_white,c_ltgray);
part_type_alpha2(pt,.8,.3);
part_type_speed(pt,.1,1,0,0);
part_type_direction(pt,argument[0],argument[0],0,0);
part_type_orientation(pt,0,0,0,0,1);
part_type_gravity(pt,0,270);
part_type_blend(pt,0);
part_type_life(pt,10,20);

//warpline lines
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
