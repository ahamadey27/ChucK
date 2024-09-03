//Simple resonant pop class wraps UGens and function for accessing them 

public class Simple 
{
    Impulse imp => ResonZ filt => dac; 

    100.0 => filt.Q => filt.gain;
    1000.0 => filt.freq; 

    //Set freq
    fun void freq(float freq)
    {
        freq => filt.freq;
    }

    fun void setQ(float Q)
    {
        Q => filt.Q;
    }

    fun void setGain(float gain)
    {
        filt.Q() * gain => imp.gain;
    }

    //Play a note by firing impulses
    fun void noteOn(float volume)
    {
        volume => imp.next; 
    }
}

//Make an instance/declare one of our simple classes
Simple s;
while (true)
{
    Std.rand2f(1100.0, 1200.0) => s.freq; 
    1 => s.noteOn; 
    0.1 :: second => now; 
}