SinOsc s => dac; 

//loop
for (20 => int i; i < 400; i++)
{
    <<< i >>>; //prints loop counter value 
    i => s.freq; //set freq to i
    10::ms => now; //advances time

}