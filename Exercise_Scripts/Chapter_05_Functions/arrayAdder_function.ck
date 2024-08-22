//Use the arrayAdder function to convert a scale from dorian to standard minor

//Connects Mandolin to to dac
Mandolin mand => dac; 

//Global scale array in C Dorian
[60, 62, 63, 65, 67, 69, 70, 72] @=> int scale[]; 

//Function to modidy an element of the array 
fun void arrayAdder(int temp[], int index)
{
    1 +=> temp[index];
}

//Play scale on mandolin
fun void playScale(int temp[])
{
    for (0 => int i; i < temp.cap(); i++)
    {
        Std.mtof(temp[i]) => mand.freq; 
        <<< i, temp[i] >>>;
        1 => mand.noteOn;
        0.4 :: second => now; 
    }
    second => now; 
} 

<<< "Original Scale" >>>; 
playScale(scale); 

arrayAdder(scale, 2);
arrayAdder(scale, 6);

<<< "Modified Scale: " >>>; 
playScale(scale); 