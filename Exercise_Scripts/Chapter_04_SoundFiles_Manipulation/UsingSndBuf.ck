//use SndBuf to play a sound file

SndBuf mySound => dac;

//get file path
me.dir() => string path; //me.dir() gets current working directory

//sound file we want to play
"/audio/snare_01.wav" => string filename; 

//+ sign connects strings!
path+filename => filename;

//tell SndBuf to read this file...chucking a string to the .read member of SndBuf causes it to load file
filename => mySound.read; 

//set gain 
0.5 => mySound.gain; 

//play sound from beginning by chucking a number to the.pos member of of SndBuf causes it to start playing from that posittion in array
0 => mySound.pos; 

second => now; 