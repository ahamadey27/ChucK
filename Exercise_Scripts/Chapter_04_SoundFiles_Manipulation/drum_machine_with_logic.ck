//A drum machine with logic

SndBuf kick => Gain master => dac; 
SndBuf snare => master; 

me.dir()+"/audio/kick_01.wav" => kick.read;
me.dir()+"/audio/snare_01.wav" => snare.read;

//decalare a new tempo..tempo duration is time between beats 
0.15 :: second => dur tempo; 

while (true)
{
    for (0 => int beat; beat < 16; beat++) //loops over a measure of 16 beats***
    {
        //plays BD on beats 0, 4, 8, 12
        if (beat==0 || beat==4 || beat==8 || beat==12)
        {
            0 => kick.pos;
        }

        //plays SD on beats 4, 10, 13, 14
        if (beat==4 || beat==10 || beat==13 || beat==14)
        {
            0 => snare.pos; 
        }
        tempo => now; 
    }
}