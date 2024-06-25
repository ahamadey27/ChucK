SinOsc s => dac; 

220.0 => s.freq;
0.5 => s.gain; 

1 => int chance; 

if(chance == 1)
{
    1 :: second => now;
}
else
{
    330.0 => s.freq; 
    3 :: second => now; 
}

440.0 => s.freq;
1 :: second => now; 