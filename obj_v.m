function [ f ] = obj_v( S, C, P, requests )
%OBJ_V Determines an objective function vector
%   OBJ_V(S, C, P, requests) requests is S by C

f = zeros([S C P]); % Initialize f
for i=1:S   % For each element in requests
    for j=1:C
        % Set all of periods in f for that student and course equal to
        % -requests. If the student wants the course, the periods are
        % filled with -1s, else they are filled with 0s
        f(i,j,:) = -requests(i,j); 
    end
end
f = f(:); % Reshape f into a vector
end