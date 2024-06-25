//Differnet Wave Forms

SinOsc s => dac;
//SqrOsc s => dac; 
//TriOsc s => dac;
//SawOsc s => dac; 

//Play One note
220 => s.freq;
0.3 => s.gain;
0.6 :: second => now; 




