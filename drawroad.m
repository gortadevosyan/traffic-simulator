function drawroad(x1, x2, x3, x4, w, k)
    % from the point xi(1), xi(2) we draw two lines. This requires two
    % points, and the second one is identified through the lenght of the
    % road, which is k*w
    line( [x1(1), x1(1)],     [x1(2), x1(2)+k*w], 'Color', 'black');
    line( [x1(1), x1(1)-k*w], [x1(2), x1(2)],     'Color', 'black');

    %draws the second L-shaped body
    line( [x2(1), x2(1)],     [x2(2), x2(2)-k*w], 'Color', 'black');
    line( [x2(1), x2(1)-k*w], [x2(2), x2(2)],     'Color', 'black');

    %draws the third L-shaped body 
    line( [x3(1), x3(1)],     [x3(2), x3(2)-k*w], 'Color', 'black');
    line( [x3(1), x3(1)+k*w], [x3(2), x3(2)],     'Color', 'black');

    %draws the fourth L-shaped body
    line( [x4(1), x4(1)],     [x4(2), x4(2)+k*w], 'Color', 'black');
    line( [x4(1), x4(1)+k*w], [x4(2), x4(2)],     'Color', 'black');
    drawdotlines(w, k);
end
 
function drawdotlines(w, k)
     line([-(k+1)*w, -w], [0, 0], 'Color', '#808080', 'LineStyle', '--');
     line([(k+1)*w, w], [0, 0], 'Color', '#808080', 'LineStyle', '--');
     line([0, 0], [-(k+1)*w, -w], 'Color', '#808080', 'LineStyle', '--');
     line([0, 0], [(k+1)*w, w], 'Color', '#808080', 'LineStyle', '--');
end
