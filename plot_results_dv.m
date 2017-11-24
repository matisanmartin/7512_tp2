function r = plot_results_dv(x, y1, leg1, y2, leg2, y3, leg3, xl, yl, plot_title, filename)
    fig = figure;
    set(fig, 'Visible', 'off');
    plot(x, y1, 'r', 'Markersize', 3);
    l1=sprintf(leg1);
    hold on;
    l2=sprintf(leg2);
    plot(x, y2, 'g', 'Markersize', 3);
    hold on;
    l3 = sprintf(leg3);
    plot(x, y3, 'b', 'Markersize', 3);
    legend(l1, l2, l3);
    xlabel(xl);
    ylabel(yl);
    title(plot_title);
    grid on;
    print(filename, '-djpg')
    r=0;
end
