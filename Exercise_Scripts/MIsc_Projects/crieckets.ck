// Crickets sound emulation using pulse oscillators for chirps

// Number of crickets (oscillators)
5 => int numCrickets;

// Create arrays for oscillators and gains
PulseOsc crickets[numCrickets];
Gain gains[numCrickets];

// Set up each cricket's frequency and chirp pattern
for (0 => int i; i < numCrickets; i++) {
    // Set up the oscillator for each cricket
    crickets[i] => gains[i] => dac;

    // Set frequency for cricket chirp (high-pitched sound typical of crickets)
    Math.random2f(3500.0, 5000.0) => crickets[i].freq;

    // Set gain for each cricket (slightly randomized for natural variations)
    Math.random2f(0.05, 0.1) => gains[i].gain;
    
    // Set pulse width for sharper, short chirps
    0.1 => crickets[i].width;
}

// Function to simulate cricket chirping patterns
fun void chirpCricket(int i) {
    while (true) {
        // Turn off chirp (silence between chirps)
        0.0 => gains[i].gain;
        (Math.random2f(100, 300) :: ms) => now; // Random pause duration between chirps

        // Turn on chirp with a randomized gain
        Math.random2f(0.05, 0.1) => gains[i].gain;
        (Math.random2f(30, 70) :: ms) => now;   // Duration of each chirp

        // Turn off chirp again
        0.0 => gains[i].gain;
        (Math.random2f(200, 500) :: ms) => now; // Random pause between chirp cycles
    } 
}

// Spork a separate chirp pattern for each cricket
for (0 => int i; i < numCrickets; i++) {
    spork ~ chirpCricket(i);
}

// Run indefinitely
while (true) {
    1::second => now;
}
