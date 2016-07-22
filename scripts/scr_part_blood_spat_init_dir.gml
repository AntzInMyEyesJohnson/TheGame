///scr_part_blood_spat_init_dir(direction);
//initialize our global blood and spatter particles
global.pt_spatter = part_type_create();
var st = global.pt_spatter;
global.pt_blood = part_type_create();
var pt = global.pt_blood;


part_type_shape(pt,pt_shape_square);
part_type_size(pt,.03,.06,0,0);
part_type_color2(pt,make_colour_hsv(0,190,180),make_colour_hsv(0,210,190));
part_type_alpha1(pt,1);
part_type_speed(pt,.5,6,0,0);
part_type_direction(pt,argument[0]-40,argument[0]+40,0,0); // blood spurts in an arc upward and then down
part_type_gravity(pt,0.1,270);
part_type_orientation(pt,0,0,0,0,1);
part_type_life(pt,15,25);
part_type_death(pt, 1, global.pt_spatter); // once the droplets reach the floor, they turn into spatter marks

part_type_shape(st,pt_shape_disk);
part_type_size(st,0.1,0.3,0,0);
part_type_scale(st,.6,.25);
part_type_color2(st,make_colour_hsv(0,190,190),make_colour_hsv(0,190,170));
part_type_alpha2(st,1,.75);
part_type_speed(st,0,0,0,0);
part_type_direction(st,0,0,0,0);
part_type_gravity(st,0,270);
part_type_life(st,2000,2500);

