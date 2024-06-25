/*Random Triangle Wave Music
by Alex Hamadey 
*/

TriOsc t => dac;

//Infinite loop that runs forever

while (true)
{
    //randomly chooses frequency from 30 to 1000
    Math.random2(30,1000) => t.freq;

    ////randomly chooses duration of notes
    Math.random2f(30,1000) :: ms => now; 
}