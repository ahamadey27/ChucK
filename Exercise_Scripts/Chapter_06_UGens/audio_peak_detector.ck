//Audio peak detector using blackhole (UGen adc that doesn't connect to adc)
adc => Gain g => blackhole;

while (true)
{
    if (g.last() > 0.9) //.last() gets last sample from any UGen
    {
        <<< "LOUD !!!", g.last() >>>; 
    }
    samp => now; //do this for every sample 
}