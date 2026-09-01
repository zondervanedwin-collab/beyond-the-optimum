function results = epsilon_constraint(tbl)
epsValues=[100 90 80 70 60 50 45 40 38];
rows={};
for k=1:numel(epsValues)
    e=epsValues(k); feas=tbl(tbl.Emissions<=e,:);
    if isempty(feas), continue; end
    [~,idx]=min(feas.Cost); b=feas(idx,:);
    rows(end+1,:)={e,b.ID,b.yH,b.yR,b.yT,b.yS,b.yI,b.Cost,b.Emissions}; %#ok<AGROW>
end
results=cell2table(rows,'VariableNames',{'Epsilon','ID','yH','yR','yT','yS','yI','Cost','Emissions'});
end
