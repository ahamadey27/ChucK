//Funciton to cut gain in half

SinOsc s => dac; 

//Define half gain function
fun float halfGain(float originalGain)
{
    return (originalGain*0.5);
}

//Prints original gain
<<<"Full Gain: ", s.gain() >>>; 
second => now;

//Prints halved gain
halfGain(s.gain()) => s.gain;
<<< "Gain is now half: ", s.gain() >>>; 
second => now; 