// Audio setup
Noise n => LPF lp => Gain g => dac;

// Initial settings
lp.freq( 150 );   // Deeper wind effect
g.gain( 0.06 );   // Softer output gain

// Subtle wind simulation
while( true )
{
    // Gentle, barely changing frequency
    140 + Math.random2f( -5, 5 ) => lp.freq;
    0.05 + Math.random2f( 0.002, 0.01 ) => g.gain;
    
    // Slower change
    700::ms => now;
}
