function plot_scenario_costs(out)
figure('Color','w'); bar(out.C); grid on; xticks(1:height(out.pareto)); xticklabels(out.pareto.ID);
xlabel('Pareto configuration'); ylabel('Scenario-dependent cost index'); title('The optimum moves when the future changes');
legend(cellstr(out.scenarios.Scenario),'Location','best');
exportgraphics(gcf,fullfile(output_dir(),'04_scenario_costs.png'),'Resolution',220);
end
