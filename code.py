import re

with open ('./free', 'r') as f:
    text = str(f.read())
free=(re.findall(r'\b[A-Z]\w\d/\d*', text))
with open ('./reserved', 'r') as f:
    text = str(f.read())
reserv=(re.findall(r'\d/\d*', text))
result = set(free) - set(reserv) # correct elements, but not yet in sorted order
#print(sorted(result)) # sort and print
print ('===========FREE PORTS===========')
for i in sorted(result):
    print (i)
