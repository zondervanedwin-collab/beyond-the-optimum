function plot_pareto(tbl,pareto)
figure('Color','w'); scatter(tbl.Emissions,tbl.Cost,30); hold on;
plot(pareto.Emissions,pareto.Cost,'-o','LineWidth',1.8,'MarkerSize',7); grid on;
xlabel('Emissions index'); ylabel('Annualized cost index');
title('Beyond a single optimum: the Pareto front');
for i=1:height(pareto)
    text(pareto.Emissions(i)+0.8,pareto.Cost(i)+0.4,char(pareto.ID(i)),'FontSize',8);
end
exportgraphics(gcf,fullfile(output_dir(),'02_pareto_front.png'),'Resolution',220);
end
