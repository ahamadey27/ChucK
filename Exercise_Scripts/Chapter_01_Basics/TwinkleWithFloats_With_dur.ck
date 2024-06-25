//Sine Twinke Musis using floats as variables 

SinOsc s => dac; 

220.0 => float twinkle;
1.6818 * twinkle => float little;

//Defines note duration as off
0.55 :: second => dur onDur;
0.05 :: second => dur offDur; 

1 => int onGain;
0 => int offGain;

//Play one Note
twinkle => s.freq;
onGain => s.gain;
onDur => now; 
offGain => s.gain;
offDur => now; 

1.5 *=> twinkle;

//Play other note of second twinkle
twinkle => s.freq;
onGain => s.gain;
onDur => now; 
offGain => s.gain;
offDur => now; 

//Plays one note of little
little => s.freq;
onGain => s.gain;
onDur => now; 
offGain => s.gain;
offDur => now; 

little => s.freq;
onGain => s.gain;
onDur => now; 
offGain => s.gain;
offDur => now; 