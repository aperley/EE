clear
clc

S = 100; % Number of Students
P = 8; % Number of Periods
C = 20; % Number of Courses


%requests = zeros(S, C);
requests = randi([0 1], [S C]);

f = obj_v(S,C,P, requests);
[A b] = constraints(S,C,P);

[x fval exitflag output] = bintprog(f, A, b);

soln = reshape(x, S, C, P);