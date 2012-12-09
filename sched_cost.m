function value = sched_cost( sched, requests )
%SCHED_COST computes the number of student requests that are not met
%   sched_cost(sched, requests)
%      sched = students x courses x periods
%      requests = students x courses

if size(find(sum(sched,3) > 1), 1)
    error 'Someone assigned to a course multiple times'
end

a = sum(sched, 3) .* requests;
value = sum(a(:));
end


