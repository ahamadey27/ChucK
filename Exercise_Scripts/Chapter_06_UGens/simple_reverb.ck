adc => Gain input => dac;
0.5 => input.gain; 

//Delay UGens to model wall and cieling
input => Delay d1 => dac;
input => Delay d2 => dac;
input => Delay d3 => dac;

//Hook delay lines back into themselves
d1 => d1; 
d2 => d2;
d3 => d3; 

//Set feedback./loss on all delay lines
0.5 => d1.gain => d2.gain => d3.gain;   

//Allocate memory (must do this ofr all delay lines above a couple ms) and set delay lengths using .max
//Bascially size of the room
0.06 :: second => d1.max => d1.delay;
0.08 :: second => d2.max => d2.delay;
0.10 :: second => d3.max => d3.delay;

//5 seconds of reverb record
while (1)
{
    5.0 :: second => now;
}

