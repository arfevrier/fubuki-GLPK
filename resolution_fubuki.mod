/* Solution de grille finale */
var x{i in 1..3, j in 1..3, k in 1..9},   binary ;

/* Un seul chiffre par case */
s.t. c1{i in 1..3, j in 1..3}: sum{k in 1..9} x[i,j,k] = 1;

/* Un seul chiffre par grille */
s.t. c2{k in 1..9}: sum{i in 1..3, j in 1..3} x[i,j,k] = 1;

/* Nombre de départ */
s.t. n1: x[2,2,7] = 1;
	/*s.t. n2: x[1,3,8] = 1;
	s.t. n3: x[3,1,6] = 1;
	s.t. n4: x[3,3,9] = 1;*/

/* Respect les sommes */
s.t. li1: sum{j in 1..3,k in 1..9} x[1,j,k]*k = 16;
s.t. li2: sum{j in 1..3,k in 1..9} x[2,j,k]*k = 18;
s.t. li3: sum{j in 1..3,k in 1..9} x[3,j,k]*k = 11;

s.t. co1: sum{i in 1..3,k in 1..9} x[i,1,k]*k = 22;
s.t. co2: sum{i in 1..3,k in 1..9} x[i,2,k]*k = 17;
s.t. co3: sum{i in 1..3,k in 1..9} x[i,3,k]*k = 6;

solve;

printf{i in 1..3, j in 1..3, k in 1..9: x[i,j, k] != 0}:'%2s %2s %4s\n',i,j,k;

end;

