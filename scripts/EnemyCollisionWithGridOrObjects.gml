///EnemyCollisionWithWallGrid();
speed = clamp(speed,-move_speed,move_speed);

//if about to walk into wall then change direction until not
var collision_checks = 0;
var direction_to_check = choose(-1,1);
//grid and lifeform collisions from moving
while ((grid_place_meeting(x+hspeed,y+vspeed) or 
        place_meeting(x+hspeed,y+vspeed,obj_lifeform)) and 
        collision_checks <= 12)
{
    direction += random_range(30,60);// * direction_to_check;
    collision_checks++;
}

//grid collisions from shunts (like knockback and recoil)
collision_checks = 0;
if (grid_place_meeting(x+hspeed+xshunt,y+vspeed+yshunt) and 
    collision_checks <= 30)
{
    ResetShunts();
    collision_checks++;
}
hspeed += xshunt;
vspeed += yshunt;
ResetShunts();




