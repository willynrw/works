<Cabbage>
form caption ("MUSICA PRISCA CAPUT (1555) by Nicolai Vicentino (1511-1572)") size (900, 525), colour(102,0,0,255) 
groupbox bounds(8, 276, 790, 20), text("Equal ---------------------------------------------------------> 37-tone Equal Temperament")
groupbox bounds(8, 296, 790, 20), text("1/4'Mean ---------------------------------------------------------> Quarter-comma Meantone")
groupbox bounds(8, 316, 790, 20), text("1/3'Mean -----------------------------------------------------------> Third-comma Meantone")
groupbox bounds(8, 336, 790, 20), text("Beat -------------------------------------------------> Halfway between Equal and 1/4'Mean")
groupbox bounds(8, 376, 790, 20), text("3M ---------------------------------------> C1-B2 N & # -> C3-B4 N. & b -> C5-B6 #. & b.") 
groupbox bounds(8, 396, 790, 20), text("1M -----------------------------------------------------------> C1-B6 N & N. & # & #. & b & b.") 
groupbox bounds(8, 436, 790, 20), text("org ------------------------------------------------------------> oscil opcode")
groupbox bounds(8, 456, 790, 20), text("harp -----------------------------------------------------------> wgpluck opcode")
groupbox bounds(8, 496, 780, 20), text("THIS IS A DEMONSTRATION OF POSSIBLE TEMPERAMENTS FOR VICENTINO'S ARCHICEMBALO")
rslider bounds(8, 5, 75, 75), channel("A"), range(0.001, 10, 1, 0.5, 0.001), text("Attack") 
rslider bounds(8, 85, 75, 75), channel("D"), range(0.001, 10, 1, 0.5, 0.001), text("Decay")
rslider bounds(85, 5, 75, 75), channel("S"), range (0.001, 10, 1, 0.5, 0.001), text("Sustain")
rslider bounds(85, 85, 75, 75), channel("R"), range (0.001, 10, 1, 0.5, 0.001), text("Release")
hslider bounds(200, 20, 200, 50), channel("amp"),range (0, 1, 0.5, 1, 0.001), text("Vol")
hslider bounds(500, 20,200, 50), channel("pan"),range (0, 1, 1, 1, 0.001), text("Pan")
combobox bounds(200, 85, 90, 20), channel("Temp"), items("Equal", "1/4'Mean", "1/3'Mean", "Beat")
combobox bounds(300, 85, 90, 20), channel("Map"), items("3M", "1M")
combobox bounds(400, 85, 90, 20), channel("Snd"), items("org", "harp")
vslider bounds(500, 54, 105, 101), channel("RT"), range (0, 1, 0, 1, 0.01), text("Reverb Time")
vslider bounds(600, 54, 105, 101), channel("RQ"), range (0, 1, 0, 1, 0.01), text("Reverb Filter")
vslider bounds(700, 54, 105, 101), channel("RA"), range (0, 1, 0, 1, 0.01), text("Reverb Wet")
keyboard bounds(8, 168, 890, 95)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d --midi-key=4 --midi-velocity-amp=5
-t160
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1 ; PLAY KEYS FROM C1 to C7
iET init 0
iQCMT init 0
iTCMT init 0
iBMT init 0
gaOut init 0

iTemp chnget "Temp"
iMap chnget "Map"
kamp chnget "amp"
iamp chnget "amp"
iA chnget "A"
iD chnget "D"
iS chnget "S"
iR chnget "R"
iSnd chnget "Snd"
aEnv madsr iA, iD, iS, iR
kPan chnget "pan"
kPan = kPan*p6
  kpick = 0.5
  iplk = 0.001
  idamp = 25
  ifilt = 10
iP = p4
axcite oscil 1, 1, 2

