#!/bin/bash

rm -f results.txt
touch results.txt
echo -e 'cplex' >>results.txt
echo -e '------------------------------------------------------' >>results.txt
echo -e 'instance\tUB\t\tLB\t\ttime' >>results.txt
echo -e '------------------------------------------------------' >>results.txt

for file in *.cplex.stdout; do
namewoext=${file%'.cplex.stdout'}
BEST=""
POSS=""
TIME=""
for f in `grep "Objective" $file | cut -c 20-30`; do BEST=$f; POSS=$f; done
for f in `grep "Cplex Time" $file | cut -c 13-16`; do TIME=$f; done
echo -e $namewoext$'\t'$BEST$'\t'$POSS'\t'$TIME >>results.txt
done