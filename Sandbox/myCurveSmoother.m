function curveOut = myCurveSmoother(curveYIn, curveX)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%   Note that the input arguments must both be 1-D vectors
%   with same lenght and orientation
x = curveX;
lenX = length(curveX);
xMin = min(x);
xMax = max(x);


newCurve = curveYIn;
reps = 1:100;
for rep = reps
    f = 5;
    lenX2 = lenX/f;
    x2Ind = 1:lenX2; 
    x2 = linspace(xMin, xMax, lenX2);
    curve2 = zeros(1, lenX2);
    for c1 = x2Ind
        curve2(c1) = newCurve(c1*f);
    end
    f = 5;
    lenX3 = lenX2/f;
    x3Ind = 1:lenX3; 
    x3 = linspace(xMin, xMax, lenX3);
    curve3 = zeros(1, lenX3);
    for c2 = x3Ind
        curve3(c2) = curve2(c2*f);
    end
    f = 10;
    lenX4 = lenX3/f;
    x4Ind = 1:lenX4; 
    x4 = linspace(xMin, xMax, lenX4);
    curve4 = zeros(1, lenX4);
    for c3 = x4Ind
        curve4(c3) = curve3(c3*f);
    end
    
    newCurve = interp1(x4, curve4, x3);
    newCurve = interp1(x3, newCurve, x2);
    newCurve = interp1(x2, newCurve, x);
end
curveOut = newCurve;
end

