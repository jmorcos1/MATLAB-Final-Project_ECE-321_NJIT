function curveOut = myCurveSmoother2(curveYIn, curveX, factorOption1, factorOption2)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%   Note that the input arguments must both be 1-D vectors
%   with same lenght and orientation
%   Recommended inputs: (y, x, 1, 5) >> divide N/250
%                       (y, x, 2, 5) >> divide N/200   
fa = factorOption1*factorOption2;
fb = fa*2;
fc = fa*fa*fb;

x = curveX;
lenXin = length(x);
xMin = min(x);
xMax = max(x);

multiple = idivide(lenXin,fc, 'ceil');
lenX = fc*multiple;




lenX4 = idivide(lenX,fc)
%lenX4 =lenX3/fb;
x4Ind = 1:lenX4; 
x4 = linspace(xMin, xMax, lenX4);
lenX3 = lenX4*fb;
x3 = linspace(xMin, xMax, lenX3);
lenX2 = idivide(lenX,fa);
x2 = linspace(xMin, xMax, lenX2);

lenX2 = idivide(lenX,fa);
x2 = linspace(xMin, xMax, lenX2);
lenX3 = lenX2/fa;
x3 = linspace(xMin, xMax, lenX3);


curve = zeros(1, lenX4);
newCurve = curveYIn;
reps = 1:100;
for rep = reps
    for c = x4Ind
        curve(c) = newCurve(c*fc);
    end
    newCurve = interp1(x4, curve, x3);
    newCurve = interp1(x3, newCurve, x2);
    newCurve = interp1(x2, newCurve, x);
end
curveOut = newCurve;
end