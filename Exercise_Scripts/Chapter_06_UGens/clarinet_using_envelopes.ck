//Simple clarinet sound

//Envelope applied to osciallator
SqrOsc clar => Envelope env => dac; 

//Initialize A note
55.0 => clar.freq; 

//Play up octave series
while (clar.freq() < 441.0)
{
    //Trigger envelope
    1 => env.keyOn; 
    0.2 :: second => now; 

    //Tell envelope to ramp down
    1 => env.keyOff; 
    0.2 :: second => now; 

    //Next note up the overtone series 
    clar.freq() + 55.0 => clar.freq; 
}