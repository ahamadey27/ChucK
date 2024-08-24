//Pass noise through LPF
Noise noise => LPF lpf => dac; 

//Set Freq and Q
500.0 => lpf.freq;
100.0 => lpf.Q;


while(true)
{
    // Gently modulate the frequency with subtle randomness
    (500.0 + Math.random2f(-20.0, 30.0)) => lpf.freq;
    
    // Short wait time to smooth the modulation
    10::ms => now;
}