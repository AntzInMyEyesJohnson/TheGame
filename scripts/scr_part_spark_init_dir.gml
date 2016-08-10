///scr_part_spark_init(direction,hue);
_dir = argument[0];
_hue = argument[1];
hfactor = 20;
collum = 215;
//initialize our global spark particle
global.pt_spark = part_type_create();
var pt = global.pt_spark;
//initialize our global spark2 particle
global.pt_spark2 = part_type_create();
var st = global.pt_spark2;

//spark particle settings
part_type_shape(pt,pt_shape_square);
part_type_size(pt,.01,.08,-.002,0);
part_type_scale(pt,.8,.35);
part_type_color3(pt,make_colour_hsv(_hue,240,collum),make_colour_hsv(_hue+hfactor,240,collum),make_colour_hsv(_hue+hfactor*2,240,collum));
part_type_alpha2(pt,1,.5);
part_type_speed(pt,3,6,0,0);
part_type_direction(pt,_dir-40,_dir+40,0,0);
part_type_gravity(pt,.25,270);
part_type_orientation(pt,110,250,2,15,0);
part_type_blend(pt,false);
part_type_life(pt,20,25);
part_type_death(pt,1,global.pt_spark2);

//spark2 particle settings
part_type_shape(st,pt_shape_square);
part_type_size(st,.01,.05,-.002,0);
part_type_scale(st,.8,.35);
part_type_color3(st,make_colour_hsv(_hue,240,collum),make_colour_hsv(_hue+hfactor,240,collum),make_colour_hsv(_hue+hfactor*2,240,collum));
part_type_alpha2(st,1,.5);
part_type_speed(st,2,4,0,0);
part_type_direction(st,_dir-30,_dir+30,0,0);
part_type_gravity(st,.1,270);
part_type_orientation(st,120,240,2,15,0);
part_type_blend(st,false);
part_type_life(st,12,18);
