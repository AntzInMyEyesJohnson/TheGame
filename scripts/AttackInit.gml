///AttackInit(projectile_type,attack_length,screenkick,sound);
projectile_type = argument[0];
attack_length = round(argument[1]*room_speed);
attack_alarm = attack_length;
ani_atkwindow_alarm = room_speed;//really means that player has room_speed-attack_length amount of time to continue comboing
global.screenkick += argument[2];
sound = argument[3];

attack_dir = point_direction(x,y,obj_mouse.x,obj_mouse.y);//maybe /90
var projectile = instance_create(x+lengthdir_x(2,attack_dir),y+lengthdir_y(2,attack_dir),projectile_type);
projectile.creator = self.id;

//play sound
if (sound != 0){
    PlaySound(sound,1,choose(10,11),random_range(.9,1.1));
}
