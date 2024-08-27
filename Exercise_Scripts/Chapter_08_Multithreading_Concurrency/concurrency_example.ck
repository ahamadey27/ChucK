//Example of concurrancy (two functions happening in parallel) ie. sporking

fun void funOne()
{
    Impulse funOne => dac.left;

    while (true)
    {
        <<<"funOne">>>;
        100 => funOne.next;
        250 :: ms => now;
    }
}

fun void funTwo()
{
    Impulse funTwo => dac.right;

    while (true)
    {
        <<<"funTwo">>>;
        100 => funTwo.next;
        1 :: second => now;
    }
}

//Spork each fucntion as child shred
spork ~ funOne();
spork ~ funTwo();

//Infinite time loops to serve as parent thread
while (true)
{
    1 :: second => now;
}