if iMap == 1 then ;NOTES ARE ARRANGED FOR 3 MANUALS
    if iP == 36 then 
        iET = 131.670
        iQCMT = 131.711 
        iTCMT = 131.690  
        iBMT = 131.996
        prints "C1" 
    elseif iP == 37 then 
        iET = 137.514
        iQCMT = 137.461  
        iTCMT = 137.306 
        iBMT = 137.087
        prints "C#1"
    elseif iP == 38 then 
        iET = 147.175
        iQCMT = 147.191 
        iTCMT = 147.183 
        iBMT = 147.303 
        prints "D1"
    elseif iP == 39 then 
        iET = 153.750
        iQCMT = 153.660 
        iTCMT = 153.647 
        iBMT = 153.031 
        prints "D#1"
    elseif iP == 40 then 
        iET = 164.619
        iQCMT = 164.607 
        iTCMT = 164.613
        iBMT = 164.523 
        prints "E1"
    elseif iP == 41 then 
        iET = 176.069
        iQCMT = 175.877
        iTCMT = 175.845 
        iBMT = 176.022 
        prints "F1"
    elseif iP == 42 then 
        iET = 183.861
        iQCMT = 183.806 
        iTCMT = 183.592 
        iBMT = 183.419
        prints "F#1"
    elseif iP == 43 then 
        iET = 196.742
        iQCMT = 196.779 
        iTCMT = 196.761
        iBMT = 197.039
        prints "G1" 
    elseif iP == 44 then 
        iET = 205.508
        iQCMT = 205.404 
        iTCMT = 205.379 
        iBMT = 204.677
        prints "G#1" 
    elseif iP == 45 then 
        iET = 220.000
        iQCMT = 220.000 
        iTCMT = 220.000 
        iBMT =  220.000
        prints "A1"
    elseif iP == 46 then 
        iET = 229.861
        iQCMT = 229.703  
        iTCMT = 229.695 
        iBMT =  228.592
        prints "A#1"
    elseif iP == 47 then 
        iET = 246.165
        iQCMT = 246.123 
        iTCMT = 246.144 
        iBMT = 245.831
        prints "B1"
    elseif iP == 48 then 
        iET = 131.670*2
        iQCMT = 131.711*2 
        iTCMT = 131.690*2
        iBMT = 131.996*2
        prints "C2"
    elseif iP == 49 then 
        iET = 137.514*2
        iQCMT = 137.461*2  
        iTCMT = 137.30*2
        iBMT = 137.087*2 
        prints "C#2"
    elseif iP == 50 then 
        iET = 147.175*2
        iQCMT = 147.191*2 
        iTCMT = 147.183*2
        iBMT = 147.303*2
        prints "D2"
    elseif iP == 51 then 
        iET = 153.750*2
        iQCMT = 153.660*2
        iTCMT = 153.647*2
        iBMT = 153.031*2
        prints "D#2"
    elseif iP == 52 then 
        iET = 164.619*2
        iQCMT = 164.607*2 
        iTCMT = 164.613*2
        iBMT = 164.523*2
        prints "E2"
    elseif iP == 53 then 
        iET = 176.069*2
        iQCMT = 175.877*2
        iTCMT = 175.845*2 
        iBMT = 176.022*2
        prints "F2"
    elseif iP == 54 then 
        iET = 183.861*2
        iQCMT = 183.806*2 
        iTCMT = 183.592*2
        iBMT = 183.419*2
        prints "F#2"
    elseif iP == 55 then 
        iET = 196.742*2
        iQCMT = 196.779*2 
        iTCMT = 196.761*2
        iBMT = 197.039*2
        prints "G2" 
    elseif iP == 56 then 
        iET = 205.508*2
        iQCMT = 205.404*2 
        iTCMT = 205.379*2
        iBMT = 204.677*2
        prints "G#2"
    elseif iP == 57 then 
        iET = 220.000*2
        iQCMT = 220.000*2 
        iTCMT = 220.000*2 
        iBMT =  220.000*2
        prints "A2"
    elseif iP == 58 then 
        iET = 229.861*2
        iQCMT = 229.703*2  
        iTCMT = 229.695*2 
        iBMT =  228.592*2
        prints "A#2"
    elseif iP == 59 then 
        iET = 246.165*2
        iQCMT = 246.123*2 
        iTCMT = 246.144*2 
        iBMT = 245.831*2  
        prints "B2"
    elseif iP == 60 then 
        iET = 134.670
        iQCMT = 134.665 
        iTCMT = 134.712 
        iBMT = 133.056
        prints "C.1" 
    elseif iP == 61 then 
        iET = 140.717
        iQCMT = 140.616 
        iTCMT = 140.565 
        iBMT = 139.167
        prints "Db1" 
    elseif iP == 62 then 
        iET = 150.550
        iQCMT = 150.515
        iTCMT = 150.560 
        iBMT = 148.495
        prints "D.1"
    elseif iP == 63 then 
        iET = 157.353
        iQCMT = 157.209 
        iTCMT = 157.167 
        iBMT = 156.510 
        prints "Eb1"
    elseif iP == 64 then 
        iET = 168.415
        iQCMT = 168.346 
        iTCMT = 168.389 
        iBMT = 165.715
        prints "E.1"
    elseif iP == 65 then 
        iET = 180.069
        iQCMT = 179.816
        iTCMT = 179.874 
        iBMT = 178.043
        prints "F.1"
    elseif iP == 66 then 
        iET =  188.132
        iQCMT = 188.012 
        iTCMT = 187.937 
        iBMT = 185.583 
        prints "Gb1"
    elseif iP == 67 then 
        iET = 201.242
        iQCMT = 201.211 
        iTCMT = 201.275 
        iBMT = 198.629 
        prints "G.1"
    elseif iP == 68 then 
        iET = 210.313
        iQCMT = 210.137 
        iTCMT = 210.073 
        iBMT = 208.708 
        prints "Ab1" 
    elseif iP == 69 then 
        iET = 225.062 
        iQCMT = 224.985 
        iTCMT = 225.048  
        iBMT = 221.669
        prints "A.1"
    elseif iP == 70 then 
        iET = 235.267
        iQCMT = 235.027 
        iTCMT = 240.348 
        iBMT = 234.724 
        prints "Bb1"
    elseif iP == 71 then 
        iET = 251.860
        iQCMT = 251.732 
        iTCMT = 251.703
        iBMT = 247.500
        prints "B.1"
    elseif iP == 72 then 
        iET = 134.670*2
        iQCMT = 134.665*2 
        iTCMT = 134.71*2
        iBMT = 133.056*2
        prints "C.2"
    elseif iP == 73 then 
        iET = 140.717*2
        iQCMT = 140.616*2 
        iTCMT = 140.565*2 
        iBMT = 139.167*2 
        prints "Db2"
    elseif iP == 74 then 
        iET = 150.550*2
        iQCMT = 150.515*2
        iTCMT = 150.560*2
        iBMT = 148.495*2
        prints "D.2"
    elseif iP == 75 then 
        iET = 157.353*2
        iQCMT = 157.209*2 
        iTCMT = 157.167*2 
        iBMT = 156.510*2 
        prints "Eb2"
    elseif iP == 76 then 
        iET = 168.415*2
        iQCMT = 168.346*2
        iTCMT = 168.389*2
        iBMT = 165.715*2
        prints "E.2"
    elseif iP == 77 then 
        iET = 180.069*2
        iQCMT = 179.816*2
        iTCMT = 179.874*2 
        iBMT = 178.043*2
        prints "F.2"
    elseif iP == 78 then 
        iET =  188.132*2
        iQCMT = 188.012*2 
        iTCMT = 187.937*2 
        iBMT = 185.583*2 
        prints "Gb2"
    elseif iP == 79 then 
        iET = 201.242*2
        iQCMT = 201.211*2 
        iTCMT = 201.275*2 
        iBMT = 198.629*2 
        prints "G.2"
    elseif iP == 80 then 
        iET = 210.313*2
        iQCMT = 210.137*2 
        iTCMT = 210.073*2 
        iBMT = 208.708*2 
        prints "Ab2" 
    elseif iP == 81 then 
        iET = 225.062*2 
        iQCMT = 224.985*2 
        iTCMT = 225.048*2  
        iBMT = 221.669*2
        prints "A.2"
    elseif iP == 82 then 
        iET = 235.267*2
        iQCMT = 235.027*2 
        iTCMT = 240.348*2 
        iBMT = 234.724*2 
        prints "Bb2"
    elseif iP == 83 then 
        iET = 251.860*2
        iQCMT = 251.732*2 
        iTCMT = 251.703*2
        iBMT = 247.500*2
        prints "B.2"
    elseif iP == 84 then 
        iET = ((140.717-137.514)/2)+137.514
        iQCMT = ((140.616-137.461)/2)+137.461 
        iTCMT = ((140.565-137.306)/2)+137.306 
        iBMT = ((139.167-137.087)/2)+137.087
        prints "C#.1"   
    elseif iP == 85 then 
        iET = 143.623
        iQCMT = 143.466 
        iTCMT = 143.490 
        iBMT = 142.360
        prints "Db.1"
    elseif iP == 86 then 
        iET = ((157.353-153.750)/2)+153.750
        iQCMT = ((157.209-153.660)/2)+153.660
        iTCMT = ((157.167-153.647)/2)+153.647 
        iBMT = ((156.510-153.031)/2)+153.031
        prints "D#.1"
    elseif iP == 87 then 
        iET =  160.909
        iQCMT = 160.711 
        iTCMT = 160.748 
        iBMT = 159.321
        prints "Eb.1"
    elseif iP == 88 then 
        iET =  171.633
        iQCMT = 171.490 
        iTCMT = 171.497 
        iBMT = 170.490
        prints "E#1"
    elseif iP == 89 then 
        iET = ((188.132-183.861)/2)+183.861
        iQCMT = ((188.012-183.806)/2)+183.806 
        iTCMT = ((187.937-183.592)/2)+183.592 
        iBMT = ((185.583-183.419)/2)+183.419
        prints "F#.1"
    elseif iP == 90 then 
        iET = 191.752 
        iQCMT = 191.550 
        iTCMT = 191.578 
        iBMT =  190.132
        prints "Gb.1"
    elseif iP == 91 then 
        iET = ((210.313-205.508)/2)+205.508
        iQCMT = ((210.137-205.404)/2)+205.404 
        iTCMT = ((210.073-205.379)/2)+205.379 
        iBMT = ((208.708-204.677)/2)+204.677
        prints "G#.1" 
    elseif iP == 92 then 
        iET = 215.054
        iQCMT = 214.805 
        iTCMT = 214.848
        iBMT = 213.064
        prints "Ab.1"
    elseif iP == 93 then 
        iET = ((235.367-229.861)/2)+229.861 
        iQCMT = ((235.027-229.703)/2)+229.703 
        iTCMT = ((234.977-229.695)/2)+229.695 
        iBMT = ((234.742-228.592)/2)+228.592 
        prints "A#.1"
    elseif iP == 94 then 
        iET = 240.600
        iQCMT = 240.279 
        iTCMT = 240.348
        iBMT =  238.027
        prints "Bb.1"
    elseif iP == 95 then 
        iET = 256.687
        iQCMT = 256.449 
        iTCMT = 256.470
        iBMT = 254.781 
        prints "B#1"
    elseif iP == 96 then 
        iET = (((140.717-137.514)/2)+137.514)*2
        iQCMT = (((140.616-137.461)/2)+137.461)*2
        iTCMT = (((140.565-137.306)/2)+137.306)*2 
        iBMT = (((139.167-137.087)/2)+137.087)*2 
        prints "C#.2"  
    elseif iP == 97 then 
        iET = 143.623*2
        iQCMT = 143.466*2 
        iTCMT = 143.490*2 
        iBMT = 142.360*2
        prints "Db.2"
    elseif iP == 98 then 
        iET = (((157.353-153.750)/2)+153.750)*2
        iQCMT = (((157.209-153.660)/2)+153.660)*2
        iTCMT = (((157.167-153.647)/2)+153.647)*2 
        iBMT = (((156.510-153.031)/2)+153.031)*2
        prints "D#.2"
    elseif iP == 99 then 
        iET =  160.909*2
        iQCMT = 160.711*2 
        iTCMT = 160.748*2 
        iBMT = 159.321*2
        prints "Eb.2"
    elseif iP == 100 then 
        iET =  171.633*2
        iQCMT = 171.490*2 
        iTCMT = 171.497*2 
        iBMT = 170.490*2
        prints "E#2"
    elseif iP == 101 then 
        iET = (((188.132-183.861)/2)+183.861)*2
        iQCMT = (((188.012-183.806)/2)+183.806)*2 
        iTCMT = (((187.937-183.592)/2)+183.592)*2 
        iBMT = (((185.583-183.419)/2)+183.419)*2
        prints "F#.2"
    elseif iP == 102 then 
        iET = 191.752*2 
        iQCMT = 191.550*2 
        iTCMT = 191.578*2
        iBMT =  190.132*2
        prints "Gb.2"
    elseif iP == 103 then 
        iET = (((210.313-205.508)/2)+205.508)*2
        iQCMT = (((210.137-205.404)/2)+205.404)*2 
        iTCMT = (((210.073-205.379)/2)+205.379)*2 
        iBMT = (((208.708-204.677)/2)+204.677)*2 
        prints "G#.2"
    elseif iP == 104 then 
        iET = 215.054*2
        iQCMT = 214.805*2 
        iTCMT = 214.848*2
        iBMT = 213.064*2
        prints "Ab.2"
    elseif iP == 105 then 
        iET = (((235.367-229.861)/2)+229.861)*2 
        iQCMT = (((235.027-229.703)/2)+229.703)*2 
        iTCMT = (((234.977-229.695)/2)+229.695)*2 
        iBMT = (((234.742-228.592)/2)+228.592)*2 
        prints "A#.2"
    elseif iP == 106 then 
        iET = 240.600*2
        iQCMT = 240.279*2 
        iTCMT = 240.348*2
        iBMT =  238.027*2
        prints "Bb.2"
    elseif iP == 107 then 
        iET = 256.687*2
        iQCMT = 256.449*2 
        iTCMT = 256.470*2
        iBMT = 254.781*2
        prints "B#2" 
    elseif iP == 108 then 
        iET = 263.340*2
        iQCMT = 263.422*2 
        iTCMT = 263.380*2 
        iBMT = 263.991*2
        prints "C3"
    endif  
