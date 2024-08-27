//Parallel, multithreading, concurrant drum machine

//Define global durations 
1 :: second => dur whole;
whole / 2 => dur half;
whole / 4 => dur quarter;

//Kick drum function
fun void kick ()
{
    SndBuf kick => dac;
    me.dir() + "/audio/kick_01.wav" => kick.read;

    //Play every whole beat
    while (true)
    {
        whole => now;
        0 => kick.pos;
    }
}

//Snare drum function
fun void snare ()
{
    SndBuf snare => dac; 
    me.dir() + "/audio/snare_01.wav" => snare.read;

    //Play half note tempo
    while (true)
    {
        half => now;
        0 => snare.pos; 
    }
}

//Hi-hat function
fun void hihat()
{
    SndBuf hihat => dac;
    me.dir() + "/audio/hihat_01.wav" => hihat.read;

    //Play every quarter note
    while (true)
    {
        quarter => now;
        0 => hihat.pos;
    }

}


//Main program to spork each drum function individually
//Start with kick drum function for 2 measures 
spork ~ kick();
2*whole => now; 

//Spork snare drum function for 2 measures
spork ~ snare();
2*whole => now;

//Spork hi-hat function for 2 measures
spork ~ hihat();
2*whole => now; 

//Main program to spork each drum function at the same time
//spork ~ kick();
//spork ~ snare();
//spork ~ hihat();


//Run entire program for 8 measures
8*whole => now; 