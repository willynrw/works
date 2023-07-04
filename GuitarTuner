//GuitarTuner
//Six triangle waves in equal-temperament for tuning to.
//(c) Willyn Whiting 2023
import("stdfaust.lib");

oct=checkbox("[0]Octave Up"):si.smooth(0.999);

vol=hslider("[1]VOL",5,0,10,0.1);

onoffE=checkbox("[2]E"):si.smooth(0.999);
sound1=os.triangle(82.41*(oct+1))*0.17*onoffE;
onoffA=checkbox("[3]A"):si.smooth(0.999);
sound2=os.triangle(110*(oct+1))*0.17*onoffA;
onoffD=checkbox("[4]D"):si.smooth(0.999);
sound3=os.triangle(146.83*(oct+1))*0.17*onoffD;
onoffg=checkbox("[5]g"):si.smooth(0.999);
sound4=os.triangle(196*(oct+1))*0.17*onoffg;
onoffb=checkbox("[6]b"):si.smooth(0.999);
sound5=os.triangle(246.94*(oct+1))*0.17*onoffb;
onoffe=checkbox("[7]e"):si.smooth(0.999);
sound6=os.triangle(329.63*(oct+1))*0.16*onoffe;

process=sound1,sound2,sound3,sound4,sound5,sound6:>_*(vol*0.1);
