//High Frequency Test
//Sine tone generator from 10-20kHz. For testing the upper limits of one's hearing.
//(c) Willyn Whiting 2023
import("stdfaust.lib");
onoff=checkbox("[1]ON"):si.smooth(0.99999);
vol=hslider("[2]VOL",0.1,0,1,0.01);
freq=hslider("[3]Hz[scale:log]",10000,10000,20000,0.01);
tone=os.osc(freq)*vol*onoff;
process=tone,tone;