elseif iMap ==2 then; ALL PITCHES ARE ARRANGED IN A ROW
    if iP == 36 then 
        iET = 131.670
        iQCMT = 131.711 
        iTCMT = 131.690  
        iBMT = 131.996 
        prints "C1"
    elseif iP == 37 then 
        iET = 134.670
        iQCMT = 134.665 
        iTCMT = 134.712 
        iBMT = 133.056 
        prints "C.1"
    elseif iP == 38 then 
        iET = 137.514
        iQCMT = 137.461  
        iTCMT = 137.306 
        iBMT = 137.087
        prints "C#1" 
    elseif iP == 39 then 
        iET = ((140.717-137.514)/2)+137.514
        iQCMT = ((140.616-137.461)/2)+137.461 
        iTCMT = ((140.565-137.306)/2)+137.306 
        iBMT = ((139.167-137.087)/2)+137.087 
        prints "C#.1"
    elseif iP == 40 then 
        iET = 140.717
        iQCMT = 140.616 
        iTCMT = 140.565 
        iBMT = 139.167 
        prints "Db1"
    elseif iP == 41 then 
        iET = 143.623
        iQCMT = 143.466 
        iTCMT = 143.490 
        iBMT = 142.360
        prints "Db.1"
    elseif iP == 42 then 
        iET = 147.175
        iQCMT = 147.191 
        iTCMT = 147.183 
        iBMT = 147.303 
        prints "D1"
    elseif iP == 43 then 
        iET = 150.550
        iQCMT = 150.515
        iTCMT = 150.560 
        iBMT = 148.495
        prints "D.1"
    elseif iP == 44 then 
        iET = 153.750
        iQCMT = 153.660 
        iTCMT = 153.647 
        iBMT = 153.031
        prints "D#1"
    elseif iP == 45 then 
        iET = ((157.353-153.750)/2)+153.750
        iQCMT = ((157.209-153.660)/2)+153.660
        iTCMT = ((157.167-153.647)/2)+153.647 
        iBMT = ((156.510-153.031)/2)+153.031
        prints "D#.1"
    elseif iP == 46 then 
        iET = 157.353
        iQCMT = 157.209 
        iTCMT = 157.167 
        iBMT = 156.510 
        prints "Eb1"
    elseif iP == 47 then 
        iET =  160.909
        iQCMT = 160.711 
        iTCMT = 160.748 
        iBMT = 159.321
        prints "Eb.1"
    elseif iP == 48 then 
        iET = 164.619
        iQCMT = 164.607 
        iTCMT = 164.613
        iBMT = 164.523 
        prints "E1"
    elseif iP == 49 then 
        iET = 168.415
        iQCMT = 168.346 
        iTCMT = 168.389 
        iBMT = 165.715
        prints "E.1"
    elseif iP == 50 then 
        iET =  171.633
        iQCMT = 171.490 
        iTCMT = 171.497 
        iBMT = 170.490
        prints "E#1"
    elseif iP == 51 then 
        iET = 176.069
        iQCMT = 175.877
        iTCMT = 175.845 
        iBMT = 176.022
        prints "F1" 
    elseif iP == 52 then 
        iET = 180.069
        iQCMT = 179.816
        iTCMT = 179.874 
        iBMT = 178.043
        prints "F.1"
    elseif iP == 53 then 
        iET = 183.861
        iQCMT = 183.806 
        iTCMT = 183.592 
        iBMT = 183.419
        prints "F#1"
    elseif iP == 54 then 
        iET = ((188.132-183.861)/2)+183.861
        iQCMT = ((188.012-183.806)/2)+183.806 
        iTCMT = ((187.937-183.592)/2)+183.592 
        iBMT = ((185.583-183.419)/2)+183.419
        prints "F#.1"
    elseif iP == 55 then 
        iET =  188.132
        iQCMT = 188.012 
        iTCMT = 187.937 
        iBMT = 185.583
        prints "Gb1" 
    elseif iP == 56 then 
        iET = 191.752 
        iQCMT = 191.550 
        iTCMT = 191.578 
        iBMT =  190.132
        prints "Gb.1"
    elseif iP == 57 then 
        iET = 196.742
        iQCMT = 196.779 
        iTCMT = 196.761
        iBMT = 197.039 
        prints "G1"
    elseif iP == 58 then 
        iET = 201.242
        iQCMT = 201.211 
        iTCMT = 201.275 
        iBMT = 198.629 
        prints "G.1"
    elseif iP == 59 then 
        iET = 205.508
        iQCMT = 205.404 
        iTCMT = 205.379 
        iBMT = 204.677
        prints "G#1"
    elseif iP == 60 then 
        iET = ((210.313-205.508)/2)+205.508
        iQCMT = ((210.137-205.404)/2)+205.404 
        iTCMT = ((210.073-205.379)/2)+205.379 
        iBMT = ((208.708-204.677)/2)+204.677
        prints "G#.1" 
    elseif iP == 61 then 
        iET = 210.313
        iQCMT = 210.137 
        iTCMT = 210.073 
        iBMT = 208.708
        prints "Ab1"
    elseif iP == 62 then 
        iET = 215.054
        iQCMT = 214.805 
        iTCMT = 214.848
        iBMT = 213.064
        prints "Ab.1"
    elseif iP == 63 then 
        iET = 220.000
        iQCMT = 220.000 
        iTCMT = 220.000 
        iBMT =  220.000
        prints "A1"
    elseif iP == 64 then 
        iET = 225.062 
        iQCMT = 224.985 
        iTCMT = 225.048  
        iBMT = 221.669
        prints "A.1"
    elseif iP == 65 then 
        iET = 229.861
        iQCMT = 229.703  
        iTCMT = 229.695 
        iBMT =  228.592
        prints "A#1"
    elseif iP == 66 then 
        iET = ((235.367-229.861)/2)+229.861 
        iQCMT = ((235.027-229.703)/2)+229.703 
        iTCMT = ((234.977-229.695)/2)+229.695 
        iBMT = ((234.742-228.592)/2)+228.592 
        prints "A#.1"
    elseif iP == 67 then 
        iET = 235.267
        iQCMT = 235.027 
        iTCMT = 240.348 
        iBMT = 234.724
        prints "Bb1" 
    elseif iP == 68 then 
        iET = 240.600
        iQCMT = 240.279 
        iTCMT = 240.348
        iBMT =  238.027
        prints "Bb.1"
    elseif iP == 69 then 
        iET = 246.165
        iQCMT = 246.123 
        iTCMT = 246.144 
        iBMT = 245.831
        prints "B1"
    elseif iP == 70 then 
        iET = 251.860
        iQCMT = 251.732 
        iTCMT = 251.703
        iBMT = 247.500
        prints "B.1"
    elseif iP == 71 then 
        iET = 256.687
        iQCMT = 256.449 
        iTCMT = 256.470
        iBMT = 254.781
        prints "B#1"
     elseif iP == 72 then 
        iET = 131.670*2
        iQCMT = 131.711*2 
        iTCMT = 131.690*2
        iBMT = 131.996*2
        prints "C2"
    elseif iP == 73 then 
        iET = 134.670*2
        iQCMT = 134.665*2 
        iTCMT = 134.71*2
        iBMT = 133.056*2
        prints "C.2"
    elseif iP == 74 then 
        iET = 137.514*2
        iQCMT = 137.461*2  
        iTCMT = 137.30*2
        iBMT = 137.087*2 
        prints "C#2"
    elseif iP == 75 then 
        iET = (((140.717-137.514)/2)+137.514)*2
        iQCMT = (((140.616-137.461)/2)+137.461)*2
        iTCMT = (((140.565-137.306)/2)+137.306)*2 
        iBMT = (((139.167-137.087)/2)+137.087)*2 
        prints "C#.2" 
    elseif iP == 76 then 
        iET = 140.717*2
        iQCMT = 140.616*2 
        iTCMT = 140.565*2 
        iBMT = 139.167*2
        prints "Db2"
    elseif iP == 77 then 
        iET = 143.623*2
        iQCMT = 143.466*2 
        iTCMT = 143.490*2 
        iBMT = 142.360*2
        prints "Db.2"
    elseif iP == 78 then 
        iET = 147.175*2
        iQCMT = 147.191*2 
        iTCMT = 147.183*2
        iBMT = 147.303*2
        prints "D2"
    elseif iP == 79 then 
        iET = 150.550*2
        iQCMT = 150.515*2
        iTCMT = 150.560*2
        iBMT = 148.495*2
        prints "D.2"
    elseif iP == 80 then 
        iET = 153.750*2
        iQCMT = 153.660*2 
        iTCMT = 153.647*2 
        iBMT = 153.031*2
        prints "D#2"
    elseif iP == 81 then 
        iET = (((157.353-153.750)/2)+153.750)*2
        iQCMT = (((157.209-153.660)/2)+153.660)*2
        iTCMT = (((157.167-153.647)/2)+153.647)*2 
        iBMT = (((156.510-153.031)/2)+153.031)*2
        prints "D#.2"
    elseif iP == 82 then 
        iET = 157.353*2
        iQCMT = 157.209*2 
        iTCMT = 157.167*2 
        iBMT = 156.510*2 
        prints "Eb2"
    elseif iP == 83 then 
        iET =  160.909*2
        iQCMT = 160.711*2 
        iTCMT = 160.748*2 
        iBMT = 159.321*2
        prints "Eb.2"
    elseif iP == 84 then 
        iET = 164.619*2
        iQCMT = 164.607*2 
        iTCMT = 164.613*2
        iBMT = 164.523*2
        prints "E2"
    elseif iP == 85 then 
        iET = 168.415*2
        iQCMT = 168.346*2 
        iTCMT = 168.389*2 
        iBMT = 165.715*2
        prints "E.2"
    elseif iP == 86 then 
        iET =  171.633*2
        iQCMT = 171.490*2 
        iTCMT = 171.497*2 
        iBMT = 170.490*2
        prints "E#2"
    elseif iP == 87 then 
        iET = 176.069*2
        iQCMT = 175.877*2
        iTCMT = 175.845*2 
        iBMT = 176.022*2
        prints "F2"
    elseif iP == 88 then 
        iET = 180.069*2
        iQCMT = 179.816*2
        iTCMT = 179.874*2 
        iBMT = 178.043*2
        prints "F.2"
    elseif iP == 89 then 
        iET = 183.861*2
        iQCMT = 183.806*2 
        iTCMT = 183.592*2 
        iBMT = 183.419*2
        prints "F#2"
    elseif iP == 90 then 
        iET = (((188.132-183.861)/2)+183.861)*2
        iQCMT = (((188.012-183.806)/2)+183.806)*2 
        iTCMT = (((187.937-183.592)/2)+183.592)*2 
        iBMT = (((185.583-183.419)/2)+183.419)*2
        prints "F#.2"
    elseif iP == 91 then 
        iET =  188.132*2
        iQCMT = 188.012*2 
        iTCMT = 187.937*2 
        iBMT = 185.583*2
        prints "Gb2"
    elseif iP == 92 then 
        iET = 191.752*2 
        iQCMT = 191.550*2 
        iTCMT = 191.578*2
        iBMT =  190.132*2
        prints "Gb.2"
    elseif iP == 93 then 
        iET = 196.742*2
        iQCMT = 196.779*2 
        iTCMT = 196.761*2
        iBMT = 197.039*2 
        prints "G2"
    elseif iP == 94 then 
        iET = 201.242*2
        iQCMT = 201.211*2 
        iTCMT = 201.275*2 
        iBMT = 198.629*2
        prints "G.2"
    elseif iP == 95 then 
        iET = 205.508*2
        iQCMT = 205.404*2 
        iTCMT = 205.379*2
        iBMT = 204.677*2
        prints "G#2"
    elseif iP == 96 then 
        iET = (((210.313-205.508)/2)+205.508)*2
        iQCMT = (((210.137-205.404)/2)+205.404)*2 
        iTCMT = (((210.073-205.379)/2)+205.379)*2 
        iBMT = (((208.708-204.677)/2)+204.677)*2 
        prints "G#.2"
    elseif iP == 97 then 
        iET = 210.313*2
        iQCMT = 210.137*2 
        iTCMT = 210.073*2 
        iBMT = 208.708*2
        prints "Ab2"
    elseif iP == 98 then 
        iET = 215.054*2
        iQCMT = 214.805*2 
        iTCMT = 214.848*2
        iBMT = 213.064*2
        prints "Ab.2"
    elseif iP == 99 then 
        iET = 220.000*2
        iQCMT = 220.000*2 
        iTCMT = 220.000*2 
        iBMT =  220.000*2
        prints "A2"
    elseif iP == 100 then 
        iET = 225.062*2 
        iQCMT = 224.985*2 
        iTCMT = 225.048*2  
        iBMT = 221.669*2
        prints "A.2"
    elseif iP == 101 then 
        iET = 229.861*2
        iQCMT = 229.703*2  
        iTCMT = 229.695*2 
        iBMT =  228.592*2
        prints "A#2"
    elseif iP == 102 then 
        iET = (((235.367-229.861)/2)+229.861)*2 
        iQCMT = (((235.027-229.703)/2)+229.703)*2 
        iTCMT = (((234.977-229.695)/2)+229.695)*2 
        iBMT = (((234.742-228.592)/2)+228.592)*2
        prints "A#.2"
    elseif iP == 103 then 
        iET = 235.267*2
        iQCMT = 235.027*2 
        iTCMT = 240.348*2 
        iBMT = 234.724*2
        prints "Bb2"
    elseif iP == 104 then 
        iET = 240.600*2
        iQCMT = 240.279*2 
        iTCMT = 240.348*2
        iBMT =  238.027*2
        prints "Bb.2"
    elseif iP == 105 then 
        iET = 246.165*2
        iQCMT = 246.123*2 
        iTCMT = 246.144*2 
        iBMT = 245.831*2
        prints "B2"
    elseif iP == 106 then 
        iET = 251.860*2
        iQCMT = 251.732*2 
        iTCMT = 251.703*2
        iBMT = 247.500*2
        prints "B.2"
    elseif iP == 107 then 
        iET = 256.687*2
        iQCMT = 256.449*2 
        iTCMT = 256.470*2
        iBMT = 254.781*2 
        prints "B#2"
    elseif iP == 108 then 
        iET = 263.340*2
        iQCMT = 263.422*2 
        iTCMT = 263.380*2 
        iBMT = 263.991*2
        prints "C3"
    endif
