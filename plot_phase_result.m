function r = plot_phase_result(v1, u1, l1, v2, u2, l2, v3, u3, l3, xl, yl, title, filename)
    fig = figure;
    set(fig, 'Visible', 'off');
    plot(v1, u1, 'r', 'Markersize', 3);
    l1=sprintf(l1);
    hold on;
    l2=sprintf(l2);
    plot(v2, u2, 'g', 'Markersize', 3);
    hold on;
    l3 = sprintf(l3);
    plot(v3, u3, 'b', 'Markersize', 3);
    LEGEND(l1, l2, l3);
    xlabel(xl);
    ylabel(yl)
    title(title)
    grid on;
    print(fig, filename, '-dpng');
    r=0
end
