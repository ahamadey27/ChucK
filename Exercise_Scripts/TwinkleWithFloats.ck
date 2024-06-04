//Sine Twinke Musis using floats as variables 

SinOsc s => dac; 

220.0 => float twinkle;
1.6818 * twinkle => float little;
0.3 => float rest;  

1 => int onGain;
0 => int offGain;

//Play one Note
twinkle => s.freq;
onGain => s.gain;
rest :: second => now; 
offGain => s.gain;
rest :: second => now; 

1.5 *=> twinkle;

//Play other note of second twinkle
twinkle => s.freq;
onGain => s.gain;
rest :: second => now; 
offGain => s.gain;
rest :: second => now; 

//Plays one note of little
little => s.freq;
onGain => s.gain;
rest :: second => now; 
offGain => s.gain;
rest :: second => now;

little => s.freq;
onGain => s.gain;
rest :: second => now; 
offGain => s.gain;
rest :: second => now;