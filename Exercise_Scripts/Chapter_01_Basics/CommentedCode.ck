// Alex Hamadey
// 6.03.24

//make a sound patch 
SinOsc s => dac; 

//Prints program name
<<< "Sine Wave Program" >>>; 

//Sets volume to 0.6
0.6 => s.gain;

//Set frequency to 220
220 => s.freq; 

//Plays for two seconds 

2.0 :: second => now;
h