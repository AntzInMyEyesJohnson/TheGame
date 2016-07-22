/// create_motion_trail(length,hue,rotation,scale,death_alarm)
//
//  Draws the assigned sprite of the calling instance, using its
//  subimage, position, scaling, rotation, and blending settings,
//  with a motion blur effect applied to it.
//
//      length      length of blur, real
//      direction   direction of blur in degrees, real
//
/// GMLscripts.com/license
{
    var mt = instance_create(x,y,obj_surface_trails);
    mt.creator = self.id;
    mt.length = argument[0];
    mt.hue = argument[1];
    mt.rot = argument[2];
    mt.scale = argument[3];
    mt.die_alarm = argument[4];
    mt.die_limit = argument[4]+argument[4]/2;
    mt.sprite = argument[5];
    mt.image_index = argument[6];
    
    mt.st_x[(mt.length-1)] = 0;
    mt.st_y[(mt.length-1)] = 0;
    
    for (var i = 0; i < mt.length; i += 1) {
        mt.st_x[i] = x;
        mt.st_y[i] = y;
    }
}
