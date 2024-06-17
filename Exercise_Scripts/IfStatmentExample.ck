SinOsc s => dac;

220.0 => s.freq;
0.6 => s.gain;

//chance logical variable
1 => int chance; 

if(chance == 1)
{
    //sound will only play if chance is == 1
    1 :: second => now; 
}

//set new frequency
330.0 => s.freq;
1 :: second => now; 