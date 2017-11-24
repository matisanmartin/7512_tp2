function r = plot_results(x, y1, leg1, y2, leg2, y3, leg3, xl, yl, title, filename)
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
    LEGEND(l1, l2, l3);
    xlabel(xl);
    ylabel(yl)
    title(title)
    grid on;
    print(fig, filename, '-dpng');
    r=0
end
