%% Beyond the Optimum
% Main driver for the illustrative low-carbon methanol superstructure example.

clear; clc; close all;

% Make sure figures are written to the repository-level figures folder,
% irrespective of MATLAB's Current Folder.
figdir = output_dir();
fprintf('Figures will be written to:\n%s\n\n', figdir);

data = model_data();
tbl = enumerate_configurations(data);
pareto = pareto_front(tbl);

fprintf('\nBEYOND THE OPTIMUM\n');
fprintf('Feasible configurations: %d\n', height(tbl));
fprintf('Pareto-optimal configurations: %d\n\n', height(pareto));
disp(pareto(:, {'ID','yH','yR','yT','yS','yI','Cost','Emissions'}));

plot_all_configurations(tbl, pareto);
plot_pareto(tbl, pareto);

epsResults = epsilon_constraint(tbl);
disp('Epsilon-constraint results:');
disp(epsResults);
plot_epsilon_constraint(epsResults);

scenarioResults = uncertainty_analysis(tbl, data);
fprintf('\nScenario costs for Pareto configurations:\n');
disp(scenarioResults.costTable);
fprintf('\nMaximum regret by Pareto configuration:\n');
disp(scenarioResults.regretTable);

plot_scenario_costs(scenarioResults);
plot_regret(scenarioResults);

fprintf('\nFigures written to:\n%s\nDone.\n', figdir);
