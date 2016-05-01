clear; clc;
% Feasibility cuts example

xi1 = 6
xi2 = 8
c = [3;2]
q=[15;12;0;0;0;0;0;0]
W=[3,2,1,0,0,0,0,0;...
   2,5,0,1,0,0,0,0;...
   1,0,0,0,1,0,0,0;...
  -1,0,0,0,0,1,0,0;...
   0,1,0,0,0,0,1,0;...
   0,-1,0,0,0,0,0,1]

W_num_rows = size(W,1);
W_num_cols = size(W,2);

A = [W,eye(W_num_rows),-1*eye(W_num_rows)]

e = [zeros(W_num_cols,1);ones(W_num_rows,1);ones(W_num_rows,1)];

h=[0;0;xi1;-0.8*xi1;xi2;-0.8*xi2]
T=[-1*eye(2);zeros(4,2)]

%lb = zeros(size(A,1),1)
options = optimset('Simplex','on');

% Iter 1
disp('Iteration 1:')

x = [0;0]
b = h - T*x
[sigma,fval,exitflag,output,lambda] = linprog(-b,A',e,[],[])

%lambda.ineqlin
D1 = sigma'*T
d1 = sigma'*h

% Iter 2
disp('Iteration 2:')

[x,fval,exitflag,output,lambda] = linprog(c,-1*D1,-1*d1,[],[],[0;0])

b = h - T*x

[sigma,fval,exitflag,output,lambda] = linprog(-b,A',e,[],[])

D2 = sigma'*T
d2 = sigma'*h

% Iter 3
disp('Iteration 3:')

D = [D1;D2]
d = [d1;d2]

[x,fval,exitflag,output,lambda] = linprog(c,-1*D,-1*d,[],[],[0;0])

b = h - T*x

[sigma,fval,exitflag,output,lambda] = linprog(-b,A',e,[],[])

D3 = sigma'*T
d3 = sigma'*h

% Iter 4
disp('Iteration 4:')

D = [D;D3]
d = [d;d3]

[x,fval,exitflag,output,lambda] = linprog(c,-1*D,-1*d,[],[],[0;0])

b = h - T*x

[sigma,fval,exitflag,output,lambda] = linprog(-b,A',e,[],[])

D4 = sigma'*T
d4 = sigma'*h

% Iter 5
disp('Iteration 5:')

D = [D;D4]
d = [d;d4]

[x,fval,exitflag,output,lambda] = linprog(c,-1*D,-1*d,[],[],[0;0])

b = h - T*x

[sigma,fval,exitflag,output,lambda] = linprog(-b,A',e,[],[])

D5 = sigma'*T
d5 = sigma'*h

% Iter 6
disp('Iteration 6:')

D = [D;D5]
d = [d;d5]

[x,fval,exitflag,output,lambda] = linprog(c,-1*D,-1*d,[],[],[0;0])

b = h - T*x

[sigma,fval,exitflag,output,lambda] = linprog(-b,A',e,[],[])

D6 = sigma'*T
d6 = sigma'*h

% Iter 7
disp('Iteration 7:')

D = [D;D6]
d = [d;d6]

[x,fval,exitflag,output,lambda] = linprog(c,-1*D,-1*d,[],[],[0;0])





