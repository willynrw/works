//TubaValves
//A pedagogical tool for understanding how valves and embouchure are meant to change the pitch of a Tuba or Euphonium.
//(c) Willyn Whiting 2023
import("stdfaust.lib");
inst=vslider("[2]INSTRUMENT[style:menu{'Bb TUBA':0;'C TUBA':1;'Bb EUPHONIUM':2}]",0,0,2,1);
vol=hslider("[3]VOL",5,0,10,0.1);
harm=hslider("[4]PARTIAL",2,2,16,1);
onoff=checkbox("[1]ON"):si.smooth(0.999);
valve1=checkbox("[5]1"):si.smooth(0.999);
valve2=checkbox("[6]2"):si.smooth(0.999);
valve3=checkbox("[7]3"):si.smooth(0.999);
valve4=checkbox("[8]4"):si.smooth(0.999);
note=select3(inst,22,24,34)-(valve1*2)-(valve2)-(valve3*3)-(valve4*5);
freq=ba.midikey2hz(note)*harm;
mix=os.sawtooth(freq)*(vol*0.1)*onoff;
process = mix,mix;
