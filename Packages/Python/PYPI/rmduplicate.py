lines = open('requirements.txt', 'r').readlines()

lines_set = set(lines)

out  = open('requirements.txt', 'w')

for line in lines_set:
    out.write(line)