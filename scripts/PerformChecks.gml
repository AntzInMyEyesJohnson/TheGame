///PerformChecks(reactresponse,checkType);
var comReactResponse = argument[0];

if (argument[1] == I or comscript == ceDeath or comscript == ceDeathSpawn or comscript == ceDestroy){
    exit;
}

switch (argument[1]){
    case H:
    //check if there are projectiles present
    if (instance_exists(obj_projectile_parent) or distance_to_object(player) <= 60){
        if (HitCheck(obj_projectile_parent)){
            //start the getting hit effects
            comscript = ceHit;
            exit;
        }
    }
    break;
    case Hs:
    //check if there are projectiles present
    if (instance_exists(obj_projectile_parent) or distance_to_object(player) <= 80){
        if (ShieldCheck(obj_projectile_parent)){
            //start the getting hit effects
            comscript = ceBlock;
            exit;
        }
    }
    break;
    case Hm:
    //check if there are projectiles present
    if (instance_exists(obj_projectile_parent) or distance_to_object(player) <= 60){
        if (HitCheck(obj_projectile_melee_type)){
            //start the getting hit effects
            comscript = ceHit;
            exit;
        }
    }
    break;
    case Hr:
    //check if there are projectiles present
    if (instance_exists(obj_projectile_parent) or distance_to_object(player) <= 60){
        if (HitCheck(obj_projectile_ranged_type)){
            //start the getting hit effects
            comscript = ceHit;
            exit;
        }
    }
    break;
    case HR:
    //check if there are projectiles present
    if (instance_exists(obj_projectile_parent) or distance_to_object(player) <= 80){
        if (ReactCheck()){
            //start the projectile reaction com
            comscript = comReactResponse;
            exit;
        } else if (HitCheck(obj_projectile_parent)){
            //start the getting hit effects
            comscript = ceHit;
            exit;
        }
    }
    break;
    case HRm:
    //check if there are projectiles present
    if (instance_exists(obj_projectile_parent) or distance_to_object(player) <= 80){
        if (ReactCheck()){
            //start the projectile reaction check
            comscript = comReactResponse;
            exit;
        } else if (HitCheck(obj_projectile_melee_type)){
            //start the getting hit effects
            comscript = ceHit;
            exit;
        }
    }    
    break;
    case HRr:
    //check if there are projectiles present
    if (instance_exists(obj_projectile_parent) or distance_to_object(player) <= 80){
        if (ReactCheck()){
            //start the projectile reaction check
            comscript = comReactResponse;
            exit;
        } else if (HitCheck(obj_projectile_ranged_type)){
            //start the getting hit effects
            comscript = ceHit;
            exit;
        }
    }    
    break;
}
