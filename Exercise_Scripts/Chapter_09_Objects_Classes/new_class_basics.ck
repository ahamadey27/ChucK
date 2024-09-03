//Making and using your first new class, testData

//Simple class to show access 
public class testData
{
    1 => int myInt;
    0.0 => float myFrac;;

    //Simple function that adds data
    fun float sum()
    {
        return myInt + myFrac;
    }
}

//Make one instance of testData object as "d"
testData d;
//Invoke current class function with .sum()
<<< d.myInt, d.myFrac, d.sum() >>>;

//Change data variables
3 => d.myInt;
0.1452 => d.myFrac;

//Check to show that variables have changed
<<< d.myInt, d.myFrac, d.sum() >>>;



