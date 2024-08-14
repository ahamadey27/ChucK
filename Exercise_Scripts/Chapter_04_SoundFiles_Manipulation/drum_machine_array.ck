// Drum machine using arrays 

SndBuf kick => Gain master => dac; 
SndBuf snare => master;
SndBuf hihat => master; 

me.dir()+"/audio/kick_01.wav" => kick.read; 
me.dir()+"/audio/snare_01.wav" => snare.read; 
me.dir()+"/audio/hihat_01.wav" => hihat.read; 
0.3 => hihat.gain; 
1 => snare.gain; 

0.15 :: second => dur tempo; //sets tempo

//scores (arrays) to tell drum when to play...using comments to break beat sequence 
[/*1*/1,0,0,0,/*2*/1,0,0,0,/*3*/1,0,0,0,/*4*/1,0,0,0] @=> int kickSeq[]; 
[/*1*/0,0,0,0,/*2*/1,0,0,0,/*3*/0,0,0,0,/*4*/1,0,0,1] @=> int snareSeq[]; 
[/*1*/0,0,1,0,/*2*/1,0,0,0,/*3*/0,0,1,0,/*4*/1,1,0,1] @=> int hihatSeq[];

while (true)
{
    0 => int beat; 
    while (beat < kickSeq.cap())
    {
        //plays BD based on array value
        if (kickSeq[beat])
        {
            0 => kick.pos; 
        }

        //plays SD based on array value
         if (snareSeq[beat])
        {
            0 => snare.pos; 
        }

        //plays HH based on array value
         if (hihatSeq[beat])
        {
            0 => hihat.pos; 
        }
        tempo => now; //advances time 
        beat++; //advacnes sequence to loop resets
    }
}