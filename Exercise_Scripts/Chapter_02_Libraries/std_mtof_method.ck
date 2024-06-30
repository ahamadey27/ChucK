//sound chain

TriOsc t => dac;
0.4 => t.gain;

//For Loop
/*for(0 => int i; i < 127; i++)
{
    Std.mtof(i) => float Hz; //using std midi to frequency method to convert note number to requency
    <<< i, Hz >>>; //print out result
    Hz => t.freq; //updates frequency and set osciallator to Hz
    200::ms => now; //advances time
}*/

//While Loop
0 => int i;
while(i < 127)
{
   Std.mtof(i) => float Hz; 
    <<< i, Hz >>>;
    Hz => t.freq; 
    200::ms => now;
    i++; 

}