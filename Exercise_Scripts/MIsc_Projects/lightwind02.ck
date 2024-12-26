// Audio setup
Noise n => LPF lp => Gain g => dac;

// Initial settings
lp.freq( 250 );   // Soft filtering
g.gain( 0.08 );   // Lower output gain

// Wind simulation with subtle changes
while( true )
{
    // Minimal variation in frequency and gain
    240 + Math.random2f( -10, 10 ) => lp.freq;
    0.07 + Math.random2f( 0.005, 0.02 ) => g.gain;
    
    // Slower update for steady wind
    500::ms => now;
}
