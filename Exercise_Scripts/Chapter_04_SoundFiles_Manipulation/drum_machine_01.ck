//basic drum machine

SndBuf kick => Gain master => dac; //SndBf into a master mixer and Gain into dac
SndBuf snare => master; 

//load the samples
me.dir()+"/audio/kick_01.wav" => kick.read; 
me.dir()+"/audio/snare_01.wav" => snare.read; 

while (true)
{
    //beat 1 plays kick alone
    0 => kick.pos;
    0.6 :: second => now; 

    //plays both drums on beat 2..pos to 0 restarts start for sample
    0 => kick.pos;
    0 => snare.pos; 
    0.6 :: second => now; 
}

