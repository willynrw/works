//LowSine
//A Sine Wave Generator from 20-200Hz for audio testing.
//(c) Willyn Whiting 2023
import("stdfaust.lib");
onoff=checkbox("[1]ON"):si.smooth(0.999);
vol=hslider("[2]VOL",0.5,0,1,0.01);
freq=hslider("[3]Hz",100,20,200,0.01);
tone=os.osc(freq)*vol*onoff;
process=tone,tone;
