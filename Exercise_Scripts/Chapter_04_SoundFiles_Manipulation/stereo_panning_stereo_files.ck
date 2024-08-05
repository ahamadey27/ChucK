//loading and panning stereo sound files with random pan, pitcha nd gain modulation

//declate and load a streo file
SndBuf2 myStereoSound; 
me.dir()+"/audio/stereo_fx_03.wav" => myStereoSound.read; 

//make Gain UGen array for stereo volume control
Gain bal[2]; 

//connect everything up in stereo 
myStereoSound.chan(0) => bal[0] => dac.left; 
myStereoSound.chan(1) => bal[1] => dac.right;

//set soundfile on infinite loop using the .loop funftion
1 => myStereoSound.loop; 

while (true)
{
    //pick random playback rate and panning
    Math.random2f(0.2, 1.8) => myStereoSound.rate;
    Math.random2f(-1.0, 1.0) => float balance; 

    //turn balance into left right gain between 1 and 0
    (balance+1)/2.0 => float rightGain; 
    1.0 - rightGain => float leftGain; 
    leftGain => bal[0].gain; 
    rightGain => bal[1].gain; 

    0.3 :: second => now; 
}