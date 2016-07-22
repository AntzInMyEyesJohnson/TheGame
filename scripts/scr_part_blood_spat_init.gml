///scr_part_blood_spat_init();
//initialize our global spatter particle
global.pt_spatter = part_type_create();
var st = global.pt_spatter;

part_type_shape(st,pt_shape_disk);
part_type_size(st,0.1,0.3,0,0);
part_type_scale(st,.6,.25);
part_type_color2(st,make_colour_hsv(0,140,180),make_colour_hsv(0,140,120));
part_type_alpha1(st,1);
part_type_speed(st,0,0,0,0);
part_type_direction(st,0,0,0,0);
part_type_gravity(st,0,270);
part_type_life(st,2000,2500);

//initialize our global blood particle
global.pt_blood = part_type_create();
var pt = global.pt_blood;

part_type_shape(pt,pt_shape_square);
part_type_size(pt,.02,.04,0,0);
part_type_color2(pt,make_colour_hsv(0,180,180),make_colour_hsv(0,140,180));
part_type_alpha1(pt,1);
part_type_speed(pt,1,4,0,0);
part_type_direction(pt,60,120,0,0); // blood spurts in an arc upward and then down
part_type_gravity(pt,0.2,270);
part_type_orientation(pt,0,0,0,0,1);
part_type_life(pt,20,25);
part_type_death(pt, 1, global.pt_spatter); // once the droplets reach the floor, they turn into spatter marks
