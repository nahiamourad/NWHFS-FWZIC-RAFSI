for n=1:7%21
c=EDM_agg{n}; %NW
% check row sizes
sizes = cellfun('length', c);
maxlen = max(sizes);
% equalize row sizes
for i = 1:numel(c)
    c{i} = [c{i} cell(1,maxlen-sizes(i))];
end
% unravel cell array into a 2d cell array
c1 = vertcat(c{:});
% now you can export it easily
writecell(c1, 'results.xlsx', 'sheet', 'Sheet1','WriteMode','append')
end
