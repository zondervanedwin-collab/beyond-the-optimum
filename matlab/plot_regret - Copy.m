function plot_regret(out)
figure('Color','w'); bar(100*out.maxRegret); grid on; xticks(1:height(out.pareto)); xticklabels(out.pareto.ID);
xlabel('Pareto configuration'); ylabel('Maximum relative regret (%)'); title('Decision-making under uncertainty: minimax regret');
[best,idx]=min(out.maxRegret); hold on; plot(idx,100*best,'o','MarkerSize',10,'LineWidth',2);
exportgraphics(gcf,fullfile(output_dir(),'05_maximum_regret.png'),'Resolution',220);
end
