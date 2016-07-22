///EffectWallHit([play_sound]);
//play wall hit sound only once
if (argument_count < 1){
    PlaySound(snd_bullethitobject,.5,choose(3,4,5),random_range(.9,1.1));
}
//shoot particles off wall
CreateParticle(global.pt_spark,round(accuracy/90)*90-180,part_amount,20);
//set wall effect to true so it will always run a second time
effect_hit_wall = true;
