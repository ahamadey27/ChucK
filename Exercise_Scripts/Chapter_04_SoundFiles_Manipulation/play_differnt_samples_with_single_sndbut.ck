//playing multipls wav files with single buffer
SndBuf snare => dac; 

//make and fill an array with of sound with file paths and names
string snare_samples[3];
me.dir()+"/audio/snare_01.wav" => snare_samples[0]; 
me.dir()+"/audio/snare_02.wav" => snare_samples[1];
me.dir()+"/audio/snare_03.wav" => snare_samples[2];

while (true)
{
    //pick random number between 0 and #files
    Math.random2(0, snare_samples.cap()-1) => int which;//picks random number between 1 and 3
    //load that file
    snare_samples[which] => snare.read; 
    //let it play
    0.5 :: second => now; 
}
