%% Optional solver-based demonstration (Optimization Toolbox required)
clear; clc; data=model_data(); f=data.c(:);
A=[-1 1 0 0 0]; b=0; lb=zeros(5,1); ub=ones(5,1); intcon=1:5;
[yCost,fvalCost]=intlinprog(f,intcon,A,b,[],[],lb,ub);
fprintf('Minimum cost: C=%.1f, E=%.1f\n',data.C0+fvalCost,data.E0+data.e*yCost);
[yEm,fvalEm]=intlinprog(data.e(:),intcon,A,b,[],[],lb,ub);
fprintf('Minimum emissions: C=%.1f, E=%.1f\n',data.C0+data.c*yEm,data.E0+fvalEm);
epsilon=50; Aeps=[A;data.e]; beps=[b;epsilon-data.E0];
[yEps,fvalEps]=intlinprog(f,intcon,Aeps,beps,[],[],lb,ub);
fprintf('E<=%.1f: C=%.1f, E=%.1f\n',epsilon,data.C0+fvalEps,data.E0+data.e*yEps);
