function tbl = enumerate_configurations(data)
Y = dec2bin(0:31,5)-'0';
Y = Y(Y(:,2) <= Y(:,1),:); % renewables only if electrolysis exists
Cost = data.C0 + Y*data.c(:);
Emissions = data.E0 + Y*data.e(:);
ID = "D" + string((1:size(Y,1))');
tbl = table(ID,Y(:,1),Y(:,2),Y(:,3),Y(:,4),Y(:,5),Cost,Emissions, ...
    'VariableNames',{'ID','yH','yR','yT','yS','yI','Cost','Emissions'});
end
