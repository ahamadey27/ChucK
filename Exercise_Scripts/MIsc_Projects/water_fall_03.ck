// Powerful waterfall emulation
Noise n1 => LPF lowpass1 => Gain g1 => dac;
Noise n2 => BPF bandpass2 => Gain g2 => dac;

1500.0 => lowpass1.freq;
0.7 => g1.gain;

1200.0 => bandpass2.freq;
300.0 => bandpass2.Q;
0.9 => g2.gain;

SinOsc mod1 => blackhole;
0.01 => mod1.freq;

SinOsc mod2 => blackhole;
0.05 => mod2.freq;

Noise randomMod1 => blackhole;
0.05 => randomMod1.gain;

Noise randomMod2 => blackhole;
0.04 => randomMod2.gain;

while (true) {
    1500.0 + (300.0 * mod1.last()) + (70.0 * randomMod1.last()) => lowpass1.freq;
    Math.random2f(0.6, 0.8) => g1.gain;

    1200.0 + (300.0 * mod2.last()) + (70.0 * randomMod2.last()) => bandpass2.freq;
    Math.random2f(0.7, 1.0) => g2.gain;

    30::ms => now;
}
