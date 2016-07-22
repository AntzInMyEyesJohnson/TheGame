///grid_place_meeting(x,y,lifeform_check);
var xx,yy,xs,ys,x_meeting,y_meeting,center_meeting,lifeform_check,lifeform_meeting;
xx = argument[0];
yy = argument[1];
lifeform_check = argument[2];
x_meeting = false;
y_meeting = false;
center_meeting = false;
lifeform_meeting = false;



//remember start position
xs = x;
ys = y;

//update the position for the bbox calculations
x = xx;
y = yy;


if (instance_exists(obj_level_generator)){
    //check for x meeting
    x_meeting = (obj_level_generator.grid[# bbox_right>>CELL_BIT_WIDTH/* div (CELL_WIDTH)*/, bbox_top>>CELL_BIT_HEIGHT/* div (CELL_HEIGHT)*/] == VOID or
                     obj_level_generator.grid[# bbox_right>>CELL_BIT_WIDTH/* div (CELL_WIDTH)*/, bbox_top>>CELL_BIT_HEIGHT/* div (CELL_HEIGHT)*/] == WALL) or
                    (obj_level_generator.grid[# bbox_left>>CELL_BIT_WIDTH/* div (CELL_WIDTH)*/, bbox_top>>CELL_BIT_HEIGHT/* div (CELL_HEIGHT)*/] == VOID or
                     obj_level_generator.grid[# bbox_left>>CELL_BIT_WIDTH/* div (CELL_WIDTH)*/, bbox_top>>CELL_BIT_HEIGHT/* div (CELL_HEIGHT)*/] == WALL);
    //check for y meeting
    y_meeting = (obj_level_generator.grid[# bbox_right>>CELL_BIT_WIDTH/* div (CELL_WIDTH)*/, bbox_bottom>>CELL_BIT_HEIGHT/* div (CELL_HEIGHT)*/] == VOID or
                     obj_level_generator.grid[# bbox_right>>CELL_BIT_WIDTH/* div (CELL_WIDTH)*/, bbox_bottom>>CELL_BIT_HEIGHT/* div (CELL_HEIGHT)*/] == WALL) or
                    (obj_level_generator.grid[# bbox_left>>CELL_BIT_WIDTH/* div (CELL_WIDTH)*/, bbox_bottom>>CELL_BIT_HEIGHT/* div (CELL_HEIGHT)*/] == VOID or
                     obj_level_generator.grid[# bbox_left>>CELL_BIT_WIDTH/* div (CELL_WIDTH)*/, bbox_bottom>>CELL_BIT_HEIGHT/* div (CELL_HEIGHT)*/] == WALL);
    //check for center meeting
    center_meeting = (obj_level_generator.grid[# xx>>CELL_BIT_WIDTH/* div (CELL_WIDTH)*/, yy>>CELL_BIT_HEIGHT/* div (CELL_HEIGHT)*/] == VOID or
                         obj_level_generator.grid[# xx>>CELL_BIT_WIDTH/* div (CELL_WIDTH)*/, yy>>CELL_BIT_HEIGHT/* div (CELL_HEIGHT)*/] == WALL);
    /*
    //check for x meeting
    var x_meeting = (obj_level_generator.grid[# bbox_right div (CELL_WIDTH), bbox_top div (CELL_HEIGHT)] != FLOOR) or
                     //obj_level_generator.grid[# bbox_right div (CELL_WIDTH), bbox_top div (CELL_HEIGHT)] == WALL) or
                    (obj_level_generator.grid[# bbox_left div (CELL_WIDTH), bbox_top div (CELL_HEIGHT)] != FLOOR);// or
                     //obj_level_generator.grid[# bbox_left div (CELL_WIDTH), bbox_top div (CELL_HEIGHT)] == WALL);
    //check for y meeting
    var y_meeting = (obj_level_generator.grid[# bbox_right div (CELL_WIDTH), bbox_bottom div (CELL_HEIGHT)] != FLOOR) or
                     //obj_level_generator.grid[# bbox_right div (CELL_WIDTH), bbox_bottom div (CELL_HEIGHT)] == WALL) or
                    (obj_level_generator.grid[# bbox_left div (CELL_WIDTH), bbox_bottom div (CELL_HEIGHT)] != FLOOR);// or
                     //obj_level_generator.grid[# bbox_left div (CELL_WIDTH), bbox_bottom div (CELL_HEIGHT)] == WALL);
    //check for center meeting
    var center_meeting = (obj_level_generator.grid[# xx div (CELL_WIDTH), yy div (CELL_HEIGHT)] != FLOOR);// or
                         //obj_level_generator.grid[# xx div (CELL_WIDTH), yy div (CELL_HEIGHT)] == WALL);
    */
} 

if (lifeform_check == 2){
    lifeform_meeting = place_meeting(x,y,obj_player);
} else if (lifeform_check == 1){
    //check for lifeform meeting
    lifeform_meeting = place_meeting(x,y,obj_lifeform_parent);
} else if (lifeform_check == -1) {
    //check for lifeform meeting
    lifeform_meeting = place_meeting(xx,yy,obj_enemy_parent);
}else if (lifeform_check == -2){
    //check for lifeform meeting but not me
    lifeform_meeting = instance_place_notme(xx,yy,obj_enemy_parent);
}
         
//move back
x = xs;
y = ys;

//return if will collide with wall or void or not
return x_meeting or y_meeting or center_meeting or lifeform_meeting;
