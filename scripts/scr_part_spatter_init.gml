///scr_part_spatter_init();
//initialize our global spatter particle
global.pt_spatter = part_type_create();
var pt = global.pt_spatter;

part_type_shape(pt,pt_shape_disk);
part_type_size(pt,0.1,0.3,0,0);
part_type_scale(pt,.6,.25);
part_type_color2(pt,make_colour_hsv(0,140,160),make_colour_hsv(0,140,100));
part_type_alpha3(pt,1,1,.9); // blood spatter fades slowly to nothing
part_type_speed(pt,0,0,0,0);
part_type_direction(pt,0,0,0,0);
part_type_gravity(pt,0,270);
part_type_life(pt,2000,2500);



