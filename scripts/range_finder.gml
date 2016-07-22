/// range_finder(x1,y1,x2,y2,range,object,prec,notme)
//
//  Returns the exact distance to the nearest instance of an object in a
//  given direction from a given point, or noone if no instance is found.
//  The solution is found in log2(range) collision checks.
//
//      x,y         position in room, real
//      dir         direction to look in degrees, real
//      range       the greatest distance to look in pixels, real
//      object      which objects to look for (or all), real
//      prec        true to use precise collision checking, bool
//      notme       true to ignore the calling instance, bool
//
/// GMLscripts.com/license
{
    var ox1,oy1,ox2,oy2,range,object,prec,notme,dx,dy,sx,sy,distance;
    ox1 = argument[0];
    oy1 = argument[1];
    ox2 = argument[2];
    oy2 = argument[3];
    range = argument[4];
    object = argument[5];
    prec = argument[6];
    notme = argument[7];
    sx = lengthdir_x(range,point_direction(ox1,oy1,ox2,oy2));
    sy = lengthdir_y(range,point_direction(ox1,oy1,ox2,oy2));
    dx = ox1 + sx;
    dy = oy1 + sy;
    if (collision_line(ox1,oy1,dx,dy,object,prec,notme) < 0) {
        distance = -1;
    }else{
        while ((abs(sx) >= 1) || (abs(sy) >= 1)) {
            sx /= 2;
            sy /= 2;
            if (collision_line(ox1,oy1,dx,dy,object,prec,notme) < 0) {
                dx += sx;
                dy += sy;
            }else{
                dx -= sx;
                dy -= sy;
            }
        }
        distance = point_distance(ox1,oy1,dx,dy);
    }
    return distance;
}
