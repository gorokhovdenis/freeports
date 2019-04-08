import re

with open ('./free', 'r') as f2:
    s=f2.readlines()
    f2=open ('./free','w')
    for line in s:
        if re.search(r'Present', line):
            continue
        else:
            f2.write (line)
    f2.close()
with open ('./free', 'r') as f:
    text = str(f.read())
free=(re.findall(r'(?<=[A-Z]\w)\d/\S*', text))
#print (free)
with open ('./reserved', 'r') as f:
    text = str(f.read())
reserv=(re.findall(r'\d/\S+?(?=\")', text))
interface=(re.search(r'\w+?(?=\d/\S+)', text))
#print (reserv)
result = set(free) - set(reserv) # correct elements, but not yet in sorted order
#print(sorted(result)) # sort and print
print ('===========FREE PORTS===========')
for i in sorted(result):
    print (interface[0],i)