endif

if iSnd == 1 then
if iTemp == 1 then
    aOut oscil kamp, iET, 1
    print iET
elseif iTemp == 2 then
    aOut oscil kamp, iQCMT, 1
    print iQCMT
elseif iTemp == 3 then
    aOut oscil kamp, iTCMT, 1
    print iTCMT
elseif iTemp == 4 then
    aOut oscil kamp, iBMT, 1
    print iBMT
endif
endif

if iSnd == 2 then
if iTemp == 1 then
    aOut wgpluck iET, iamp, kpick, iplk, idamp, ifilt, axcite
    print iET
elseif iTemp == 2 then
    aOut wgpluck iQCMT, iamp, kpick, iplk, idamp, ifilt, axcite
    print iQCMT
elseif iTemp == 3 then
    aOut wgpluck iTCMT, iamp, kpick, iplk, idamp, ifilt, axcite
    print iTCMT
elseif iTemp == 4 then
    aOut wgpluck iBMT, iamp, kpick, iplk, idamp, ifilt, axcite
    print iBMT
endif
endif
gaOut=gaOut+(aOut*0.01)
outs aOut*aEnv*kPan*0.1, aOut*aEnv*(1-kPan)*0.1

endin

instr 2 //reverb
kEnv madsr 5, 0.1, 0.1, 5
kRT chnget "RT"
kRQ chnget "RQ"
kRA chnget "RA"
aOut2 reverb2 gaOut, kRT, kRQ
outs aOut2*kRA*kEnv, aOut2*kRA*kEnv
endin

