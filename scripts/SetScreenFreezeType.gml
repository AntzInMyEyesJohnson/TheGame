///SetScreenFreezeType(type);
//screenfreeze effect
if (argument[0] == obj_projectile_melee){
    global.screenfreeze = 5;
    if (instance_exists(obj_samurai)){
        if (obj_samurai.state == stateSPECIAL){global.screenfreeze = 6;}
        if (obj_samurai.state == stateUNIQUE){global.screenfreeze = 8;}
    }
} else {
    global.screenfreeze = 3;
}

