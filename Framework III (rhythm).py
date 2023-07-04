total = float(input("enter duration in beats: "))
dur = float(input("enter number of generations: "))
rat2 = float(input("enter numerator of fraction: "))
rat1 = float(input("enter denominator: "))

count = 1
test_list = [0, total]
res = [((test_list[i + 1] - test_list[i])/rat1*rat2+test_list[i]) for i in range(len(test_list)-1)]

if dur >= 1:
    test_list.extend(res)
    test_list.sort()

while dur >= count:
    res2 = [((test_list[i + 1] - test_list[i]) / rat1 * rat2 + test_list[i]) for i in range(len(test_list) - 1)]
    test_list.extend(res2)
    test_list.sort()
    count = count + 1

print(test_list)
K = 500
res3 = [x - K for x in test_list]
print(res3)
