///scr_part_swordclash_init(dir,hue,sprite);
_dir = argument[0];
_hue = argument[1];
_sprite = argument[2];
randscale = random_range(1,1.2);
//initialize our global swordclash particle
global.pt_swordclash = part_type_create();
var pt = global.pt_swordclash;
//initialize our global swordclash2 particle
global.pt_swordclash2 = part_type_create();
var st = global.pt_swordclash2;

//swordclash particle settings
part_type_sprite(pt,_sprite,1,1,0);
part_type_size(pt,.9,1.2,.03,0);
part_type_scale(pt,randscale,randscale-random_range(.35,.45));
part_type_color3(pt,make_colour_hsv(_hue,240,190),make_colour_hsv(_hue,240,210),make_colour_hsv(_hue,240,190));
part_type_alpha2(pt,1,.95);
part_type_speed(pt,0,1,0,0);
part_type_direction(pt,_dir,_dir,0,0);
//part_type_gravity(pt,0,270);
part_type_orientation(pt,-20,-20,0,0,1);
//part_type_blend(pt,false);
part_type_life(pt,20,25);
part_type_death(pt,10,global.pt_swordclash2);

//swordclash2 particle settings
part_type_shape(st,pt_shape_square);
part_type_size(st,.08,.12,-.002,0);
part_type_scale(st,.8,.35);
part_type_color1(st,c_yellow);
part_type_alpha2(st,1,.5);
part_type_speed(st,2,4,0,0);
part_type_direction(st,0,359,0,0);
part_type_gravity(st,.1,270);
part_type_orientation(st,120,240,3,15,1);
//part_type_blend(st,false);
part_type_life(st,12,18);
