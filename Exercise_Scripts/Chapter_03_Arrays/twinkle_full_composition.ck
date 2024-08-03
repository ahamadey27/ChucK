//two oscillators: melody and harmony
SinOsc s => Pan2 mpan => dac;
TriOsc t => dac; 

0.5 => float onGain;
0.0 => float offGain; 

//declare and initiliaze array of MIDI notes
[57, 57, 64, 64, 66, 66, 64,
62, 62, 61, 61, 59, 59, 57] @=> int melNotes[]; 
[61, 61, 57, 61, 62, 62, 61,
59, 56, 57, 52, 52, 68, 69] @=> int harmNotes[]; 

//quarter and half note durations and initialize them into an array
0.5 :: second => dur q;
1.0 :: second => dur h; 
[q, q, q, q, q, q, h, q, q, q, q, q, q, h] @=> dur myDurs[]; 

//make one more array to hold words
["twin", "kle", "twin", "kle", "lit", "tle", 
"star", "how", "I", "won", "der", "what", "you", "are"] @=> string words[]; 

//loop over all arrays (make sure all arrays are the same length!)
for (0 => int i; i < melNotes.cap(); i++)
{
    //prints out index, MIDI notes and words from arrays
    <<< i, melNotes[i], harmNotes[i], words[i] >>>; 

    //set melody and harmony from arrays
    Std.mtof(melNotes[i]) => s.freq;
    Std.mtof(harmNotes[i]) => t.freq; 

    //melody has a random pan for each note
    Math.random2f(-1.0, 1.0) => mpan.pan; //two float arguments 

    //notes are on for 70% of duration from array
    onGain => s.gain => t.gain; //turns on both osciallates 
    0.7*myDurs[i] => now;

    //space between notes is 30% of array duration
    offGain => s.gain => t.gain; 
    0.3*myDurs[i] => now; 

}