instr 3//clear
clear gaOut
endin

</CsInstruments>
<CsScore>
f0 z
f1 0 16384 10 1 
f2 0 16384 10 1   
i1 0 99999999999999 p4 1 1 1
i2 0 99999999999999
i3 0 999999999999999
;MUSICA PRISCA CAPUT (1555) 
;by Nicolai Vicentino (1511-1572)
;Canto
i1 0 6 53 1 1
i. + 2 . . .
i. + 2 55 . . 
i. + 4 57 . .
i. + 2 82 . .
i. + 4 108 . .
i. + 4 . . .
i. 26 3 57 . .
i. + 1 . . .
i. + 2 55 . .
i. + 2 53 . .
i. + 2 52 . .
i. + 4 50 . . 
i. + 4 . . .

i. 46 4 55 . .
i. + 2 . . .
i. + 2 . . .
i. + 4 57 . .
i. + 2 82 . .
i. + 3 108 . .
i. + 1 . . .
i. + 2 . . .
i. + 4 . . .
i. + 2 59 . .
i. + 4 108 . .

i. 78 3 57 . .
i. + 1 . . .
i. + 2 . . .
i. + 2 55 . .
i. + 2 53 . .
i. + 4 52 . .
i. + 2 53 . .
i. + 3 . . .
i. + 1 . . .
i. + 2 . . .
i. + 2 . . .
i. + 2 52 . .
i. + 3 53 . .
i. + 1 . . .
i. + 2 . . .
i. + 3 . . .
i. + .5 52 . .
i. + .5 50 . .
i. + 2 52 . .
i. + 8 53 . .

