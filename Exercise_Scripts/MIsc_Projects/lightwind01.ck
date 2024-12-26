// Audio setup
Noise n => LPF lp => Gain g => dac;

// Initial settings
lp.freq( 350 );   // Higher for airy sound
g.gain( 0.09 );   // Slightly louder

// Wind simulation with minimal movement
while( true )
{
    // Barely noticeable modulation
    345 + Math.random2f( -3, 3 ) => lp.freq;
    0.08 + Math.random2f( 0.001, 0.01 ) => g.gain;
    
    // Slower, steady wind
    600::ms => now;
}
