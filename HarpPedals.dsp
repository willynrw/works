//HarpPedals
//Easily visualize how a pedal harp accesses different notes of the chromatic scale.
//(C) Willyn Whiting 2023
import("stdfaust.lib");

pluck1=button("[1]C"):si.smooth(0.999);
pluck2=button("[2]D"):si.smooth(0.999);
pluck3=button("[3]E"):si.smooth(0.999);
pluck4=button("[4]F"):si.smooth(0.999);
pluck5=button("[5]G"):si.smooth(0.999);
pluck6=button("[6]A"):si.smooth(0.999);
pluck7=button("[7]B"):si.smooth(0.999);
pluck8=button("[8]c"):si.smooth(0.999);

cPedal=hslider("[9.2]C.",0,-1,1,1);
dPedal=hslider("[9.1]D.",0,-1,1,1);
ePedal=hslider("[9.4]E.",0,-1,1,1);
fPedal=hslider("[9.5]F.",0,-1,1,1);
gPedal=hslider("[9.6]G.",0,-1,1,1);
aPedal=hslider("[9.7]A.",0,-1,1,1);
bPedal=hslider("[9.3]B.",0,-1,1,1);

note1=ba.midikey2hz(60-cPedal);
note2=ba.midikey2hz(62-dPedal);
note3=ba.midikey2hz(64-ePedal);
note4=ba.midikey2hz(65-fPedal);
note5=ba.midikey2hz(67-gPedal);
note6=ba.midikey2hz(69-aPedal);
note7=ba.midikey2hz(71-bPedal);
note8=ba.midikey2hz(72-cPedal);

env1=en.ar(0.01,1.4,pluck1);
env2=en.ar(0.01,1.3,pluck2);
env3=en.ar(0.01,1.2,pluck3);
env4=en.ar(0.01,1.1,pluck4);
env5=en.ar(0.01,1.0,pluck5);
env6=en.ar(0.01,0.9,pluck6);
env7=en.ar(0.01,0.8,pluck7);
env8=en.ar(0.01,0.7,pluck8);

cstring=os.triangle(note1)*pluck1*env1;
dstring=os.triangle(note2)*pluck2*env2;
estring=os.triangle(note3)*pluck3*env3;
fstring=os.triangle(note4)*pluck4*env4;
gstring=os.triangle(note5)*pluck5*env5;
astring=os.triangle(note6)*pluck6*env6;
bstring=os.triangle(note7)*pluck7*env7;
cstr=os.triangle(note8)*pluck8*env8;

vol=hslider("[0]VOL",0.5,0,1,0.01);

mix=cstring+dstring+estring+fstring+gstring+astring+bstring+cstr:>_*vol;
process=mix,mix;
