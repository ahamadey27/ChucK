//Controlling differnt aspects of a sinle glocal object using concurrency

//Sound chain
ModalBar modal => NRev reverb => dac;

//Set reverb mix
.1 => reverb.mix;
//ModalBar preset 7
7 => modal.preset; 
.9 => modal.strikePosition;

//Spork detune as child shred...must do this before entering infinite loop
spork~ detune();

//Infinite time loop to serve as parent thread
while (true)
{
    1 => modal.strike;
    250 :: ms => now;
    .7 => modal.strike;
    250 :: ms => now;
    .9 => modal.strike;
    250 :: ms => now;
    repeat (4)
    {
        .5 => modal.strike;
        250 :: ms => now;
    }
}

//Function to vary tuing over time
fun void detune()
{
    while (true)
    {
        //Update frequency sine
        84 + Math.sin(now/second*.25*Math.PI) * 2 => Std.mtof => modal.freq;
        //Advance time and controls update rate
        5 ::ms => now; 
    }
}