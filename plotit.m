function plotit(X, IDX)

    k=max(IDX);

    Colors=hsv(k);

    ClusterArr = {};
    for i=0:k
        Xi=X(IDX==i,:);
        if i~=0
            Style = 'X';
            MarkerSize = 15;
            LineWidth = 5;
            Color = Colors(i,:);
            ClusterArr{end+1} = ['Cluster #' num2str(i)];
        else
            Style = '.';
            MarkerSize = 6;
            Color = [0 0 0];
            if ~isempty(Xi)
                ClusterArr{end+1} = 'Noise';
            end
        end
        if ~isempty(Xi)
            plot(Xi(:,1),Xi(:,2),Style,'MarkerSize',MarkerSize,'Color',Color);
        end
        hold on;
    end
    hold off;
    axis equal;
    grid on;
    legend(ClusterArr);
    legend('Location', 'NorthEastOutside');

end