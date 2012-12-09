function [ f ] = obj_v( S, C, P, requests )
%OBJ_V Determines an objective function vector
%   OBJ_V(S, C, P, requests)

% f(:) is S*C*P by 1 objective function.
% x(:) is long by 1
% f(:)' * x(:) gives number for objective to maximize
% -f(:)' * x(:) gives objective to minimize

f = zeros([S C P]);
for i=1:size(requests,1)
    for j=1:size(requests,2)
        f(i,j,:) = requests(i,j);
    end
end

f = sparse(-f(:)');

end