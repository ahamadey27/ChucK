//Recursive drum roll using Impulse Gen
Impulse imp => dac; 

fun int impRoll(int index)
{
    if (index >= 1)
    {
        1.0 => imp.next;
        index::ms => now; 
        return impRoll(index-1);
    }
    else 
    {
        return 0; 
    }
}

impRoll(20);
second => now; 
impRoll(40);
second => now; 
impRoll(60);
second => now; 