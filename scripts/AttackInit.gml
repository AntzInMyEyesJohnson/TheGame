///AttackInit(projectile_type,attack_length,sound,screenkick);
projectile = argument[0];
attack_length = round(argument[1]*room_speed);
attack_alarm = attack_length;
sound = argument[2];
global.screenkick += argument[3];


attack_dir = point_direction(x,y,obj_mouse.x,obj_mouse.y);//maybe /90
var projectile = instance_create(x+lengthdir_x(2,attack_dir),y+lengthdir_y(2,attack_dir),projectile);
projectile.creator = self.id;

PlaySound(sound,1,choose(10,11),random_range(.9,1.1));
