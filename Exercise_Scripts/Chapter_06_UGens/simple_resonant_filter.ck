//Impulse through resonant filter
Impulse imp => ResonZ filt => dac;

//Set Q of ResonZ filter via .Q method
100.0 => filt.Q;

while(true)
{
    //pick random frequency
    Math.random2f(500.0, 2500.0) => filt.freq; 
    //impulse to output 100 only on next sample
    100.0 => imp.next; 
    //Randomized timing of next impulse
    Math.random2f(0.01, 1.0) :: second =>  now;
}