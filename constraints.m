function [ A b ] = constraints( S, C, P )
%CONSTRAINTS Generates constraints
%   CONSTRAINTS(S, C, P)


% A is # constraints by SCP
% b is # constraints by 1
% A * x <= b

total = S*P + S*C + C*P;  % CHANGE ME BASED ON # OF CONSTRAINTS

A = zeros(total, S*C*P);
b = zeros(total, 1);
vars = [S C P];

counter = 1;

% May not attend more than one course during a specific period
for s = 1:S
    for p=1:P
        a = zeros(vars);
        a(s, :, p) = 1;
        A(counter, :) = a(:);
        b(counter) = 1;
        counter = counter + 1;
    end
    display(sprintf('%i of %i', counter, total));
end

% May not attend each course more than once per day
for s = 1:S
    for c=1:C
        a = zeros(vars);
        a(s, c, :) = 1;
        A(counter, :) = a(:);
        b(counter) = 1;
        counter = counter + 1;
    end
    display(sprintf('%i of %i', counter, total));
end


for c=1:C
    for p=1:P
        a = zeros(vars);
        a(:,c,p) = 1;
        A(counter, :) = a(:);
        b(counter) = 30; % MAX CLASS SIZE
        counter = counter + 1;
    end
    display(sprintf('%i of %i', counter, total));
end

A = sparse(A);
b = sparse(b');
display(sprintf('%i constraints', counter - 1));
end