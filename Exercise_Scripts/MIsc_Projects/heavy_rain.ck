// Light rain sound emulation with smoother, more natural modulation

// Create a noise generator to simulate rain
Noise rainNoise => LPF lowpass => Gain g => dac;  // Use noise for continuous raindrop texture

// Set the lowpass filter frequency to allow only the higher frequencies for delicate rain
3000.0 => lowpass.freq;
0.3 => g.gain;  // Set initial gain for the rain sound

// Create a subtle random modulator for natural fluctuations
SinOsc mod => blackhole;
0.1 => mod.freq;  // Slow modulation to create gentle rain variations

Noise randomMod => blackhole;  // Additional random modulator for unpredictability
0.01 => randomMod.gain;  // Very subtle random fluctuations

// Modulate the filter and gain to make the rain sound more dynamic
while(true) {
    // Smoothly modulate the filter frequency for variations in the rain sound
    3000.0 + (200.0 * mod.last()) + (50.0 * randomMod.last()) => lowpass.freq;
    
    // Random slight variations in gain for the rain intensity
    Math.random2f(0.25, 0.35) => g.gain;  // Keep the variations subtle for light rain

    // Short delay to continuously update parameters
    100::ms => now;
}