i. 126 4 55 . .
i. + 2 . . .
i. + 2 . . .
i. + 2 52 . .
i. + 3 53 . .
i. + 1 . . .
i. + 2 . . .
i. + 4 54 . .
i. + 2 . . .
i. + 3 55 . .
i. + 1 57 . .
i. + 2 82 . .
i. + 2 59 . .
i. + 3 108 . .
i. + 1 . . .
i. + 2 57 . .
i. + 3 . . .
i. + 1 . . .
i. + 2 . . .
i. + 3 50 2  .
i. + 1 . . .
i. + 4 59 1 .
i. + 4 82 . .
i. + 4 57 . .

i. 186 3 108 . .
i. + 1 . . .
i. + 2 . . .
i. + 2 . . .
i. + 3 57 . .
i. + 1 . . .
i. + 2 52 . .

i. 202 3 50 . .
i. + 1 . . .
i. + 2 . . .
i. + 3 51 . .
i. + 1 . . .
i. + 2 50 . .
i. + 4 53 . .
i. + 2 52 . .
i. + 4 53 . .

i. 226 4 55 . .
i. + 2 52 . .
i. + 4 53 . .
i. + 4 52 . .
i. + 2 76 . .
i. + 4 . . .
i. + 2 . . .
i. + 4 53 . .

