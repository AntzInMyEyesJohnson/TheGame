///create_particles(x,y,direction,particle,sprite,amount)
var xx = argument[0];
var yy = argument[1];
var dir = argument[2];
var particle = argument[3];
var sprite = argument[4];
var amount = argument[5];

repeat (10){
    var part_body = instance_create(xx+random_range(-16,16),yy+random_range(-16,16),obj_dynamic_particle);
    part_body.direction = dir;
    //part_body.sprite_index = sprite;
    part_body.amount = amount;
}
//part_particles_create(global.ps_explode,xx,yy,particle,2);
