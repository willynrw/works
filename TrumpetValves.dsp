//TrumpetValves
//A pedagogical tool for understanding how valves and embouchure are meant to change the pitch of a trumpet.
//(c) Willyn Whiting 2023
import("stdfaust.lib");
tuning=vslider("[2]INSTRUMENT[style:menu{'IN Bb':0;'IN C':1;'IN D':2}]",0,0,2,1);
vol=hslider("[3]VOL",5,0,10,0.1);
harm=hslider("[4]PARTIAL",2,2,12,1);
onoff=checkbox("[1]ON"):si.smooth(0.999);
valve1=checkbox("[5]1"):si.smooth(0.999);
valve2=checkbox("[6]2"):si.smooth(0.999);
valve3=checkbox("[7]3"):si.smooth(0.999);
note=select3(tuning,46,48,50)-(valve1*2)-(valve2)-(valve3*3);
freq=ba.midikey2hz(note)*harm;
mix=os.sawtooth(freq)*(vol*0.1)*onoff;
process = mix,mix;