i. 254 4 . . .
i. + 2 . . .
i. + 4 106 . .
i. + 4 . . .
i. + 4 59 . .
i. + 6 107 . .
i. + 2 . . .
i. + 4 108 . .
i. + 4 79 . .
i. + 6 . . .
i. + 2 . . .
i. + 4 57 . .
i. + 2 . . .
i. + 3 74 2 .
i. + 1 . . .
i. + 2 . . .
i. + 4 96 . .
i. + 4 50 . .

i. 318 4 108 1 .
i. + 2 . . .
i. + 8 81 . .
i. + 6 82 . .
i. + 2 106 . .
i. + 3 59 . .
i. + 1 . . .
i. + 4 83 . .
i. + 4 . . .
i. + 2 . . .
i. + 2 . . .
i. + 4 108 . .
i. + 2 72 2 .
i. + 4 49 . .
i. + 2 . . .
i. + 4 96 . .
i. + 4 . . .
i. + 16 50 . .
;Alto
i1 8 6 48 1 .75
i. + 2 50 . .
i. + 2 52 . . 
i. + 4 53 . .
i. + 2 . . .
i. + 1 52 . .
i. + 1 50 . .
i. + 2 48 . .
i. + 4 50 . .

i. 38 4 70 . .
i. + 2 . . .
i. + 2 45 . .
i. + 4 52 . .
i. + 2 50 . .
i. + 3 . . .
i. + 1 48 . .
i. + 2 . . .
i. + 4 53 . .
i. + 2 . . .
i. + 3 55 . .
i. + 1 . . .
i. + 2 . . . 
i. + 4 . .  .
i. + 2 . . .

i. 78 3 53 . .
i. + 1 . . .
i. + 2 . . .
i. + 2 52 . .
i. + 2 50 . .
i. + 4 43 . .
i. + 2 50 . .
i. + 3 . . .
i. + 1 . . .
i. + 2 . . .
i. + 2 48 . .
i. + 2 . . .
i. + 3 . . .
i. + 1 . . .
i. + 2 . . .
i. + 2 . . .
i. + 2 . . .
i. + 3 . . .
i. + 1 . . .
i. + 2 . . .
i. + 2 . . .
i. + 2 50 . .
i. + 3 . . .
i. + 1 . . .
i. + 2 75 . .
i. + 2 52 . .
i. + 2 . . .
i. + 2 55 . .
i. + 4 48 . .

i. 142 4 50 . .
i. + 2 45 . .
i. + 4 50 . .
i. + 2 55 . .
i. + 4 . . .
i. + 2 . . .
i. + 2 48 . .
i. + 3 . . .
i. + 1 . . .
i. + 2 45 . .
i. + 3 . . .
i. + 1 . . .
i. + 4 50 . .

i. 178 4 55 . .
i. + 2 54 . .

i. 186 3 75 . .
i. + 1 . . .
i. + 2 . . .
i. + 2 . . .
i. + 2 48 . .
i. + 2 49 . .
i. + 2 . . .

i. 202 3 70 . .
i. + 1 . . .
i. + 2 . . .
i. + 3 42 . .
i. + 1 . . .
i. + 2 . . .

i. 216 2 48 . .
i. + 2 43 . .
i. + 4 48 . .
i. + 2 50 . .
i. + 4 52 . .
i. + 2 55 . .

i. 236 4 43 . .
i. + 4 72 . .
i. + 2 . . .
i. + 4 45 . .

i. 254 4 50 . .
i. + 2 . . .
i. + 4 74 . .
i. + 4 . . .
i. + 4 50 . .
i. + 6 79 . .
i. + 2 . . .
i. + 4 52 . .
i. + 4 76 . .
i. + 8 . . .
i. + 2 53 . .
i. + 2 48 . .
i. + 2 53 . .
i. + 3 101 . .
i. + 1 . . .
i. + 2 77 . .
i. + 4 76 . .
i. + 4 54 . .

i. 318 4 53 . .
i. + 2 . . .
i. + 4 72 . .
i. + 4 101 . .

i. 334 2 53 . .
i. + 2 . . .
i. + 2 79 . .
i. + 4 50 . .
i. + 4 79 . .
i. + 4 . . .
i. + 4 . . .
i. + 4 52 . .
i. + 2 76 . .
i. + 3 53 . .
i. + 1 57 . .
i. + 2 . . .
i. + 8 81 . .
i. + 16 54 . .

;Tenore 
i1 18 4 41 1 .5
i. + 2 . . .
i. + 2 43 . .
i. + 4 45 . .
i. + 2 70 . .
i. + 4 48 . . 
i. + 4 43 . .
i. + 3 41 . .
i. + 1 . . .
i. + 2 40 . .
i. + 4 48 . .
i. + 2 70 . .
i. + 2 . . .
i. + 2 45 . .
i. + 2 . . .
i. + 2 50 . . 
i. + 2 48 . . 
i. + 3 53 . .
i. + 1 52 . .
i. + 2 . . .
i. + 4 50 . .
i. + 4 48 . .

