//CreateBlood(blood_type,hit_direction,blood_amount,blood_depth);
var blood_type,blood_dir,blood_amount,blood_depth;
blood_type = argument[0];
blood_dir = argument[1];
blood_amount = argument[2];
blood_depth = argument[3];

if (blood_type == global.pt_slime){
    scr_part_slime_spat_init_dir(blood_dir);
} else {
    scr_part_blood_spat_init_dir(blood_dir);
}

//so the particle system has a chance to set its new variables.
if (my_blood_alarm < 0){
    //part_system_depth(global.ps_blood,blood_depth);
    part_emitter_region(global.ps_blood,global.em_blood,
    x-8,x+8,y-8,y+8,ps_shape_diamond ,ps_distr_gaussian);
    part_emitter_burst(global.ps_blood,global.em_blood,blood_type,blood_amount);
    my_blood_alarm = 0;
    exit;
    //part_system_draw_order(index,oldtonew);
}

my_blood_alarm--;



