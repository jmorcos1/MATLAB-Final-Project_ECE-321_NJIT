function axOut = titleAndLabel(axIn, gTitle, gXLabel, gYLabel, gLabPos)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
ax = axIn;
title(ax, gTitle, 'FontSize', 10.25)
xLbl = xlabel(ax, gXLabel, 'FontSize', 10);
xLbl.Position = [gLabPos(1) gLabPos(2)];
yLbl = ylabel(ax, gYLabel, 'FontSize', 10, 'Rotation', 0);
yLbl.Position = [gLabPos(3) gLabPos(4)];
axOut = ax;
end

