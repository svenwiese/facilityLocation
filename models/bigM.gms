$ontext
    facility location with affine cost function.
    bigM formulation

    include an instance file by setting --instance=*

    set whether or not to solve continuous relaxation by setting --relax={0,1}
$offtext

Sets    I "set of facilities"
        J "set of customers"
;

Parameters  c(I)    fixed costs
            a(I,J)  steepness
            b(I,J)  intercepts
;

$include %instance%

$if not set relax $set relax 0

Binary Variable z(I)    open facility i or not;

z.lo(I) = 0;
z.up(I) = 1;

Positive Variables  x(I,J)  fraction of j served by i
                    y(I,J)  cost of serving j by i
;
                    
Variable cost;

Equations   totalcost
            x_z(I,J)
            ineq(I,J)
            convexity(J)
;

totalcost..     cost =e= sum(I,c(I)*z(I))+sum((I,J),y(I,J));
x_z(I,J)..      x(I,J) =l= z(I);
ineq(I,J)..     a(I,J)*x(I,J)-y(I,J)+b(I,J)*z(I) =l= a(I,J)*(1-z(I));
convexity(J)..  sum(I,x(I,J)) =e= 1;

model fac_loc / all /;

option mip=cplex;
option rmip=cplex;

fac_loc.reslim=3600;
fac_loc.optFile=0;
fac_loc.threads=1;

option optcr = 0;

If (%relax%,
solve fac_loc using rmip min cost;
else
solve fac_loc using mip min cost;);