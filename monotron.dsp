import("stdfaust.lib");
vol=hslider("[1]_",0,0,1,0.01):si.smooth(0.99);
wave=hslider("[2]CUTOFF/PITCH",0,0,1,1);
rate=hslider("[4]RATE[style:knob]",0.5,0.01,25.0,0.01):si.smooth(0.99);
size=hslider("[5]INT.[style:knob]",0.01,0.01,1.0,0.01):si.smooth(0.99);
cfreq=hslider("[6]CUTOFF[style:knob]",0.01,0.01,1.0,0.01):si.smooth(0.99);
rq=hslider("[7]PEAK[style:knob]",0.01,0.01,1.0,0.01):si.smooth(0.99);
freq=hslider("[3]PITCH[style:knob]",30,30,2000,0.1):si.smooth(0.99);

lfo1=os.osc(rate)*size;
osc1=os.sawtooth(freq+(lfo1*500));
lpf1=osc1:ve.korg35LPF(cfreq,rq*5);

lfo2=os.lf_triangle(rate)*size;
osc2=os.sawtooth(freq);
lpf2=osc2:ve.korg35LPF((lfo2*cfreq)+(0.5*cfreq),rq*5);

mix=((lpf1*wave)+(lpf2*(1-wave)))*vol,((lpf1*wave)+(lpf2*(1-wave)))*vol;

process = mix,mix;
