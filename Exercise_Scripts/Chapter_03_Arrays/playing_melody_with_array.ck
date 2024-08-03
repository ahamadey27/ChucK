SqrOsc s => dac; 

//gains to seperate notes
0.7 => float onGain;
0.0 => float offGain; 

//declare and initiliaze array of MIDI notes
[57, 57, 64, 64, 66, 66, 64, 62, 62, 61, 61, 59, 59, 57] @=> int a[]; 

//loop for length of array....cap method tells total size of array 
for (0 => int i; i < a.cap(); i++)
{
    //prints index and array note
    <<< i, a[i] >>>;  

    //set freq and gain to turn on note
    Std.mtof(a[i]) => s.freq;
    onGain => s.gain;
    
    //logic to control note duration using if else statement
    if (i==6 || i==13)
    {
        0.8 :: second => now;
    }
    else
    {
        0.3 :: second => now; 
    }

    //turn off not to seperate from the next
    offGain => s.gain;
    0.2 :: second => now; 
}