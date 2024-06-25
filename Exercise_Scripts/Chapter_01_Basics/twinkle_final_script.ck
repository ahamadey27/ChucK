//twinkle with two oscillators
SinOsc s => dac; 
TriOsc t => dac; 

//main pitch variable
110.0 => float melody; 

//gain control for triangle wave melody 
0.3 => float onGain; 

//not and rest duration 
0.3 :: second => dur myDur; 

//only play t at first sweeping pitch upward 
onGain => t.gain;

0 => s.gain; //turns of sine 
while(melody < 220.0)
{
    melody => t.freq; 
    1.0 +=> melody; //steps up pitch by 1hz
    0.01 :: second => now; //every 1/100 second
}

//new pitches 
138.6 => s.freq;
1.5*melody => t.freq; 

//two more notes, 2nd twinkle
for (0 => int i; i < 2; i++)
{
    onGain => t.gain;
    myDur => now;
    0 => t.gain; 
    myDur => now; 
}

//pithces for little 
146.8 => s.freq; 
1.6837 * melody => t.freq; 

//play two notes for little 
for (0 => int i; i < 2; i++)
{
    onGain => t.gain;
    myDur => now;
    0 => t.gain; 
    myDur => now;
}

//set up and play star
138.6 => s.freq;
1.5*melody => t.freq; 
onGain => t.gain;
second => now;

//end by sweeping both oscillators to zero
for (330 => int i; i > 0; i--)
{
    i => t.freq;
    i*1.33 => s.freq;
    0.01 :: second => now; 
}
