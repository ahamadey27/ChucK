//Drum machine using patterns stored as arrays

//Sound chan: two drums
SndBuf kick => dac;
SndBuf snare => dac; 

//Load sound files
me.dir() + "/audio/kick_01.wav" => kick.read; 
me.dir() + "/audio/snare_01.wav" => snare.read;

//Set pointers at end to make no sound
kick.samples() => kick.pos;
snare.samples() => snare.pos; 

//Drum patterns as logical variables. Logic values play=1 / notPlay=0
[1,0,0,0, 1,0,0,0] @=> int kickPattern1[]; 
[1,0,1,0, 1,0,1,0] @=> int kickPattern2[]; 
[0,0,0,0, 1,0,0,0] @=> int snarePattern1[];
[0,0,0,1, 0,0,1,0] @=> int snarePattern2[];

//Function to play pattern arrays 
fun void playSection(int kickA[], int snareA[], float beatTime)
{
    for (0 => int i; i < kickA.cap(); i++)
    {
        if (kickA[i])
        {
            0 => kick.pos;
        }
        if (snareA[i])
        {
            0 => snare.pos;
        }
        
        beatTime :: second => now;
    }
}

//Main program Infinite Loop
while(true)
{
    playSection(kickPattern1, kickPattern2, 0.2);
    playSection(kickPattern2, kickPattern2, 0.2);
    playSection(kickPattern1, kickPattern1, 0.2);
    playSection(kickPattern2, kickPattern1, 0.2);
}
