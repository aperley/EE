clear
clc

S = 100; % Number of Students
P = 8; % Number of Periods
C = 20; % Number of Courses

time = zeros(4,1);

%requests = zeros(S, C);
tic
requests = sparse(randi([0 1], [S C]));
time(1) = toc;

tic
f = obj_v(S,C,P, requests);
time(2) = toc;

tic
[A b] = constraints(S,C,P);
time(3) = toc;

tic
[soln fval exitflag output] = bintprog(f, A, b);
time(4) = toc;

soln = reshape(soln, S, C, P);