///PlaySound(sound, [volume], [priority], [pitchrange]);
var priority = 1;
var pitchrange = 1;
var gain = 1;
if (argument_count > 1) {
    gain = argument[1];
    if (argument_count > 2) {
        priority = argument[2];
        if (argument_count > 3) {
            pitchrange = argument[3];
        }
    }
}    
        
audio_emitter_gain(global.audio_em, gain);
audio_emitter_pitch(global.audio_em, pitchrange);
audio_play_sound_on(global.audio_em,argument[0], false, priority);

