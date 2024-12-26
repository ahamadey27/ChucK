// Noise generator for white noise
Noise whiteNoise => HPF highPass => dac;
highPass.freq(200000); // Set high-pass filter frequency

// Slow-moving modulations for dynamic wind changes
SinOsc modFreq => blackhole;
modFreq.freq(.08);     // Slow filter movement

SinOsc modAmp => blackhole;
modAmp.freq(.1);      // Slow amplitude variation

// Additional modulation for organic feel
SinOsc modMod => blackhole;
modMod.freq(0.1);      // Slow modulator for randomness

// Declare modShift outside the loop
float modShift;

// Main wind generation loop
while (true) {
    // Correct assignment using => operator
    modMod.last() * 1 => modShift;

    // Smoothly modulate filter frequency
    Math.max(2000, 5000 + (modFreq.last() + modShift) * 200) => highPass.freq;
    
    // Smooth amplitude modulation
    0.1 + 0.02 * (modAmp.last() + modShift) => whiteNoise.gain;
    
    // Update sound every 50 milliseconds
    50::ms => now;
}