i. 78 3 . . .
i. + 1 . . .
i. + 2 . . .
i. + 2 . . .
i. + 2 41 . . 
i. + 4 48 . .
i. + 2 41 . .
i. + 3 . . .
i. + 1 . . .
i. + 2 70 . .
i. + 2 45 . .
i. + 2 43 . .
i. + 3 45 . .
i. + 1 . . .
i. + 4 . . .
i. + 4 43 . .
i. + 2 45 . .
i. + 4 . . .
i. + 2 70 . .
i. + 4 47 . .

i. 130 2 48 . .
i. + 3 . . .
i. + 1 . . .
i. + 6 45 . .
i. + 4 . . .
i. + 2 50 . .
i. + 4 47 . .
i. + 4 50 . .
i. + 2 75 . .
i. + 2 52 . .
i. + 2 53 . .
i. + 3 41 . .
i. + 1 . . .
i. + 2 42 . .
i. + 3 . . .
i. + 1 . . .
i. + 2 43 . .
i. + 4 50 . .
i. + 2 . . .

i. 186 3 68 . . 
i. + 1 . . .
i. + 2 . . .
i. + 2 . . .

i. 195 2 40 . . 
i. + 1 . . .
i. + 2 45 . .

i. 202 4 41 . .
i. + 2 . . .

i. 210 2 47 . .
i. + 2 . . .
i. + 2 50 . .
i. + 2 43 . .
i. + 1 48 . .
i. + 1 70 . .
i. + 1 45 . .
i. + 1 43 . .
i. + 2 45 . .
i. + 4 43 . .

i. 230 3 48 . .
i. + 1 47 . .
i. + 2 . . .
i. + 4 48 . .
i. + 2 67 . .
i. + 4 . . .
i. + 2 . . .
i. + 4 48 . .

i. 254 4 70 . .
i. + 2 . . .
i. + 4 65 . .
i. + 4 . . .

i. 272 2 74 . . 
i. + 4 . . .
i. + 2 . . .
i. + 4 43 . .
i. + 4 72 . .
i. + 6 . . .
i. + 2 . . .
i. + 4 48 . .
i. + 2 45 . .
i. + 3 69 . .
i. + 1 . . .
i. + 2 . . .
i. + 4 . . .
i. + 4 45 . .

i. 318 4 . . .
i. + 2 . . .
i. + 4 69 . .
i. + 2 74 . .
i. + 2 . . .
i. + 4 50 . .
i. + 2 . . .
i. + 2 74 . .

i. 344 4 . . .
i. + 6 . . .
i. + 2 67 . .
i. + 4 43 . .
i. + 2 69 . .

i. 364 3 42 . .
i. + 1 . . .
i. + 4 76 . .
i. + 4 . . .
i. + 16 45 . .

;Basso 
i1 26 4 41 1 .25 
i. + 2 43 . .
i. + 4 45 . .
i. + 2 70 . .
i. + 2 . . .
i. + 4 . .5 .
i. + 4 36 1 .

i. 50 3 43 .5 . 
i. + 1 . . . 
i. + 2 41 . .
i. + 2 . 1 .
i. + 2 70 .5 .
i. + 3 41 1 .
i. + 1 . . .
i. + 4 36 . .
i. + 4 43 . .
i. + 4 36 . .

i. 78 3 41 . .
i. + 1 . . .
i. + 2 . . .
i. + 2 36 . .
i. + 2 38 . .
i. + 4 36 . .
i. + 2 70 .5 .
i. + 3 . . .
i. + 1 . . .
i. + 2 . . .
i. + 2 41 . .
i. + 2 36 1 .
i. + 3 41 . .
i. + 1 . . .
i. + 4 . . .
i. + 4 36 . .
i. + 4 41 . .

i. 124 3 43 . . 
i. + 1 . . .
i. + 4 36 . . 
i. + 4 . . .
i. + 3 41 . .
i. + 1 . . .
i. + 2 38 . .
i. + 4 . . .
i. + 2 . . .
i. + 2 43 .5 . 
i. + 2 . 1 . 
i. + 4 . . .
i. + 4 36 . .
i. + 4 41 . .

i. 166 3 38 . .
i. + 1 . . .
i. + 2 . . .
i. + 3 43 .5 .
i. + 1 . . .
i. + 4 . . .
i. + 4 38 . .
i. + 2 43 .5 .
i. + 3 68 . .
i. + 1 . . .
i. + 2 . . .
i. + 2 . . .
i. + 3 45 . .
i. + 1 . . .
i. + 2 . . .

i. 202 3 70 . .
i. + 1 . . .
i. + 2 . . .
i. + 3 47 . .
i. + 1 . . .
i. + 4 . . .
i. + 4 36 1 .
i. + 4 41 .5 .

i. 226 4 36 1 .
i. + 2 . . .
i. + 4 38 . .
i. + 4 36 . .
i. + 2 60 . .
i. + 4 . . .
i. + 2 . . .
i. + 4 41 .5 .

i. 254 4 70 . .
i. + 2 . . .
i. + 4 94 . .
i. + 4 . . .
i. + 4 43 . .
i. + 6 67 . .
i. + 2 . . .
i. + 4 36 1 .
i. + 4 60 . .
i. + 6 . . .
i. + 2 . . .
i. + 4 41 . .
i. + 2 . . .
i. + 3 62 . .
i. + 1 . . .
i. + 2 . . .
i. + 4 69 .5 . 
i. + 4 38 1 .

i. 318 4 41 . .
i. + 2 . . .
i. + 4 65 . .
i. + 4 62 . .
i. + 2 43 .5 .
i. + 4 70 . .
i. + 2 67 . .
i. + 4 43 . .
i. + 4 67 . .
i. + 6 . . .
i. + 2 . . .
i. + 4 36 1 .
i. + 2 69 .5 .
i. + 3 45 . .
i. + 1 . . .
i. + 2 . . .
i. + 8 69 .5 .
i. + 16 38 1 . 
e
</CsScore>
</CsoundSynthesizer>