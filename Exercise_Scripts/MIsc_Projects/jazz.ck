// Set up the tempo
90 => float bpm;
60.0 / bpm => float spb; // seconds per beat

// Set up the scale (G Dorian)
[ 0, 2, 3, 5, 7, 9, 10 ] @=> int scale[];

// Set up the Brass UGen
Brass brass => JCRev reverb => DelayL delay => dac;
0.5 => reverb.mix;
0.7 => delay.gain;
0.5::second => delay.delay;

// Function to get a random note from the scale
fun float getRandomNote() {
    return Std.mtof( 55 + scale[Std.rand2(0, scale.size() - 1)] );
}

// Function to get a random duration
fun float getRandomDuration() {
    return spb * Std.rand2f(0.25, 1.0);
}

// Infinite loop to play random notes
while (true) {
    getRandomNote() => brass.freq;
    Std.rand2f(0.5, 1.0) => brass.noteOn;
    getRandomDuration()::second => now;
    brass.noteOff;
}