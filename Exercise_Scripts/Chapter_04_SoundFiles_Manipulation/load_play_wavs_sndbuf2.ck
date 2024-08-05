//loading and playing stereo sound files
SndBuf2 myStereoSound => dac; //SndBuf2 plays stereo wavs automatically and connects to dac
//load up a stereo file
me.dir()+"/audio/stereo_fx_01.wav" => myStereoSound.read; 

//plays for the length of wav file using .length() function, which returns the exact duration of sound file
myStereoSound.length() => now; 
