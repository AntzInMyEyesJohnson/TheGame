///create_part_type_sprite(sprite, animate, ani_stretch, ani_random, alpha1, alpha2, blend, min_life, max_life, min_scale, max_scale, scaling, orient, gravity);
var sprite = argument[0];
var animate = argument[1];
var ani_stretch = argument[2];
var ani_random = argument[3];
var alpha1 = argument[4];
var alpha2 = argument[5];
var blend = argument[6];
var min_life = argument[7];
var max_life = argument[8];
var min_scale = argument[9];
var max_scale = argument[10];
var scaling = argument[11];
var orient = argument[12];
var gravy = argument[13];
var dir = argument[14];
// = argument[15];

var type = part_type_create();
part_type_alpha2(type,alpha1,alpha2);
part_type_sprite(type,sprite,animate,ani_stretch,ani_random);
part_type_blend(type,blend);
part_type_size(type,min_scale,max_scale,scaling,0);
part_type_gravity(type,abs(gravy),sign(gravy)*270);
part_type_direction(type,dir-irandom(90),dir+irandom(90),0,0);
part_type_orientation(type,0,orient,0,0,0);
part_type_life(type,min_life,max_life);
//part_type_death(type,

return type;
