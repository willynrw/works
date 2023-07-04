//Trombone Slide
//A pedagogical tool for understanding how slide, f trigger and embouchure are meant to change the pitch of a trombone.
//(c) Willyn Whiting 2023
import("stdfaust.lib");
inst=vslider("[2]INSTRUMENT[style:menu{'TROMBONE/BASS TROMBONE':0;'ALTO':1;'CONTRABASS':2}]",0,0,2,1);
vol=hslider("[3]VOL",5,0,10,0.1);
harm=hslider("[4]PARTIAL",2,2,12,1):si.smooth(0.99);
onoff=checkbox("[1]ON"):si.smooth(0.999);
slide=vslider("[5]SLIDE",0,0,6,0.01):si.smooth(0.99);
ftrigger=checkbox("[6]F TRIGGER"):si.smooth(0.999);
note=select3(inst,34,39,22)-(slide)-(ftrigger*5);
freq=ba.midikey2hz(note)*harm;
mix=os.sawtooth(freq)*(vol*0.1)*onoff;
process = mix,mix;
