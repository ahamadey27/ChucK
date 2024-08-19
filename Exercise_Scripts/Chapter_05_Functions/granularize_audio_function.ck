//Creating and using granularize() funciton to chop up audio

//Makes and conntects a stereo sound buffer
SndBuf2 click => dac; 

//read sound file
me.dir() + "/audio/stereo_fx_01.wav" => click.read; 

//Define function to hack any sound file
fun void granularize(SndBuf myWav, int steps)
{
    myWav.samples()/steps => int grain; //calulates grain size using .samples() method
    Math.random2(0, myWav.samples() - grain) + grain => myWav.pos; //sets play pointer to random grain location in buffer
    grain :: samp => now; //sample refers to the duration of a single audio sample 
}

//Main program that calls function
while (true)
{
    granularize(click, 70); 

}