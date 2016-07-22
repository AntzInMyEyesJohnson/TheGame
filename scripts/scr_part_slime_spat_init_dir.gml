///scr_part_slime_spat_init_dir(direction);
//initialize our global slime spatter particle
global.pt_slimespatter = part_type_create();
var st = global.pt_slimespatter;

part_type_shape(st,pt_shape_disk);
part_type_size(st,.1,.28,0,0);
part_type_scale(st,.6,.25);
part_type_color2(st,make_colour_hsv(81,220,160),make_colour_hsv(81,220,130));
part_type_alpha1(st,1);
part_type_speed(st,0,0,0,0);
part_type_direction(st,0,0,0,0);
part_type_gravity(st,0,270);
part_type_life(st,2000,2500);


//initialize our global slime droplet particle
global.pt_slime = part_type_create();
var pt = global.pt_slime;

part_type_shape(pt,pt_shape_square);
part_type_size(pt,.02,.04,.0025,0);
part_type_color1(pt,make_colour_hsv(81,240,175));
part_type_alpha1(pt,1);
part_type_speed(pt,.5,6,0,0);
part_type_direction(pt,argument[0]-30,argument[0]+30,0,0); // blood spurts in an arc upward and then down
part_type_gravity(pt,0.1,270);
part_type_orientation(pt,0,0,0,0,1);
part_type_life(pt,15,25);
part_type_death(pt, 1, global.pt_slimespatter); // once the droplets reach the floor, they turn into spatter marks
