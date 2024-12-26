

// Create a noise generator
Noise n => BPF bandpass => dac 

// Set the frequency of the bandpass filter
1000.0 => bandpass.freq;
100.0 => bandpass.Q;

// Set noise gain (volume)
0.4 => n.gain;

// Create a fast random modulator for aggressive fluctuations
SinOsc mod => blackhole;
0.4 => mod.gain;
0.8 => mod.freq;

// Create a secondary modulator for more randomness
SinOsc mod2 => blackhole;
0.2 => mod2.gain;
0.3 => mod2.freq;

// Duration of the recording (e.g., 10 seconds)
10::second => dur recordingTime;

// Start the wind sound
spork ~ play_wind();

// Record for a specific amount of time
recordingTime => now;

// Close the recording file to ensure it's properly written to disk
wavRec.closeFile();

// Wind generation function
fun void play_wind()
{
    while (true)
    {
        // Get the modulated values from the oscillators
        mod.last() => float mod_value;
        mod2.last() => float mod2_value;

        // Aggressively modulate the bandpass filter frequency
        1000.0 + (500.0 * mod_value) + (300.0 * mod2_value) => bandpass.freq;

        // Randomized amplitude to simulate harsh wind gusts
        Math.random2f(0.3, 0.6) => n.gain;

        // Wait for a short period to update the parameters
        25::ms => now;
    }
}
