//Korg Monotron Duo
//One caveat is that I was not able to code major and minor scales only a chromatic scale
import("stdfaust.lib");
vol=hslider("[1]_",0,0,1,0.01):si.smooth(0.99);
scale=vslider("[2]o[style:menu{'GLISS':0;'CHROMATIC':1}]",0,0,1,1);
//inst=vslider("[1]SIZE[style:menu{'SOPRANO/CONCERT/TENOR':0;'POCKET':1;'BARITONE':2}]",0,0,2,1);
switch=hslider("[3]VCO1/VCO1+2",0,0,1,1);
freq1=hslider("[4]VCO1PITCH[style:knob]",30,30,2000,0.1):si.smooth(0.99);
xmod=hslider("[5]X-MOD INT.[style:knob]",0.0,0.0,1.0,0.01):si.smooth(0.99);
freq2=hslider("[6]VCO2PITCH[style:knob]",30,0.125,500,0.005):si.smooth(0.99);
cfreq=hslider("[7]CUTOFF[style:knob]",0.01,0.01,1.0,0.01):si.smooth(0.99);
rq=hslider("[8]PEAK[style:knob]",0.01,0.01,1.0,0.01):si.smooth(0.99);
rib1=hslider("[9]RIBBON",0,0,2,0.01):si.smooth(0.99);
rib2=hslider("[9]RIBBON2",0,0,12,1);
//VCO1
//note1=select2(tuning,67,69)+select3(inst,0,5,-7)+select3(inst,0,0,-12);
vco1=os.sawtooth(select2(scale,(freq1+(freq1*rib1)),(freq1:ba.hz2midikey+rib2:ba.midikey2hz)))*0.5*vol;
//VCO2
vco2=os.sawtooth(select2(scale,(freq2+(freq2*rib1)),(freq2:ba.hz2midikey+rib2:ba.midikey2hz)))*0.5*vol;
//ring modulation
rmod=(vco1*vco2)*4;
norm=vco1+vco2;
mix=(norm*(1-xmod))+((rmod)*xmod);
//filter
lpf=mix:ve.korg35LPF(cfreq,rq*5);

process = lpf,lpf;
