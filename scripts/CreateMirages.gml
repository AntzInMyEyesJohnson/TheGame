///CreateMirages();
var mx,my,mdist,mir1,mir2,mir3,mir4;
mx = x;
my = y;
mdist = 24;

//left
if (mirage_array[3] == noone){
    if (ObjectInPath(mx,my,mx-mdist,my,10,obj_wall)){
        while !(ObjectInPath(mx,my,mx-1,my,10,obj_wall)){
            mx -= 1;
        }
        mir1 = instance_create(mx,my,object_index);
        mirage_array[3] = mir1;
        mir1.enemy_health = 1;
        mir1.mirage = true;
    }else {
        mir1 = instance_create(mx-mdist,my,object_index);
        mirage_array[3] = mir1;
        mir1.enemy_health = round(enemy_health_max/2);
        mir1.mirage = true;
    }
}
//right
if (mirage_array[2] == noone){
    if (ObjectInPath(mx,my,mx+mdist,my,10,obj_wall)){
        while !(ObjectInPath(mx,my,mx+1,my,10,obj_wall)){
            mx += 1;
        }
        mir2 = instance_create(mx,my,object_index);
        mirage_array[2] = mir2;
        mir2.enemy_health = round(enemy_health_max/2);
        mir2.mirage = true;
    }else {
        mir2 = instance_create(mx+mdist,my,object_index);
        mirage_array[2] = mir2;
        mir2.enemy_health = round(enemy_health_max/2);
        mir2.mirage = true;
    }
}
//up
if (mirage_array[1] == noone){
    if (ObjectInPath(mx,my,mx,my-mdist,10,obj_wall)){
        while !(ObjectInPath(mx,my,mx,my-1,10,obj_wall)){
            my -= 1;
        }
        mir3 = instance_create(mx,my,object_index);
        mirage_array[1] = mir3;
        mir3.enemy_health = round(enemy_health_max/2);
        mir3.mirage = true;
    }else {
        mir3 = instance_create(mx,my-mdist,object_index);
        mirage_array[1] = mir3;
        mir3.enemy_health = round(enemy_health_max/2);
        mir3.mirage = true;
    }
}
//down
if (mirage_array[0] == noone){
    if (ObjectInPath(mx,my,mx,my+mdist,10,obj_wall)){
        while !(ObjectInPath(mx,my,mx,my+1,10,obj_wall)){
            my += 1;
        }
        mir4 = instance_create(mx,my,object_index);
        mirage_array[0] = mir4;
        mir4.enemy_health = round(enemy_health_max/2);
        mir4.mirage = true;
    }else {
        mir4 = instance_create(mx,my+mdist,object_index);
        mirage_array[0] = mir4;
        mir4.enemy_health = round(enemy_health_max/2);
        mir4.mirage = true;
    }
}
