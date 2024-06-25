//connent two osciallators to the dac
SinOsc s1 => dac;
SinOsc s2 => dac;

//set frequencies and gain
220 => s1.freq; 
1030 => s2.freq; 
0.5 => s1.gain;
0.5 => s2.gain; 

5 :: second => now; 