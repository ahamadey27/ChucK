//global variables 
Mandolin mand => dac; //UGen instrument
60 => int note; 

//Note up function...no arguments because operate on global variables
fun void noteUp()
{
    1 +=> note; //note half-step up
    <<< note >>>; //prints note value
    play(); //calls play function
}

fun void noteDown()
{
    1 -=> note; //note half-step down
    <<< note >>>; //prints note
    play(); //call play function  
}

//Play global note on on global mand UG
fun void play()
{
    Std.mtof(note) => mand.freq; 
    1 => mand.noteOn; //use noteOn function to play UGen instrument
    0.1 :: second => now; //plays for second before returning to main loop
}

//Main program, graudally rising medlody
while (true)
{
    noteUp();
    noteDown();
    noteUp();
    noteUp();
    noteDown();
}