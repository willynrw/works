//for Amanda
//for Clarinet and Electronics
//Willyn Whiting

s.boot;//<----------Shft+Rtrn to start Audio Server

(
SynthDef.new(\sine, {
	arg freq = 440, atk = 0.005, rel = 0.3, amp=0.125, pan=0, out;
	var sig, env;
	sig = SinOsc.ar(freq);
	env = EnvGen.kr(Env.new([0,1,0], [atk,rel], [1,-1]), doneAction:2);
	sig = Pan2.ar(sig, pan, amp);
	sig = (sig * env);
	Out.ar(out,sig);
}).add;

SynthDef.new(\reverb, {
	arg in, out=0;
	var sig;
	sig = In.ar(in, 2);
	sig = FreeVerb.ar(sig, 0.6, 0.9, 0.2);
	Out.ar(out, sig);
}).add;
)//<----------Cmd+Rtrn to register
Synth.new(\sine, [\out, 0]);//<----------
Synth.new(\reverb, [\in, ~reverbBus2]);//<----------
//Shft+Rtrn on both to test Reverb

(
p = Pbind(
	\type, \note,
	\instrument, \sine,
	\dur, Pseq([13, 8, 5, 3, 2, 7, 12, 6, 4, 1], 3). trace,
	\freq, Pseq([682, 575, 490, 491, 468, 454, 402, 390, 358, 359, 325, 326, 292, 262, 291, 261, 210, 170, 290, 155, 110, 286, 120, 119, 111, 112, 113, 45, 36, 29],1). trace,
	\atk, Pwhite(5, 10, inf),
	\rel, Pwhite(10, 15, inf),
	\amp, Pexprand(0.1, 0.6, inf),
	\pan, Pwhite(-0.8, 0.8, inf),
).play;
)//<----------Cmd+Rtrn to Start

//Dur 3'18" - 3'28"
//Mar2021



