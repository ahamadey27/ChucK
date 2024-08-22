//Recursive (function that calls itself) scale-playing function
Mandolin mand => dac;

//Recursive scale player
fun void recurScale(int note, dur rate)
{
    Std.mtof(note) => mand.freq;
    1 => mand.noteOn; //plays note using noteOn method
    rate => now;
    
    //only do it unil some limit is reached
    if (note > 40)
    {
        //Recursion that calls itself!!
        recurScale(note-1, 0.9*rate);      
    }
}

//Play a couple of scales
recurScale(80, 0.5 :: second);
recurScale(67, 1.0 :: second);

