//CSound Code//
//for Amanda
//for Clarinet and Electronics
//Willyn Whiting

<Cabbage>
form caption("forAF") size(100, 100), colour(240, 154, 106)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d 
-odac
-t60
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

gaOut init 0

instr 1
idura = rnd(5)
print idura
idurb = rnd(5)
print idurb
kamp = rnd(0.6)
kenv madsr 5+idura, 0, 0, 10+idurb
kpan = rnd(1) 

aOut oscil (kamp+0.01),p4,p3
aL = aOut*kenv*kpan
aR = aOut*kenv*(1-kpan)
outs aL, aR
gaOut = gaOut+(aOut*0.01)
endin

instr 2
aOut2 reverb2 gaOut, 0.01, 0.01
aL = aOut2*0.01
aR = aOut2*0.01
outs aL, aR
endin

instr 3
clear gaOut
endin

instr 4
aL, aR monitor
fout "foramanda.wav", 18, aL, aR
endin

</CsInstruments>
<CsScore>
f0 z
f1 0   16384 10 1
i2 0 9999999
i3 0 9999999
i4 0 240
i1 0   1 682
i1 13  1 575
i1 21  1 490
i1 26  1 491
i1 29  1 468
i1 31  1 454
i1 38  1 402
i1 50  1 390
i1 56  1 358
i1 60  1 359
i1 61  1 325
i1 74  1 326
i1 82  1 292
i1 87  1 262
i1 90  1 291
i1 92  1 261
i1 99  1 210
i1 111 1 170
i1 117 1 290
i1 121 1 155
i1 122 1 110
i1 134 1 286
i1 142 1 120
i1 147 1 119
i1 150 1 111
i1 152 1 112
i1 159 1 113
i1 171 1 45
i1 177 1 36
i1 181 1 29
e
</CsScore>
</CsoundSynthesizer>
//Dur 3'18" - 3'28"
//Mar2021


