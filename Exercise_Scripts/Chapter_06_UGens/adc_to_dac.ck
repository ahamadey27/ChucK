//Connection audio input to output using adc and dac UGens
adc => Gain g => dac; 

//Run for 10 seconds 
10.0 :: second => now; 