// Gentle stream sound emulation
Noise n1 => LPF lowpass1 => Gain g1 => dac;  // High-frequency layer
Noise n2 => BPF bandpass2 => Gain g2 => dac;  // Low-frequency layer

// Filter frequencies and Q factors
800.0 => lowpass1.freq;    // Lower high frequency for softer splashes
0.3 => g1.gain;            // Reduced gain for gentler splashes

600.0 => bandpass2.freq;   // Lower rumble frequency
150.0 => bandpass2.Q;      // Wider Q for smooth low frequencies
0.5 => g2.gain;            // Lower gain for softer deep water flow

// Modulation
SinOsc mod1 => blackhole;
0.02 => mod1.freq;

SinOsc mod2 => blackhole;
0.01 => mod2.freq;

Noise randomMod1 => blackhole;
0.01 => randomMod1.gain;

Noise randomMod2 => blackhole;
0.01 => randomMod2.gain;

// Dynamics
while (true) {
    800.0 + (100.0 * mod1.last()) + (20.0 * randomMod1.last()) => lowpass1.freq;
    Math.random2f(0.2, 0.3) => g1.gain;

    600.0 + (100.0 * mod2.last()) + (20.0 * randomMod2.last()) => bandpass2.freq;
    Math.random2f(0.4, 0.5) => g2.gain;

    100::ms => now;
}
