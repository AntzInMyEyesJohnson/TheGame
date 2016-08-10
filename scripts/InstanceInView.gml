///InstanceInView(instance)
Id = argument[0];
if (Id.x < (view_xview+view_wview) and Id.x > view_xview and Id.y < (view_yview+view_hview) and Id.y > view_yview){
    return true;
}
return false;
