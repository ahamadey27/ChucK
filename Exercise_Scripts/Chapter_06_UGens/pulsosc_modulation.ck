//PulseOsc UGen random modulation 
PulseOsc p => dac;

while (true)
{
    Math.random2f(0.01, 0.5) => p.width; //Sets random pulse width
    
    if (Math.random2(0, 1)) //Picks pitch randomly 
    {
        84.0 => p.freq;
    }
    else
    {
        100.0 => p.freq;
    }
    
    1 => p.gain; //turns on ossciallator 
    0.06 :: second => now;
    0 => p.gain; //turns off ossciallator
    0.4 :: second => now;
}