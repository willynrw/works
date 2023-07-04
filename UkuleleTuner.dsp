//UkuleleTuner
//Four triangle waves to tune 3 different sizes of ukelele to one of 2 tuning systems.
//(c) Willyn Whiting 2023

import("stdfaust.lib");
inst=vslider("[1]SIZE[style:menu{'SOPRANO/CONCERT/TENOR':0;'POCKET':1;'BARITONE':2}]",0,0,2,1);
tuning=vslider("[1]TUNING[style:menu{'STANDARD':0;'TRADITIONAL(WHOLE STEP UP)':1}]",0,0,2,1);
vol=hslider("[2]VOL",5,0,10,0.1);
note1=select2(tuning,67,69)+select3(inst,0,5,-5)+select3(inst,0,0,-12);
note2=select2(tuning,60,62)+select3(inst,0,5,-5);
note3=select2(tuning,64,66)+select3(inst,0,5,-5);
note4=select2(tuning,69,71)+select3(inst,0,5,-5);
freq1=ba.midikey2hz(note1);
freq2=ba.midikey2hz(note2);
freq3=ba.midikey2hz(note3);
freq4=ba.midikey2hz(note4);
onoffG=checkbox("[3]G"):si.smooth(0.999);
sound1=os.triangle(freq1)*0.2*onoffG;
onoffC=checkbox("[4]C"):si.smooth(0.999);
sound2=os.triangle(freq2)*0.2*onoffC;
onoffE=checkbox("[5]E"):si.smooth(0.999);
sound3=os.triangle(freq3)*0.2*onoffE;
onoffA=checkbox("[6]A"):si.smooth(0.999);
sound4=os.triangle(freq4)*0.2*onoffA;

mix=sound1,sound2,sound3,sound4:>_*(vol*0.1);
process=mix,mix;
