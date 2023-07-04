//NoiseGenerator
//Five, full frequency spectrum, bands of colored noise for audio testing.
//(c) Willyn Whiting 2023
import("stdfaust.lib");

vol=hslider("VOL",1,0,1,0.01);

onoff1=checkbox("[1]~BROWN~"):si.smooth(0.999);
noise1=no.colored_noise(4,-1)*0.2*onoff1;
onoff2=checkbox("[2]~PINK~"):si.smooth(0.999);
noise2=no.colored_noise(4,-0.5)*0.2*onoff2;
onoff3=checkbox("[3]~WHITE~"):si.smooth(0.999);
noise3=no.colored_noise(4,0)*0.2*onoff3;
onoff4=checkbox("[4]~BLUE~"):si.smooth(0.999);
noise4=no.colored_noise(4,0.5)*0.2*onoff4;
onoff5=checkbox("[5]~PURPLE~"):si.smooth(0.999);
noise5=no.colored_noise(4,0.5)*0.2*onoff5;

mix=noise1+noise2+noise3+noise4+noise5:>_*vol;

process=mix,mix;
