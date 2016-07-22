///WarpDraw(startx,starty,centerx,centery,width,height,size,radius,amount);
var size, width, height, sx, sy, cx, cy,radius, amount;
sx = argument0;
sy = argument1;
cx = argument2;
cy = argument3;
width = argument4;
height = argument5;
size = argument6;
radius = argument7;
amount = argument8;

    texid = surface_get_texture(surf);
    draw_set_color(c_blue);
    
    w = width / size;
    h = height / size;
    for (j=0; j<=h; j+=1) {
        draw_primitive_begin_texture(pr_trianglestrip, texid);
        for (i=0; i<=w; i+=1) {
            for (k=0; k<=1; k+=1) {
                sx = size * i;
                sy = size * (j + k);
                u = sx / width;
                v = sy / height;
                
                dir = point_direction(sx,sy,cx,cy);
                dis = point_distance(sx,sy,cx,cy);
                if (dis <= radius) {
                    pow = amount * sin(pi * dis / radius);
                    sx += lengthdir_x(pow,dir);
                    sy += lengthdir_y(pow,dir);
                }
                
                draw_vertex_texture(sx, sy, u, v);
            }
        }
        draw_primitive_end()
    }
