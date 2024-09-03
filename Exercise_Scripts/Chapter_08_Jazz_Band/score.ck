//Score script that arrabges the other jazz "player" scripts

//Start piano
Machine.add(me.dir()+"/piano.ck") => int pianoID;
4.8 :: second => now;

//Start Drums 
me.dir()+"/drums.ck" => string drumsPath;
Machine.add(drumsPath) => int drumsID;
4.8 :: second => now;

//Start Bass
Machine.add(me.dir()+"/bass.ck") => int bassID;

//Start Flute
Machine.add(me.dir()+"/flute.ck") => int fluteID;
4.8 :: second => now;

//Removes Drums
Machine.remove(drumsID);
4.8 :: second => now;

//Adds Drums back in
Machine.add(me.dir()+"/drums.ck") => drumsID;