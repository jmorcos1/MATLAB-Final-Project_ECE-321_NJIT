noise = gaussNoise(4.65, 1, 10000);
[cdf, x] = cdfBuild(noise);
set(0,'DefaultFigureWindowStyle','docked')
figure(1)
plot(x,cdf)

cdf_sm_me = myCurveSmoother8(cdf, x, 25, 3);
figure(2)
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
figure(3)
plot(xPDF, pdf)

pdf100 = myCurveSmoother8(pdf, xPDF, 11, 4);
figure(4)
plot(xPDF, pdf100)

[ball, ballX] = cdfBuildQ(4.65,1, noise);
figure(5)
plot(ballX, ball)


lenBallPDF = lenX - 1;
xBallPDFInd = 1:lenBallPDF;
xBallPDF = interp1(xInd, x, xBallPDFInd);
dFxBall = diff(ball);

nonZIndBall = find(dFxBall); 
lenNZBall = length(nonZIndBall);
if lenNZ < (lenBallPDF*0.9)
    nonZIndBall = [1 nonZIndBall];
    dFxInterpBall = interp1(xBallPDF(nonZIndBall), dFx(nonZInd), xPDF);
    pdfBall = dFxInterpBall./dx;
else
    pdfBall = dFxBall./dx;
end
figure(6)
plot(xBallPDF, pdfBall)

[cdfG, pdfG, xG] = cdfBuildG(4.65,1, noise);
figure(7)
plot(xG, cdfG)
figure(8)
plot(xG, pdfG)
