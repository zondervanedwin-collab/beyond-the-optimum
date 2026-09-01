function plot_all_configurations(tbl,pareto)
figure('Color','w');
scatter(tbl.Emissions,tbl.Cost,48,'filled'); hold on;
scatter(pareto.Emissions,pareto.Cost,80,'filled'); grid on;
xlabel('Emissions index'); ylabel('Annualized cost index');
title('Feasible superstructure configurations');
legend('Feasible configurations','Pareto-optimal configurations','Location','best');
exportgraphics(gcf,fullfile(output_dir(),'01_all_configurations.png'),'Resolution',220);
end
