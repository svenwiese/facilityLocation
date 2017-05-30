#!/bin/bash

rm -f results.txt
touch results.txt
echo -e 'cplex' >>results.txt
echo -e '------------------------------------------------------' >>results.txt
echo -e 'instance\tUB\t\tbigM_LB\t\tpersp_LB' >>results.txt
echo -e '------------------------------------------------------' >>results.txt

for file in *persp.out; do
namewoext=${file%'_persp.out'}
UB=""
bigM=""
persp=""
for f in `grep "MIP Solution:" $file | cut -c 23-34`; do UB=$f; done
for f in `grep "Objective :" $namewoext$'_bigM_lp.out' | cut -c 20-30`; do bigM=$f; done
for f in `grep "Objective :" $namewoext$'_persp_lp.out' | cut -c 20-30`; do persp=$f; done
echo -e $namewoext$'\t\t'$UB$'\t'$bigM'\t'$persp >>results.txt
done
