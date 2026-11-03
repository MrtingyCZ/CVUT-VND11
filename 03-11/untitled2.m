A = [1 2 0;-1 2 3;2 0 -1]
%E1=[1 0 0;1 1 0; -2 0 1];
%E1*A

m=3;E=eye(m);
E1 = E([2 1 3], :)
%%
A = [1 2 1;0 1 1;1 1 2];
sym(inv(A))
%% matlab ukol
A = [1 2 1 2;3 2 4 2;-1 2 0 1;-2 1 1 -1];
sym(inv(A))
%%
A = [1 2 3;4 5 6;7 8 9]; B = [1 0 -1;0 1 2; 0 0 0];
rref(A)
null(A, "rational")

rref(B)
null(B, "rational")
% => A i B jsou řádkově ekvivalentní
%%
A = [1 2 3;4 5 6;7 8 9]; B = [1 0 -1;0 1 2; 0 0 0];
rref(A')

rref(B')
% => A a B NEJSOU SLOUPCOVĚ ekvivalentní
%% matlab báze vektorů
 u = [1 1 1 2]
 v = [1 0 1 0]
 w = [-1 1 -2 0]
 z = [1 2 0 2]

