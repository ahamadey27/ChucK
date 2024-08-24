//Impulse-excitation of resonant filter drives
// three delay lines feeding back into themselves

Impulse imp => ResonZ filt => Gain input => dac;
100.0 => filt.Q;
100.0 => filt.gain;
1.0 => input.gain;

//Make arrays for UGens
Delay del[3];

//Stereo delay lines
input => del[0] => dac.left;
input => del[1] => dac;
input => del[2] => dac.right;

//Set up all delay liens
for (0 => int i; i < 3; i++)
{
    del[i] => del[i];
    0.6 => del[i].gain;
    (0.8 + i*0.3) :: second => del[i].max => del[i].delay;
}

//Define note array for melody 
[60, 64, 67, 72, 76, 79, 84] @=> int notes[];
notes.cap() - 1 => int numNotes; 

while (true)
{
    Std.mtof(notes[Math.random2(0, numNotes)]) => filt.freq; //plays random notes though rez freq
    1.0 => imp.next; //impulse to output 100 only on next sample
    0.4 :: second => now;
}