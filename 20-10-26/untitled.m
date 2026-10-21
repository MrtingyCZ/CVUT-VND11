syms a
M = [a 2;3 a+1];
d = det(M)
reseni_a = solve(d == 0,a)
%%
syms a
M = [a 2;1 0];
d = det(M)
reseni_b = solve(d == 0,a)
%%
clear
a = [1 2 3 4];
b = 1:0.1:3
%%
A = [1 2 3;4 5 6;7 8 9]
A(2,1)                  %vypise udaj z 2. radku, 1. sloupce
A(1,:)                  %vypise cely 1. radek
A(:,2)                  %cely druhy sloupec
det(A)
trA=A';
inv(A)
jednotkova = sym(A*inv(A))
%% grader "Závislost a nezávislost vektorů"
u1 = [1 5 0 1]
u2 = [1 2 1 0]
u3 = [-1 1 -2 1]
u4 = [-1 -8 1 -2]
A=[u1;u2;u3;u4]
rref(A)

%Zavislost="LZ"

% Na následující řádek nesahejte. Slouží k ověření správnosti výsledku.
%Control=[M(2,1),M(3,:),M(4,:),[-5 1 3 0]*M(1,:)',[-5 1 3 0]*M(2,:)',[2 -1 0 3]*M(1,:)',[2 -1 0 3]*M(2,:)',abs(sign(abs(sign([-5 1 3 1]*M(1,:)'))+abs(sign([-5 1 3 1]*M(2,:)')))),abs(sign(abs(sign([2 1 0 3]*M(1,:)'))+abs(sign([2 1 0 3]*M(2,:)'))))]
%% grader Závislost a nezávislost vektorů s parametrem
syms p
u = [p 1 0]
v = [1 p 1]
w = [1 1 p]

A = [u;v;w]
solve(det(A) == 0)
