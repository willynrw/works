//FullSine
//Sine tone generator from 20-20000Hz for audio testing.
//(c) Willyn Whiting 2023
import("stdfaust.lib");
onoff=checkbox("[1]ON"):si.smooth(0.999);
vol=hslider("[2]VOL",0.5,0,1,0.01);
freq=hslider("[3]Hz[scale:log]",500,20,20000,0.01);
tone=os.osc(freq)*onoff*vol;
process=tone,tone;
