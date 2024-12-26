// Audio setup
Noise n => LPF lp => Gain g => dac;

// Initial filter and gain settings
lp.freq( 300 );      // Smooth out noise
g.gain( 0.1 );       // Soft overall volume

// Wind movement modulation
SinOsc modFreq => blackhole;  // Modulator for wind shifts
modFreq.freq( 0.1 );          // Slow modulation frequency

// Continuous wind simulation
while( true )
{
    // Smoothly vary filter cutoff using SinOsc
    200 + modFreq.last() * 150 => lp.freq;
    
    // Slight gain variation for natural texture
    0.05 + Math.random2f( 0.01, 0.03 ) => g.gain;
    
    // Update every 50ms for continuous flow
    50::ms => now;
}
