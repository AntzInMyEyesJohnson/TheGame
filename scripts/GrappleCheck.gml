///GrappleCheck();
var result;
if (grapple != noone){
    result = true;
    grap_dir = point_direction(x,y,grapple.x,grapple.y);
    grap_spd++;
    grap_spd = min(grap_spd,6);
} else {
    result = false;
    grap_spd = 0;
}

//returns whether currently grappled or not
return result;

