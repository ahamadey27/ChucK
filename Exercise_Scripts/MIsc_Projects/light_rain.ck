// Light, delicate rain sound with smooth sine wave modulation

// Create a noise generator to simulate light rain
Noise rainNoise => HPF highpass => LPF lowpass => Gain g => dac;  // High-pass + low-pass for a lighter texture

// Set the filter frequencies to allow more of the delicate, higher-pitched droplets
1000.0 => highpass.freq;   // Use a high-pass filter to remove low frequencies (rumble)
5000.0 => lowpass.freq;    // Low-pass filter to keep only light, higher frequencies

// Set the gain to a lower value for a gentler rain intensity
0.1 => g.gain;  // Lower the volume for lighter rain

// Create smooth sine wave modulation for natural variations
SinOsc mod => blackhole;
0.05 => mod.freq;  // Slow sine wave modulation for subtle, smooth changes

SinOsc mod2 => blackhole;
0.02 => mod2.freq;  // Additional slow sine wave for subtle fluctuations

// Modulate the filter and gain to make the rain sound smooth and natural
while(true) {
    // Use smooth sine wave modulation for gentle filter frequency variations
    5000.0 + (100.0 * mod.last()) + (50.0 * mod2.last()) => lowpass.freq;
    
    // Smooth, subtle gain fluctuations for light rain intensity
    0.5 + (0.03 * mod.last()) + (0.02 * mod2.last()) => g.gain;

    // Short delay to continuously update parameters
    100::ms => now;
}
