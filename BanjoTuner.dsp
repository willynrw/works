//BanjoTuner
//Five triangle waves for tuning a banjo to one of three tuning systems.
//(c) Willyn Whiting 2023
import("stdfaust.lib");
tuning=vslider("[1]TUNING[style:menu{'STANDARD - GDGBD':0;'DROP C - GCGBD':1;'DOUBLE C - GCGCD':2}]",0,0,2,1);
vol=hslider("[2]VOL",5,0,10,0.1);
onoff1=checkbox("[3]Drone"):si.smooth(0.999);
sound1=os.triangle(ba.midikey2hz(67))*0.2*onoff1;
onoff2=checkbox("[4]D or C"):si.smooth(0.999);
sound2=os.triangle(ba.midikey2hz(select3(tuning,50,48,48)))*0.2*onoff2;
onoff3=checkbox("[5]G"):si.smooth(0.999);
sound3=os.triangle(ba.midikey2hz(55))*0.2*onoff3;
onoff4=checkbox("[6]B or C"):si.smooth(0.999);
sound4=os.triangle(ba.midikey2hz(select3(tuning,59,59,60)))*0.2*onoff4;
onoff5=checkbox("[7]D"):si.smooth(0.999);
sound5=os.triangle(ba.midikey2hz(62))*0.2*onoff5;

mix=sound1,sound2,sound3,sound4,sound5:>_*(vol*0.1);
process=mix,mix;
