S = 100; % Number of Students
P = 5; % Number of Periods
C = 20; % Number of Courses


% Randomly generate students requests
picks = randi([1 C], [S P]); % Each student randomly selects P courses
requests = zeros(S,C);
for s=1:S
    requests(s, picks(s, :)) = 1; % Set requests(s, p) equal to 1 for each
end                               % course the student selected

f = obj_v(S,C,P, requests); % Generate the objective matrix f

[A b] = constraints(S,C,P); % Generate the constraints

[soln fval exitflag output] = bintprog(f', A, b'); % Optimize
soln = reshape(soln, S, C, P); % Reshape the solution into an S by C by P matrix