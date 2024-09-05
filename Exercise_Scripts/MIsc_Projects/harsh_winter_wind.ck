// Natural-sounding harsh winter wind emulation

// Create two white noise generators
Noise n1 => BPF bandpass1 => Gain g1 => dac;  // High-frequency noise layer
Noise n2 => BPF bandpass2 => Gain g2 => dac;  // Low-frequency rumble layer

// Set bandpass filter frequencies and Q factor (resonance)
500.0 => bandpass1.freq;   // High-frequency wind component
400.0 => bandpass1.Q;      // High Q for sharper wind but with more subtle modulation

200.0 => bandpass2.freq;   // Low-frequency rumble for a deep, bassy wind sound
100.0 => bandpass2.Q;      // Lower Q for a broader, rumbling wind sound

// Set noise gains to make the sound more natural and dynamic
0.05 => g1.gain;  // Lower gain for high-frequency wind to make it more subtle
3 => g2.gain;   // More prominent low-frequency rumble for a fuller sound

// Create sine wave oscillators for more natural modulation
SinOsc mod1 => blackhole;  // High-frequency wind modulation
0.05 => mod1.freq;         // Slow, subtle changes for high wind

SinOsc mod2 => blackhole;  // Low-frequency rumble modulation
0.07 => mod2.freq;         // Subtle, deeper modulations

// Add random modulation for more natural wind gusts
Noise randomMod => blackhole;
0.02 => randomMod.gain;  // More subtle and random fluctuations for gusty wind

// Modulate the bandpass filters and create wind dynamics
while(true) {
    // High-frequency layer modulation (gentler and more random)
    500.0 + (100.0 * mod1.last()) + (30.0 * randomMod.last()) => bandpass1.freq;
    
    // Low-frequency layer modulation (deeper and more rumbling)
    200.0 + (100.0 * mod2.last()) => bandpass2.freq;

    // Random slight variations in gain for both noise layers for natural wind movement
    Math.random2f(0.03, 0.06) => g1.gain;   // More subtle changes for the higher-frequency layer
    Math.random2f(0.5, 0.8) => g2.gain;     // Deeper, more powerful variations for the low-frequency layer

    // Short delay before updating parameters again
    50::ms => now;
}
