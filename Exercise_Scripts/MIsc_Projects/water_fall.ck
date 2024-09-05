// Waterfall sound emulation with multiple layers of noise

// Create two layers of white noise to represent the splashy and deep flow of water
Noise n1 => LPF lowpass1 => Gain g1 => dac;  // High-frequency splash layer
Noise n2 => BPF bandpass2 => Gain g2 => dac;  // Low-frequency roar layer

// Set filter frequencies and Q factors
1000.0 => lowpass1.freq;    // High frequency for splashing water
0.5 => g1.gain;             // Set gain for the high-frequency splashes

900.0 => bandpass2.freq;    // Low-frequency rumble for deep water flow
200.0 => bandpass2.Q;       // Set Q to allow a wide range of low frequencies
0.7 => g2.gain;             // Set gain for the low-frequency layer

// Create modulation for the natural fluctuations in the waterfall's flow
SinOsc mod1 => blackhole;   // Modulate the splashy water
0.05 => mod1.freq;          // Slow, subtle changes to simulate water dynamics

SinOsc mod2 => blackhole;   // Modulate the deep roaring water
0.02 => mod2.freq;          // Even slower, for the deep flow of water

// Add random modulation for unpredictable changes in the waterfall sound
Noise randomMod1 => blackhole;
0.03 => randomMod1.gain;

Noise randomMod2 => blackhole;
0.02 => randomMod2.gain;

// Modulate the filters and gains to create natural dynamics
while (true) {
    // High-frequency splashes modulation
    1000.0 + (200.0 * mod1.last()) + (50.0 * randomMod1.last()) => lowpass1.freq;
    Math.random2f(0.4, 0.6) => g1.gain;   // Randomly fluctuate gain for splashing layer

    // Low-frequency water rumble modulation
    300.0 + (150.0 * mod2.last()) + (30.0 * randomMod2.last()) => bandpass2.freq;
    Math.random2f(0.6, 0.9) => g2.gain;   // Randomly fluctuate gain for deep water layer

    // Short delay before updating the parameters again
    50::ms => now;
}
