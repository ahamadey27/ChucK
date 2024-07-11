Noise n => Pan2 p => dac;
0.2 => n.gain;
while (true)
{
    Math.sin(now/second) => p.pan;
    ms => now; 
}