// Create unit generators
Noise wind => LPF filter => Gain amp => JCRev reverb => dac;

// Set base parameters
wind.gain(0.2);         // Softer noise level
filter.freq(800);       // Filter cutoff for smoothness
filter.Q(0.4);          // Reduce resonance
amp.gain(0.1);          // Final output level

// Reverb settings
reverb.mix(0.05);        // Subtle reverb mix

// Slow-moving modulations for dynamic wind changes
SinOsc modFreq => blackhole;
modFreq.freq(0.05);     // Slow filter movement

SinOsc modAmp => blackhole;
modAmp.freq(0.02);      // Slow amplitude variation

// Additional modulation for organic feel
SinOsc modMod => blackhole;
modMod.freq(0.01);      // Slow modulator for randomness

// Declare modShift outside the loop
float modShift;

// Main wind generation loop
while (true) {
    // Correct assignment using => operator
    modMod.last() * 0.02 => modShift;

    // Smoothly modulate filter frequency
    Math.max(300, 600 + (modFreq.last() + modShift) * 200) => filter.freq;
    
    // Smooth amplitude modulation
    0.08 + 0.02 * (modAmp.last() + modShift) => amp.gain;
    
    // Update sound every 50 milliseconds
    50::ms => now;
}
