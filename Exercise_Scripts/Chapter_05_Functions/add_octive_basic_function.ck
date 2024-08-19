// A simple function example

//Declare function
fun int addOctave(int note)
{
    int result;
    note + 12 => result;
    return result; 
}

//Add octave in music
SinOsc s => dac; 
60 => int myNote;

Std.mtof(myNote) => s.freq; 
second => now; 

myNote => addOctave => Std.mtof => s.freq; 
second => now; 
