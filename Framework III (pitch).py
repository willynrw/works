from math import log2, pow
Layer1 = []

X = float(input("Generator"))
print(X)

C1 = float(input("Partial1"))
C2 = float(input("Partial2"))
C3 = float(input("Partial3"))
C4 = float(input("Partial4"))
C5 = float(input("Partial5"))

Layer1.append(C1*X)
Layer1.append(C2*X)
Layer1.append(C3*X)
Layer1.append(C4*X)
Layer1.append(C5*X)

Layer2 = []
for x in Layer1:
    Layer2.append(x*C1)
    Layer2.append(x*C2)
    Layer2.append(x*C3)
    Layer2.append(x*C4)
    Layer2.append(x*C5)
Layer3 = []
for x in Layer2:
    Layer3.append(x*C1)
    Layer3.append(x*C2)
    Layer3.append(x*C3)
    Layer3.append(x*C4)
    Layer3.append(x*C5)
Layer4 = []
for x in Layer3:
    Layer4.append(x*C1)
    Layer4.append(x*C2)
    Layer4.append(x*C3)
    Layer4.append(x*C4)
    Layer4.append(x*C5)
Layer5 = []
for x in Layer4:
    Layer5.append(x*C1)
    Layer5.append(x*C2)
    Layer5.append(x*C3)
    Layer5.append(x*C4)
    Layer5.append(x*C5)

joinedList = Layer1 + Layer2 + Layer3 + Layer4 + Layer5
joinedList.sort()
finalList = []
for x in joinedList:
    if x not in finalList:
        finalList.append(x)
optList = []
for x in finalList:
    if x >= 32 and x<=1047:
        optList.append(x)
print(finalList)
print(optList)

A4 = 440
C0 = A4*pow(2, -4.75)
name = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
def pitch(freq):
    h = round(12*log2(freq/C0))
    i = A4 * ((2 ** (1/12)) ** (h-57))
    octave = h // 12
    n = h % 12
    cents = float(1200 * log2(freq/i))
    return name[n] + str(octave) + " " + str(cents)

for x in optList:
    freq = x
    print(pitch(freq))
