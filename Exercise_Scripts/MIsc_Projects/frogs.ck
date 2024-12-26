// Number of frogs (oscillators)
5 => int numFrogs;

// Create arrays for oscillators, gains, and filters
PulseOsc frogs[numFrogs];
Gain gains[numFrogs];

// Set up each frog's frequency and chirp pattern
for (0 => int i; i < numFrogs; i++) {
    // Set up the pulse oscillator for each frog
    frogs[i] => gains[i] => dac;

    // Set frequency for frog chirp (low to mid-pitch for frog sounds)
    Math.random2f(80.0, 600.0) => frogs[i].freq;

    // Set gain for each frog (slightly randomized for natural variation)
    Math.random2f(0.05, 0.1) => gains[i].gain;
    
    // Set initial pulse width (modulated later)
    0.2 => frogs[i].width;
}

// Function to simulate frog chirping patterns with pulse width modulation
fun void chirpFrog(int i) {
    while (true) {
        // Turn off chirp (silence between chirps)
        0.0 => gains[i].gain;
        (Math.random2f(300, 1000) :: ms) => now; // Random pause duration between chirps

        // Modulate pulse width randomly
        Math.random2f(0.1, 0.5) => frogs[i].width;  // Random pulse width modulation

        // Turn on chirp with randomized gain and duration
        Math.random2f(0.1, 0.3) => gains[i].gain;
        (Math.random2f(20, 100) :: ms) => now;  // Duration of each chirp (short bursts)

        // Turn off chirp again
        0.0 => gains[i].gain;
        (Math.random2f(300, 1000) :: ms) => now;  // Random pause before the next chirp
    }
}

// Spork a separate chirp pattern for each frog with pulse width modulation
for (0 => int i; i < numFrogs; i++) {
    spork ~ chirpFrog(i);
}

// Run indefinitely
while (true) {
    1::second => now;
}
