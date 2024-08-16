//Final drum machine with SndBufs, panning, modulo, variables and loops

//Defines gains for left, right and center
Gain master[3]; //declare array for master gain with left 0, center 1 and right 2
master[0] => dac.left;
master[1] => dac; 
master[2] => dac.right; 

//declare SndBufs and connect to gain/panning
SndBuf kick => master[1]; 
SndBuf snare => master[1];
SndBuf hihat => master[2]; 
SndBuf cowbell => master[0]; 

//use Pan2 for hand claps with random panning
SndBuf claps => Pan2 claPan;
claPan.chan(0) => master[0]; //connects left channel of Pan2 to master gain left
claPan.chan(1) => master[2]; //connects right channel of Pan2 to master gain right

//load all sound files here
me.dir()+"/audio/kick_01.wav" => kick.read; 
me.dir()+"/audio/snare_01.wav" => snare.read; 
me.dir()+"/audio/hihat_01.wav" => hihat.read; 
me.dir()+"/audio/cowbell_01.wav" => cowbell.read; 
me.dir()+"/audio/clap_01.wav" => claps.read; 

//array for controlling cowbell hits
[1,0,1,0, 1,0,0,1, 0,1,0,1, 0,1,1,1] @=> int cowSeq[]; 

//controls length of measure..define using all caps
cowSeq.cap() => int MAX_BEAT; 

//modulo for controlling kick and snare...MOD is constant for modulo operator 
4 => int MOD; 

//master speed control (tempo)...used to control time 
0.15 ::second => dur tempo; 

//counters: one for beat and one for measure
0 => int beat;
0 => int measure; 

//main infinite loop to play pattern
while (true)
{
    //BD played on every 1 using modulo
    if (beat % 4 == 0)
    {
        0 => kick.pos; 
    }

    //after a time, play snare on off beat
    if(beat % 4 == 2 && measure %2 == 1)
    {
        0 => snare.pos; 
    }

    //after a time, randomly play CB or HH
    if (measure > 1)
    {
        if (cowSeq[beat])
        {
            0 => cowbell.pos; 
        }
        else
        {
            Math.random2f(0.0, 1.0) => hihat.gain;
            0 => hihat.pos; 
        }
    }
    //after a time play randonmly spaced claps at the end of each measure
    if (beat > 11 && measure > 3)
    {
        Math.random2f(-1.0, 1.0) => claPan.pan; 
        0 => claps.pos; 
    }
    
    tempo => now; //waits for one beat
    (beat + 1) % MAX_BEAT => beat; //then updates beat counter
    if (beat==0)//increments measure counter at each new measure
    {
        measure++; 
    }
}


