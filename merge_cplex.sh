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
for f in `grep "MIP Solution:" $file | cut -c 23-34`; do BEST=$f; done
for f in `grep "Best possible:" $file | cut -c 23-34`; do POSS=$f; done
for f in `grep "Total (" $file | cut -c 27-33`; do TIME=$f; done
echo -e $namewoext$'\t'$BEST$'\t'$POSS'\t'$TIME >>results.txt
done