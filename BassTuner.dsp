//Bass Tuner
//Five triangle waves to tune your 5 or 4 string bass to.
//(c) Willyn Whiting 2023
import("stdfaust.lib");

oct=checkbox("[1]Octave Up"):si.smooth(0.999);

onoffB=checkbox("[3](B)"):si.smooth(0.999);

sound1=os.triangle(30.87*(oct+1))*0.2*onoffB;
onoffE=checkbox("[4]E"):si.smooth(0.999);
sound2=os.triangle(41.20*(oct+1))*0.2*onoffE;
onoffA=checkbox("[5]A"):si.smooth(0.999);
sound3=os.triangle(55*(oct+1))*0.2*onoffA;
onoffD=checkbox("[6]D"):si.smooth(0.999);
sound4=os.triangle(73.42*(oct+1))*0.2*onoffD;
onoffg=checkbox("[7]G"):si.smooth(0.999);
sound5=os.triangle(98*(oct+1))*0.2*onoffg;

vol=hslider("[2]VOL",5,0,10,0.1);

process=sound1,sound2,sound3,sound4,sound5:>_*(vol*0.1);
