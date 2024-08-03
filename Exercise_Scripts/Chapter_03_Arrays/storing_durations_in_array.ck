SqrOsc s => dac; 

//gains to seperate notes
0.7 => float onGain;
0.0 => float offGain; 

//declare and initiliaze array of MIDI notes
[57, 57, 64, 64, 66, 66, 64, 62, 62, 61, 61, 59, 59, 57] @=> int myNotes[]; 

//quarter note and half note durations
0.3 :: second => dur q;
0.8 :: second => dur h; 
[q, q, q, q, q, q, h, q, q, q, q, q, q, h] @=> dur myDurs[]; 
//loop for length of array
for(0 => int i; i < myNotes.cap(); i++)
{
    //set freq and gain to turn on note
    Std.mtof(myNotes[i]) => s.freq;
    onGain => s.gain;
    myDurs[i] => now;

    //turns off note to seperate from next
    offGain => s.gain;
    0.2 :: second => now; 
}