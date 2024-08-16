//make and load a couple SndBugs to "sonify" modulo (ie. display of data or process state though sound)
SndBuf clickhi => dac;
SndBuf clicklo => dac;
me.dir()+"/audio/click_02.wav" => clickhi.read;
me.dir()+"/audio/click_01.wav" => clicklo.read;

//define a number for modulo..always use MOD variable 
4 => int MOD;

for (0 => int beat; beat < 24; beat++) //24 measure pattern
{
    //print out beat and beat modulo MOD
    <<<beat, "Modulo ", MOD, "is: ", beat % MOD>>>; 

    //click this on every beat
    0 => clickhi.pos;

    //click this only on overy MODth beat
    if (beat % MOD ==0)
    {
        0 => clicklo.pos;
    }

    0.5 :: second => now; 

}
