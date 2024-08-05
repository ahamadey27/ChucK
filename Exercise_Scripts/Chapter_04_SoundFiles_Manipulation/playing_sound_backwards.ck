SndBuf mySound => dac; 

me.dir()+"/audio/hihat_04.wav" => mySound.read; 

//asks the sound how long it is
mySound.samples() => int numSamples; 

//play sound once forward
0 => mySound.pos; 
numSamples :: samp => now; //lets it play that long from previous line

//and once backwards
numSamples => mySound.pos;
-1.0 => mySound.rate; 
numSamples :: samp => now; 