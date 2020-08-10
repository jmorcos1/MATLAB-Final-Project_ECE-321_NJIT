function curveOut = myCurveSmoother5(curveYIn, curveX, factor, iterations, type)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%   Note that the input arguments must both be 1-D vectors
%   with same lenght and orientation
switch type
    case 1
        method = 'linear';
    case 2
        method = 'makima';
    case 3
        method = 'pchip';
    case 4
        method = 'spline';
end

xIn = curveX;
lenXIn = length(xIn);
xMin = min(xIn);
xMax = max(xIn);
f = uint32(factor);
multiple = idivide(lenXIn, f, 'ceil');
lenX = f*multiple;
x = linspace(xMin, xMax, lenX);
newCurve = interp1(xIn, curveYIn, x, method);

lenX2 = (lenX/f)+1;
x2Ind = 1:lenX2; 
x2 = linspace(xMin, xMax, lenX2);
curve2 = zeros(1, lenX2);

reps = 1:iterations;
for rep = reps
    for c = x2Ind
        if c == 1
            curve2(c) = newCurve(1);
        elseif c == lenX2
                curve2(c) = newCurve(lenX);
        else
            curve2(c) = newCurve(c*f);
        end
    end
    newCurve = interp1(x2, curve2, x, method);
end
newCurve = interp1(x, newCurve, xIn, method);
curveOut = newCurve;
end
