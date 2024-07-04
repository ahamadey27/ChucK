//two sine waves in stereo
SinOsc l => dac.left;
SinOsc r => dac.right;
220 => l.freq;
600 => r.freq;
2 :: second => now; 