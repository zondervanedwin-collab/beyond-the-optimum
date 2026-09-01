function pareto = pareto_front(tbl)
n=height(tbl); dom=false(n,1);
for i=1:n
    for j=1:n
        if i==j, continue; end
        noWorse = tbl.Cost(j)<=tbl.Cost(i) && tbl.Emissions(j)<=tbl.Emissions(i);
        strict = tbl.Cost(j)<tbl.Cost(i) || tbl.Emissions(j)<tbl.Emissions(i);
        if noWorse && strict, dom(i)=true; break; end
    end
end
pareto=sortrows(tbl(~dom,:),'Cost');
end
