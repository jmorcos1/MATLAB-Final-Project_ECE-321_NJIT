function [axOut, labelPos] = formatAxis(axisIn,x,y, up, down, left, right, xLabR, xLabD, yLabL, yLabU)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
xMax = max(x);
xMin = min(x);
yMax = max(y);
yMin = min(y);
domain = xMax - xMin;
range = yMax - yMin;
%xLimits
xExtendL = domain*left;
xExtendR = domain*right;
xL1 = xMin - xExtendL;
xL2 = xMax + xExtendR;
%yLimits
yExtendU = range*up;
yExtendD = range*down;
yL1 = yMin - yExtendD;
yL2 = yMax + yExtendU;
%xLabelPosition
xLPR = domain*xLabR;
xLPD = range*xLabD;
xLPx = xMax + xLPR;
xLPy = yMin - xLPD;
%yLabelPosition
yLPL = domain*yLabL;
yLPU = range*yLabU;
yLPx = xMin - yLPL;
yLPy = yMax + yLPU;
%output label position vector
labelPos = [xLPx xLPy yLPx yLPy];
%Format the axis itself



ax = axisIn;
axis(ax, [xL1 xL2 yL1 yL2])
set(ax, 'XMinorTick','on','YMinorTick','on', 'box', 'off', 'LineWidth', 1.2)

hold on
arrow3([xL1 yL1],[xL1 yL2*1.02],'k-0.5',0.8) %Add Arrows for goodLooks
arrow3([xL1 yL1],[xL2*1.01 yL1],'k-0.5',0.8)
hold off

minorTcksX = ax.XRuler.MinorTickValues;
[ticksX, minorTcksX] = tickDoubler2(xticks,minorTcksX);
set(ax, 'XTick', ticksX, 'TickLength', [0.02 0.025], 'TickDir', 'both')
ax.XRuler.MinorTickValues = minorTcksX;


minorTcksY = ax.YRuler.MinorTickValues;
[ticksY, minorTcksY] = tickDoubler2(yticks, minorTcksY);
set(ax, 'YTick', ticksY, 'TickLength', [0.02 0.025], 'TickDir', 'both')
ax.YRuler.MinorTickValues = minorTcksY;

ax.FontSize = 8;

grid on
%hold on
%arrow3([xL1 yL1],[xL1 yL2*1.02],'k-0.5',1) %Add Arrows for goodLooks
%arrow3([xL1 yL1],[xL2*1.01 yL1],'k-0.5',1)
%hold off
axOut = ax;
end

