//FM unit generator instrument

Wurley inst => dac;

while (true)
{
    Math.random2f(100.0, 300.0) => inst.freq; 
    1 => inst.noteOn; 
    Math.random2f(0.2, 0.5) :: second => now; 

    //ramp down internal adsr
    1 => inst.noteOff;
    Math.random2f(0.05, 0.2) :: second => now; 
}