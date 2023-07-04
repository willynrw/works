//HornValves
//A pedagogical tool for understanding how valves and embouchure are meant to change the pitch of a French Horn in F.
//(c) Willyn Whiting 2023
import("stdfaust.lib");
vol=hslider("[3]VOL",5,0,10,0.1);
harm=hslider("[4]PARTIAL",4,2,32,1);
onoff=checkbox("[1]ON"):si.smooth(0.999);
valve1=checkbox("[5]1"):si.smooth(0.999);
valve2=checkbox("[6]2"):si.smooth(0.999);
valve3=checkbox("[7]3"):si.smooth(0.999);
valve4=checkbox("[8]4"):si.smooth(0.999);
note=29-(valve1*2)-(valve2)-(valve3*3)-(valve4*5);
freq=ba.midikey2hz(note)*harm;
mix=os.sawtooth(freq)*(vol*0.1)*onoff;
process = mix,mix;
