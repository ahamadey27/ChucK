//Playing chords on an array of SinOsc using a funciton
SinOsc chord [3]; 

for (0 => int i; i < chord.cap(); i++)
{
    //Connect each element off array to dac
    chord[i] => dac;
    //Adjust gain
    1.0/chord.cap() => chord[i].gain;
}

fun void playChord(int root, string third, dur howLong)
{
    //Set root of chord
    Std.mtof(root) => chord[0].freq;
    
    //set 5th of chord
    Std.mtof(root+7) => chord[2].freq;
    
    //set 3rd (major or minor)
    if (third == "major")
    {
        Std.mtof(root+4) => chord[1].freq;
    }
    else if (third == "minor") //else if like second if must have else afer
    {
        Std.mtof(root+3) => chord[1].freq;
    }
    else
    {
        <<< "You must specify third" >>>; 
    }
    
    howLong => now; 
}

//Main program that randomizes 1st and 3rd chord dur
while (true)
{
    //Plays minor chord on a random note
    playChord(Std.rand2(70, 82), "minor", second*Std.rand2(1,5));
    //Cm chord
    playChord(60, "minor", second/2);
    //C chord
    playChord(60, "major", second/Std.rand2(2,6));
}