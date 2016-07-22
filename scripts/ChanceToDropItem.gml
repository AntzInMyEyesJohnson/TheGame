///ChanceToDropItem(odds);
var odds = argument[0];
if (irandom(odds) == odds){
    instance_create(x,y,choose(obj_weapon_rifle,obj_weapon_bow,
                               obj_weapon_sniper,obj_weapon_knife,
                               obj_weapon_katana,obj_weapon_ax,
                               obj_weapon_revolver));
}
