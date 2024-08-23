//Super simple Karplus-Strong plucked string using delay line UGens

Impulse imp => Delay str => dac;

//Connects str back into itself with OneZero filter added
str => OneZero filter => str; 

//Roundtrip string delay @ 100Hz 44.1k SRATE
441.0 :: samp => str.delay; 

//Set roundtrip str gain to less than 1
0.98 => str.gain;

//Pluck the string using next putting 1.0 on first sample and 0 for the rest
1.0 => imp.next; 

//Let string ring
5.0 :: second => now;


