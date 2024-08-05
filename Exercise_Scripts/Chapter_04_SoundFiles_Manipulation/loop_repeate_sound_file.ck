//connects sound buffer through Pan2 panner object of the DAC
SndBuf mySound => Pan2 pan => dac; 

//get file path and load all in one line
me.dir()+"audio/cowbell_01.wav" => mySound.read; 

//plays sound in an infinite loop
while (true)
{
    //random gain, rate (pitch), and pan with each loop
    Math.random2f(0.1, 1.0) => mySound.gain;
    Math.random2f(-1.0, 1.0) => pan.pan; 
    Math.random2f(0.2, 1.8) => mySound.rate; 

    //restarts sound by setting position to 0
    0 => mySound.pos; 

    //advance time so we hear it
    500.0 :: ms => now; 

}