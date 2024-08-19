//Using functions to set oscillator frequencies

//three oscillators in stereo
SqrOsc s => dac.left;
SqrOsc t => dac;
SqrOsc u => dac.right;

//Set gain to not overload the dac
0.4 => s.gain => t.gain => u.gain;

//Functions for octave and fifth
fun float octave(float originalFreq)
{
    return (2.0*originalFreq); 
}
fun float fifth(float originalFreq)
{
    return (1.5*originalFreq);
}

//Main program 
for (100 => float freq; freq < 500; 0.5 +=> freq) //sweep freq from 100 to 500 in half hz steo
{
    freq => s.freq; //sets left sqr ro freq
    octave(freq) => t.freq; //sets center sqr to octave
    fifth(freq) => u.freq; //sets right sqr to fifth

    //prints freq sweep
    <<< s.freq(), t.freq(), u.freq() >>>;

    10::ms => now;
}