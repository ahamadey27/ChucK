//Sonify the factorial() function...ex. factorial(4) = 4*3*2*1

SinOsc s => dac; 

//reclusive factorial function
fun int factorial(int x)
{
    sonify(x); //sonify function so you can hear 
    if (x <= 1) return 1;
    
    else return (x*factorial(x-1));
           
}

//Function to sonift numbers
fun void sonify(int note)
{
    //Offset above middle C
    Std.mtof(60+(0.5 * note)) => s.freq;
    1.0 => s.gain;
    300 :: ms => now; 
    0.0 => s.gain;
    50 :: ms => now; 
}

sonify(factorial(2)); 
second => now; 
sonify(factorial(3)); 
second => now; 
sonify(factorial(4)); 
second => now; 
sonify(factorial(5)); 
second => now; 

