noise = gaussNoise(4.65, 0.1, 10000);
[cdf, x] = cdfBuild(noise);
set(0,'DefaultFigureWindowStyle','docked')
figure(1)
plot(x,cdf)

cdf_sm_me = myCurveSmoother6(cdf, x, 40000, 1, 3);
figure(3)
plot(x, cdf_sm_me)

lenX = length(x); lenPDF = lenX - 1;
xInd = 1:lenX;
xPDFInd = 1:lenPDF;
xPDF = interp1(xInd, x, xPDFInd);
dFx = diff(cdf_sm_me);
dx = diff(x);

nonZInd = find(dFx); 
lenNZ = length(nonZInd);
if lenNZ < (lenPDF*0.9)
    nonZInd = [1 nonZInd];
    dFxInterp = interp1(xPDF(nonZInd), dFx(nonZInd), xPDF);
    pdf = dFxInterp./dx;
else
    pdf = dFx./dx;
end
figure(4)
plot(xPDF, pdf)

pdf100 = myCurveSmoother6(pdf, xPDF, 90909, 1, 4);
figure(5)
plot(xPDF, pdf100)