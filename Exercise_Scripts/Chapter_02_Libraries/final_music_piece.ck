//2-part random music with panning

//two osciallatrs (melody and harmony)
SinOsc s => Pan2 mpan => dac;
TriOsc t => dac; 

//float variables to control gain
0.5 => t.gain;
0.5 => float onGain;
0.0 => float offGain;

//int variable to contrl MIDI melody
72 => int melodyNote;

while (true)
{
        //Set melody controlled random melody pitch
    Math.random2(-3, 3) +=> melodyNote; //must put 2 after randokm for two arguments (2f if two floats)

    if (melodyNote < 60)
    {
        60 => melodyNote; //lower limit on melody
    }
    if (melodyNote > 84)
    {
        84 => melodyNote; //upper limit of melody
    }

    //Set osc pitch
    Std.mtof(melodyNote) => s.freq; 

    //melody has random pan for each note
    Math.random2f(-1.0, 1.0) => mpan.pan; 

    //change harmony note on a dice roll
    if (Math.random2(2, 6) == 1)
    {
        Std.mtof(melodyNote-12) => t.freq;
    }

    //pick one of three duration
    Math.random2(1, 3)*0.2 => float myDur;

    //note on this is 80% duration
    onGain => s.gain;
    (myDur*0.8) :: second => now;

    //space between note is 20% of array duration
    offGain => s.gain;
    (myDur*0.2) :: second => now;

}
