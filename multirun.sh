#!/bin/bash

strBigM="gams models/bigM.gms --instance="
strPersp="gams models/persp_reform.gms --instance="

strLog=" LogOption=2"
strRelax=" --relax=1"

cp instances/* .

for file in *.data; do
	namewoext=${file%'.data'}
	$strBigM$file$strLog
        $strPersp$file$strLog
	mv bigM.log $namewoext$"_bigM.out"
	mv persp_reform.log $namewoext$"_persp.out"
        $strBigM$file$strLog$strRelax
        $strPersp$file$strLog$strRelax
        mv bigM.log $namewoext$"_bigM_lp.out"
        mv persp_reform.log $namewoext$"_persp_lp.out"
done

rm *.data
