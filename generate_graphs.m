% Generate graphs

% Section sizes
section_sizes = sum(soln,1);
freq = tabulate(section_sizes(:));
bar(freq(2:end,2));                % Generate a frequency graph, excluding zero
set(gca, 'XTickLabel', freq(2:end,1));
xlabel = 'Course size (# of students)';
ylabel = 'Frequency';
