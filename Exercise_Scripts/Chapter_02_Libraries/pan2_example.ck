SinOsc s => Pan2 p => dac; //Pan2 is bascially a stereo out 

//initialize pan position to hard left
-1.0 => float panPosition;

//loop to vary paning
while(panPosition < 1.0)  //...unitl it hits hard right
{
    panPosition => p.pan; //sets new position
    <<< panPosition >>>;
    panPosition + 0.01 => panPosition; //adds small incriments
    10 :: ms => now;
}