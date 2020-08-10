function dy_dx = myDeriv(x,y)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
lenX = length(x);
lenXD = lenX - 1;
xInd = 1:lenX;
dxInd = 1:lenXD;
xD = interp1(xInd, x, dxInd);
dFx = diff(y);
dx = diff(x);
nonZInd = find(dFx); 
lenNZ = length(nonZInd);
if lenNZ < (lenXD*0.9)
    nonZInd = [1 nonZInd];
    dFxInterp = interp1(xD(nonZInd), dFx(nonZInd), xD);
    fPrime = dFxInterp./dx;
else
    fPrime = dFx./dx;
end
fPrime = interp1(xD, fPrime, x);

%%%Check This Possible Error Source:
if isnan(fPrime(lenX))
    fPrime(lenX) = fPrime(lenX-1);
end
dy_dx = fPrime;
end
