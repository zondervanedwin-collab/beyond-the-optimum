function plot_epsilon_constraint(results)
figure('Color','w'); plot(results.Epsilon,results.Cost,'-o','LineWidth',1.8); grid on; set(gca,'XDir','reverse');
xlabel('epsilon: maximum allowed emissions index'); ylabel('Minimum achievable cost index');
title('epsilon-constraint: tightening the carbon limit');
for i=1:height(results), text(results.Epsilon(i),results.Cost(i)+0.4,char(results.ID(i)),'HorizontalAlignment','center'); end
exportgraphics(gcf,fullfile(output_dir(),'03_epsilon_constraint.png'),'Resolution',220);
end
