///CreateParticle(part_type,part_direction,part_amount,part_hue,[part_xx],[part_yy],[part_depth],[part_shape],[part_distribution],[part_sprite]);
var _type,_dir,_amount,_hue,_depth,_shape,_distribution,_sprite;
_type = argument[0];
_dir = argument[1];
_amount = argument[2];
_hue = argument[3];
_xx = x;
_yy = y;
_depth = undefined;
_shape = ps_shape_diamond;
_distribution = ps_distr_gaussian;
_sprite = undefined;
if (argument_count > 4){_xx = argument[4];}
if (argument_count > 5){_yy = argument[5];}
if (argument_count > 6){_depth = argument[6];}
if (argument_count > 7){_shape = argument[7];}
if (argument_count > 8){_distribution = argument[8];}
if (argument_count > 9){_sprite = argument[9];}

if (_type == global.pt_blood){
    scr_part_blood_spat_init_dir(_dir);
} else if (_type == global.pt_spark){
    scr_part_spark_init_dir(_dir,_hue);
} else if (_type == global.pt_swordclash){
    scr_part_swordclash_init(_dir,_hue,_sprite);
} else if (_type == global.pt_slime){
    scr_part_slime_spat_init_dir(_dir);
}

//so the particle system has a chance to set its new variables.
if (part_alarm < 0){
    if (_depth == undefined){
        part_emitter_region(global.ps_standard,global.em_standard,_xx-8,_xx+8,_yy-8,_yy+8,_shape,_distribution);
        part_emitter_burst(global.ps_standard,global.em_standard,_type,_amount); 
    } else {
        part_system_depth(global.ps_depth,_depth);
        part_emitter_region(global.ps_depth,global.em_depth,_xx-6,_xx+6,_yy-6,_yy+6,_shape,_distribution);
        part_emitter_burst(global.ps_depth,global.em_depth,_type,_amount);
    }
    part_alarm = 0;
    exit;
    //part_system_draw_order(index,oldtonew);
}

part_alarm--;
