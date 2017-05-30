#!/bin/bash
str1="gams persp_reform.gms --instance="

for file in *.data; do
namewoext=${file%'.data'}
str=$str1$file
oarsub -l {"network_address!='drbl121'"}/nodes=1/core=1,walltime=24 -q 'low' -O $namewoext.cplex.stdout -E $namewoext.cplex.stderr "$str"
	done