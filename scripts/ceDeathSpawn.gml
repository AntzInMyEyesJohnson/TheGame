///ceDeathSpawn();

//####will eventually siphon out####
//state = 'death';

//destroy object at end of animation
if (offspring == true){
    instance_destroy();
} else {
    xx = x;
    yy = y;
    if (ObjectInPath(xx,yy,xx-16,yy,10,obj_wall)){
        while !(ObjectInPath(xx,yy,xx-1,yy,10,obj_wall)){
            xx -= 1;
        }
        mini_one = instance_create(xx,yy,object_index);
        mini_one.enemy_health = round(enemy_health_max/2);
        mini_one.scale_factor = scale_factor/2;
        mini_one.offspring = true;
    }else {
        mini_one = instance_create(xx-16,yy,object_index);
        mini_one.enemy_health = round(enemy_health_max/2);
        mini_one.scale_factor = scale_factor/2;
        mini_one.offspring = true;
    }

    if (ObjectInPath(xx,yy,xx+16,yy,10,obj_wall)){
        while !(ObjectInPath(xx,yy,xx+1,yy,10,obj_wall)){
            xx += 1;
        }
        mini_two = instance_create(xx,yy,object_index);
        mini_two.enemy_health = round(enemy_health_max/2);
        mini_two.scale_factor = scale_factor/2;
        mini_two.offspring = true;
    }else {
        mini_two = instance_create(xx+16,yy,object_index);
        mini_two.enemy_health = round(enemy_health_max/2);
        mini_two.scale_factor = scale_factor/2;
        mini_two.offspring = true;
    }
    
    instance_destroy();//comscript = ceDestroy;
}
