function out = uncertainty_analysis(tbl,data)
P=pareto_front(tbl); S=data.scenarios; C=zeros(height(P),height(S));
for i=1:height(P)
 yH=P.yH(i); yR=P.yR(i); yT=P.yT(i); yS=P.yS(i); yI=P.yI(i);
 for s=1:height(S)
  pH2=S.pH2(s); pe=S.pe(s); r=S.r(s);
  C(i,s)=65 +25*(1-yH)*pH2 +10*pe +13*yH +18*yH*pe +14*yR -12*yR*pe +r*yR +(5-pe)*yT +4*yS +(4-2*pe)*yI;
 end
end
best=min(C,[],1); Regret=(C-best)./best; maxRegret=max(Regret,[],2);
vars=matlab.lang.makeValidName(cellstr(S.Scenario));
costTable=array2table(C,'VariableNames',vars); costTable=addvars(costTable,P.ID,'Before',1,'NewVariableNames','ID');
regretTable=table(P.ID,maxRegret,'VariableNames',{'ID','MaximumRelativeRegret'}); regretTable=sortrows(regretTable,'MaximumRelativeRegret');
out.pareto=P; out.scenarios=S; out.C=C; out.Regret=Regret; out.bestScenarioCost=best; out.maxRegret=maxRegret; out.costTable=costTable; out.regretTable=regretTable;
end
