function [ A b ] = constraints( S, C, P )
%CONSTRAINTS Generates constraints matrix and vector
%   CONSTRAINTS(S, C, P)


% A is # constraints by SCP
% b is # constraints by 1
% A * x <= b

total = S*P + S*C + C*P;  % Total number of constraints

A = zeros(total, S*C*P);
b = zeros(total, 1);
vars = [S C P];

counter = 1; % Keep track of the constraint #

% May not attend more than one course during a specific period
for s = 1:S                    % For each student
    for p=1:P                  % For each period
        a = zeros(vars);       % Initialize an empty schedule
        a(s, :, p) = 1;        % Set all of the courses equal to 1
        A(counter, :) = a(:);  % Make 3D matrix a into a row in A
        
        b(counter) = 1;        % Maximum number of courses per period
        counter = counter + 1;
    end
end

% May not attend each course more than once per day
for s = 1:S
    for c=1:C
        a = zeros(vars);
        a(s, c, :) = 1;
        A(counter, :) = a(:);
        b(counter) = 1;  % Maximum number of times a course may be taken each day
        counter = counter + 1;
    end
end

% Maximum section size
for c=1:C
    for p=1:P
        a = zeros(vars);
        a(:,c,p) = 1;
        A(counter, :) = a(:);
        b(counter) = 20;  % Maximum section size
        counter = counter + 1;
    end
end
end