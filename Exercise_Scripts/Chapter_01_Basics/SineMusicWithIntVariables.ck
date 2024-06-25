//Sine Music with Variables

SinOsc s => dac;

220 => int myPitch;

1 => int onGain;
0 => int offGain;

//Play one note
myPitch => s.freq;
onGain => s.gain;
0.3 :: second => now; 

offGain => s.gain;
0.3 :: second => now;

2 *=> myPitch;

//Play another note with a higher pitch 
myPitch => s.freq;
onGain => s.gain; 
0.3 :: second => now;

offGain => s.gain;
0.3 :: second => now;