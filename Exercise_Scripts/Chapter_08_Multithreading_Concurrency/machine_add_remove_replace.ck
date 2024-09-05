//Using Machine.add, Machine.remove, and Machine.replace to add, remove, and replace machines in a group
//This is bascially how to using other ChucK scripts to make an arrangement 
Machine.add(me.dir()+"/concurrency_example.ck") => int conEx;
2.0 :: second => now; 
Machine.add(me.dir()+"/concurrent_drum_machine.ck") => int conDrMach;
6.0 :: second => now;
Machine.add(me.dir()+"/single_global_object_using_concurrency.ck") => int singGlobal;
4.0 :: second => now; 
Machine.remove(singGlobal);
2.0 :: second => now;
//Replaces conEx chuck script with ingGlobal chuck script
Machine.replace(conEx, me.dir()+"/single_global_object_using_concurrency.ck") => singGlobal;
4.0 :: second => now;
Machine.remove(singGlobal);
