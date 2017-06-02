# facilityLocation
Some experiments with bigM and perspective formulations on facility location problems.

---
We explore two mixed integer models for [facility location](https://en.wikipedia.org/wiki/Facility_location_problem) problems in which the cost for serving a client from a certain facility is a linear but affine function of the amount served: classical [big-M](https://en.wikipedia.org/wiki/Big_M_method) formulations and [perspective reformulations](http://homepages.cae.wisc.edu/~linderot/papers/Gunluk-Linderoth-10.pdf). Type
~~~
.\multirun.sh
~~~
in order to run both formulations and their LP-relaxations on some small test instances. Note that GAMS/CPLEX has to be installed. The models are all so small that [GAMS's free demo version](https://www.gams.com/download/) should suffice. Type
~~~
.\merge.sh
~~~
to produce a simple table comparing the previously produced optimal MIP- and LP-values in .txt format. This has been tested on Mac OS X but might work on all UNIX systems.