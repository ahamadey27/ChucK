//Simple SawOsc based violin with adsr envelope and vibrato

SinOsc vibrato => SawOsc viol => ADSR env => dac;

//Tell oscillator to to interpret input as freq modulation 
//0: No synchronization
//1: Hard sync
//2: Soft sync 
2 => viol.sync; 

//Set vibrato freq to 6 Hz
60 => vibrato.freq; 

//Set all ADSR paramaters at once 
//0.5: Sustain level, the level at which the sound stays while the note is held. 
//This is a float because it represents a level or amplitude, not a duration.
env.set(0.01 :: second, 0.1 :: second, 0.5, 0.5 :: second);

//Define a D major scale array
[62, 64, 66, 67, 69, 71, 73, 74] @=> int scaleDmaj[];

//Run through scale one note at a time 
for (0 => int i; i < scaleDmaj.cap(); i++)
{
    //Set both freq according to note number
    Std.mtof(scaleDmaj[i]) => viol.freq => vibrato.freq;
    100 => vibrato.gain;

    //Trigger note
    1 => env.keyOn;
    0.3 ::second => now;
    1 => env.keyOff;
    0.1 ::second => now;    
}

//Repeate last note with lots of vibrato
1 => env.keyOn;
10.0 => vibrato.gain;
1.0 :: second => now;
0 => env.keyOff; 
0.2 :: second => now;
