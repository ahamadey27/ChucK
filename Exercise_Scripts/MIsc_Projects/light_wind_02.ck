// Setup audio chain
SinOsc s => LPF lp => LiSa2 lisa => dac;

// Configure LiSa
lisa.duration( 1::second );   // Set buffer size
lisa.maxVoices( 40 );         // Maximum polyphony

// Set voice panning using a loop
for( 0 => int v; v < lisa.maxVoices(); v++ )
{
    lisa.pan( v, Math.random2f( 0, lisa.channels()-1 ) );
}

lisa.recRamp( 50::ms );   // Smoothing during recording

// Configure SinOsc
s.freq( 5000 );
s.gain( 0.25 );

// Setup frequency modulation
SinOsc freqmod => blackhole;
freqmod.freq( 40 );

// Start LiSa recording
lisa.record( true );
lisa.gain( 0.1 );

// Low-pass filter frequency
lp.freq( 2000 );

// Audio modulation loop
while( true )
{
    // Modulate oscillator properties
    s.freq( 5000 + freqmod.last() * 100 ); 
    s.gain( 0.25 + Math.random2f(-0.05, 0.05) );
    
    // Update time
    10::ms => now;
}
