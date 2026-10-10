if (is_moving) {
    var n = audio_play_sound(snd_footstep2, 10, false, .3);
    audio_sound_pitch(n,1 + random_range(-0.3,0.3)) //randomize pitch on each footstep
}

// Should be fps /3, don't worry about it
alarm[0] = 60 / 3