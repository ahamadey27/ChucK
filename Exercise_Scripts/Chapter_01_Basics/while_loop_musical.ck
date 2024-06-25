SinOsc s => dac; 

//ititialize variable i
20 => int i;

//while loop
while (i < 500)
{
    <<< i >>>;
    i => s.freq; 
    20::ms => now; 
    i++; // update counter (very imporant)
}