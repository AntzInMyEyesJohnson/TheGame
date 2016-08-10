///SetCursorTargetReticule();
window_set_cursor(cr_none);
//cursor_sprite = spr_mouse_target_reticule;
if (!instance_exists(obj_mouse)){
    instance_create(mouse_x,mouse_y,obj_mouse);
}
