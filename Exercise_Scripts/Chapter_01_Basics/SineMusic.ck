/* Sine Music
by Alex Hamadey
May 2024*/

SinOsc s => dac;

//Play one note
220 => s.freq;
1.0 => s.gain;
0.3 :: second => now;
0.0 => s.gain;
0.3 :: second => now;

//Play another note at the same pitch
1.0 => s.gain;
0.3 :: second => now;

0.0 => s.gain;
0.3 :: second => now; 

//Plays two more notes, higher and less loud
330 => s.freq;
0.3 => s.gain;
0.3 :: second => now;

0.0 => s.gain;
0.3 :: second => now;

0.3 => s.gain;
0.3 :: second => now; 

0.0 => s.gain;
0.3 :: second => now; 

//Plays third note
293 => s.freq;
0.3 => s.gain;
0.3 :: second => now;

0.0 => s.gain;
0.3 :: second => now;

0.3 => s.gain;
0.3 :: second => now; 

0.0 => s.gain;
0.3 :: second => now; 