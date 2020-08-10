function curveOut = myCurveSmoother7(curveYIn, curveX, factor, iterations)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%   Note that the input arguments must both be 1-D vectors
%   with same lenght and orientation

xIn = curveX;
lenXIn = length(xIn);
xMin = min(xIn);
xMax = max(xIn);
f = uint32(factor);

multiple = idivide(lenXIn, f, 'ceil');
lenX = f*multiple;
x = linspace(xMin, xMax, lenX);
newCurve = spline(xIn, curveYIn, x);

lenX2 = lenX/f;
x2 = linspace(xMin, xMax, lenX2);

reps = 1:iterations;
for rep = reps
    curve2 = spline(x, newCurve, x2);
    newCurve = spline(x2, curve2, x);
end
newCurve = spline(x, newCurve, xIn);
curveOut = newCurve;
end
