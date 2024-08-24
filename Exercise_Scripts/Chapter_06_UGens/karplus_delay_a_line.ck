Noise noise => ADSR env => DelayA str => dac; 

//hook string back into itself with OneZero filter
str => OneZero filter => str; 

//Set ADSR 
env.set(0.002 :: second, 0.002 :: second, 0.0, 0.1 :: second);

//Play random notes forever
while (true)
{
    Math.random2f(110.0, 440.0) :: samp => str.delay;
    1 => env.keyOn;
    0.3 :: second => now; 
}