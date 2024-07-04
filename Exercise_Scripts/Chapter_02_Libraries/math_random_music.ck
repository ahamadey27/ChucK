SqrOsc s => dac; 
Math.srandom(250); //sets seed

for(0 => int i; i < 16; i++) //loop plays for 16 notes
{
    Math.random2(48, 72) => int myNote; //random int note between C2 - C5
    Math.random2f(0.05, 0.9) => float myGain; //Random gain value

    <<< myNote, myGain >>>; 

    Std.mtof(myNote) => s.freq; //set osillator freq
    myGain => s.gain; //and gain
    0.2 :: second => now; //each not sound for a 1/5 of a second 
}