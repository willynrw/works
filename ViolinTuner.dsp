//ViolinTuner
//Four triangle waves in just-fifths for tuning a Violin, Viola or Cello to A440 or another historical pitch standard.
//(c) Willyn Whiting 2023
import("stdfaust.lib");
tuning=vslider("[1]TUNING[style:menu{'VIOLIN - GDAE':0;'VIOLA - CGDA':1;'CELLO - CGDA':2}]",0,0,2,1);
vol=hslider("[2]VOL",5,0,10,0.1);
A=hslider("[3]A",440,390,455,0.5);

onoffG=checkbox("[6]IV"):si.smooth(0.999);
sound1=os.triangle(select3(tuning,A*2/3*2/3,A*2/3*2/3*2/3,A*2/3*2/3*2/3/2))*0.2*onoffG;
onoffC=checkbox("[5]III"):si.smooth(0.999);
sound2=os.triangle(select3(tuning,A*2/3,A*2/3*2/3,A*2/3*2/3/2))*0.2*onoffC;
onoffE=checkbox("[4]II"):si.smooth(0.999);
sound3=os.triangle(select3(tuning,A,A*2/3,A*2/3/2))*0.2*onoffE;
onoffA=checkbox("[3]I"):si.smooth(0.999);
sound4=os.triangle(select3(tuning,A*3/2,A,A/2))*0.2*onoffA;

mix=sound1,sound2,sound3,sound4:>_*(vol*0.1);
process=mix,mix;
