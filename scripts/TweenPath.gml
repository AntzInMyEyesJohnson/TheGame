/// TweenPath(target,ease,mode,delta,delay,dur,path,absolute)

var _repeat = (argument2 == TWEEN_MODE_REPEAT);

with(argument0)
{
    // IF absolute
    if (argument7)
    {
        var _data;
        _data[6] = _repeat;
        _data[0] = argument6;
        _data[1] = argument7;
        _data[2] = 0;
        _data[3] = 0;
        _data[4] = 0;
        _data[5] = 0;
        
        return TweenFire(argument0, ext_path__, argument1, argument2, argument3, argument4, argument5, 0, 1, _data);
    }
    else
    {
        var _path_xstart = path_get_x(argument6, 0);
        var _path_ystart = path_get_y(argument6, 0);
        
        var _data;
        _data[6] = _repeat;
        _data[0] = argument6;
        _data[1] = argument7;
        _data[2] = _path_xstart;
        _data[3] = _path_ystart;
        _data[4] = x-_path_xstart;
        _data[5] = y-_path_ystart;
        
        return TweenFire(argument0, ext_path__, argument1, argument2, argument3, argument4, argument5, 0, 1, _data);
    }
}



