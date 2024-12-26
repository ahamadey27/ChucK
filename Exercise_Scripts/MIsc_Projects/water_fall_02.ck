// Quiet waterfall emulation
Noise n1 => LPF lowpass1 => Gain g1 => dac;
Noise n2 => BPF bandpass2 => Gain g2 => dac;

1000.0 => lowpass1.freq;
0.2 => g1.gain;

700.0 => bandpass2.freq;
200.0 => bandpass2.Q;
0.3 => g2.gain;

SinOsc mod1 => blackhole;
0.01 => mod1.freq;

SinOsc mod2 => blackhole;
0.005 => mod2.freq;

Noise randomMod1 => blackhole;
0.005 => randomMod1.gain;

Noise randomMod2 => blackhole;
0.008 => randomMod2.gain;

while (true) {
    500.0 + (50.0 * mod1.last()) + (10.0 * randomMod1.last()) => lowpass1.freq;
    Math.random2f(0.06, 0.1) => g1.gain;

    400.0 + (50.0 * mod2.last()) + (10.0 * randomMod2.last()) => bandpass2.freq;
    Math.random2f(0.2, 0.2) => g2.gain;

    150::ms => now;
}

