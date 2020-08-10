function [outputArg1,outputArg2] = untitled(inputArg1,inputArg2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here



noise = gaussNoise(0,1,10000);
x = linspace(min(noise),max(noise),100000);
lenX = length(x);
N = length(noise);
cdf = zeros(1, lenX);
kC = 1;
%elF_X_u = false(1, lenX);
for v = x
elF_X_u = noise <= v;
cdf(kC) = sum(elF_X_u)/N;
kC = kC + 1;
end
cdf = interp1(x, cdf, linspace(min(noise),max(noise),1000000));
x =linspace(min(noise),max(noise),1000000);
figure(1)
plot(x, cdf)




cdf2 = myCurveSmoother(cdf, x);
ldfCnange = length(x)/100;
xCInd = 1:ldfCnange; 
xC = linspace(min(x), max(x), ldfCnange);
cdf333 = zeros(1, ldfCnange);
for cC = xCInd
        cdf333(cC) = cdf2(cC*100);
end
figure(12)
plot(xC,cdf333)
lenX = length(xC); lenPDF = (lenX - 1);
xPDF = zeros(1, lenPDF);
for kG = 1:lenPDF
xPDF(kG) = x(kG);
end
dFx = diff(cdf333);
dx = diff(xC);

%nonZInd = find(dFx);
%dFxInterp = interp1(xPDF(nonZInd), dFx(nonZInd), xPDF);
%pdf = dFxInterp./dx;
pdf = dFx./dx;

figure(13)
plot(xPDF, pdf)








cdf2 = myCurveSmoother(cdf, x);
figure(12)
plot(x,cdf2)
lenX = length(x); lenPDF = lenX - 1;
xPDF = zeros(1, lenPDF);
for kG = 1:lenPDF
xPDF(kG) = x(kG);
end
dFx = diff(cdf2);
dx = diff(x);
nonZInd = find(dFx); nonZInd = [1 nonZInd];
dFxInterp = interp1(xPDF(nonZInd), dFx(nonZInd), xPDF);
pdf = dFxInterp./dx;
figure(13)
plot(xPDF, pdf)









cdf2 = myCurveSmoother(cdf, x);
figure(12)
plot(x,cdf2)
lenX = length(x); lenPDF = lenX - 1;
xPDF = zeros(1, lenPDF);
for kG = 1:lenPDF
xPDF(kG) = x(kG);
end
dFx = diff(cdf2);
dx = diff(x);
nonZInd = find(dFx); nonZInd = [1 nonZInd];
dFxInterp = interp1(xPDF(nonZInd), dFx(nonZInd), xPDF);
pdf = dFxInterp./dx;
figure(13)
plot(xPDF, pdf)










lenCDFevenSmoother = lenCDFsmoother/10;
x4 =linspace(min(noise),max(noise),lenCDFevenSmoother);
cdfEvenSmoother2 = zeros(1,lenCDFevenSmoother);
for ff = 1:lenCDFevenSmoother
cdfEvenSmoother2(ff) = cdfSmoother2(ff*10);
end


cdfSmooth2 = zeros(1,lenCDFsm);
for ff = 1:lenCDFsm
cdfSmooth2(ff) = cdf4(ff*5);
end

lenCDFsmoother = lenCDFsm/5;
x3 =linspace(min(noise),max(noise),lenCDFsmoother);
cdfSmoother2 = zeros(1,lenCDFsmoother);
for ff = 1:lenCDFsmoother
cdfSmoother2(ff) = cdfSmooth2(ff*5);
end
lenCDFevenSmoother = lenCDFsmoother/10;
x4 =linspace(min(noise),max(noise),lenCDFevenSmoother);
cdfEvenSmoother2 = zeros(1,lenCDFevenSmoother);
for ff = 1:lenCDFevenSmoother
cdfEvenSmoother2(ff) = cdfSmoother2(ff*10);
end
cdf4 = interp1(x4, cdfEvenSmoother2, x3);
cdf4 = interp1(x3, cdf4, x2);
cdf4 = interp1(x2, cdf4, x);
figure(11)
plot(x,cdf4)







lenCDFevenSmoother = lenCDFsmoother/10;
x4 =linspace(min(noise),max(noise),lenCDFevenSmoother);
cdfEvenSmoother2 = zeros(1,lenCDFevenSmoother);
for ff = 1:lenCDFevenSmoother
cdfEvenSmoother2(ff) = cdfSmoother2(ff*10);
end
cdfSmooth2 = zeros(1,lenCDFsm);
for ff = 1:lenCDFsm
cdfSmooth2(ff) = cdf4(ff*5);
end
lenCDFsmoother = lenCDFsm/5;
x3 =linspace(min(noise),max(noise),lenCDFsmoother);
cdfSmoother2 = zeros(1,lenCDFsmoother);
for ff = 1:lenCDFsmoother
cdfSmoother2(ff) = cdfSmooth2(ff*5);
end
lenCDFevenSmoother = lenCDFsmoother/10;
x4 =linspace(min(noise),max(noise),lenCDFevenSmoother);
cdfEvenSmoother2 = zeros(1,lenCDFevenSmoother);
for ff = 1:lenCDFevenSmoother
cdfEvenSmoother2(ff) = cdfSmoother2(ff*10);
end
cdf4 = interp1(x4, cdfEvenSmoother2, x3);
cdf4 = interp1(x3, cdf4, x2);
cdf4 = interp1(x2, cdf4, x);








%------------
cdf2 = myCurveSmoother(cdf, x);
figure(12)
plot(x,cdf2)
lenX = length(x); lenPDF = lenX - 1;
xPDF = zeros(1, lenPDF);
for kG = 1:lenPDF
xPDF(kG) = x(kG);
end
dFx = diff(cdf2);
dx = diff(x);
nonZInd = find(dFx); nonZInd = [1 nonZInd];
dFxInterp = interp1(xPDF(nonZInd), dFx(nonZInd), xPDF);
pdf = dFxInterp./dx;
figure(13)
plot(xPDF, pdf)


%----------
cdf2 = myCurveSmoother4(cdf, x, 250, 100, 2);
figure(18)
plot(x,cdf2)
lenX = length(x); lenPDF = lenX - 1;
xPDF = zeros(1, lenPDF);
for kG = 1:lenPDF
xPDF(kG) = x(kG);
end
dFx = diff(cdf2);
dx = diff(x);
nonZInd = find(dFx); nonZInd = [1 nonZInd];
dFxInterp = interp1(xPDF(nonZInd), dFx(nonZInd), xPDF);
pdf = dFxInterp./dx;
figure(19)
plot(xPDF, pdf)
pdf100 = myCurveSmoother4(pdf, xPDF, 500, 200, 2);
figure(20)
plot(xPDF, pdf100)
cdf2 = myCurveSmoother4(cdf, x, 250, 100, 2);
figure(18)
plot(x,cdf2)
lenX = length(x); lenPDF = lenX - 1;
xPDF = zeros(1, lenPDF);
for kG = 1:lenPDF
xPDF(kG) = x(kG);
end
dFx = diff(cdf2);
dx = diff(x);
nonZInd = find(dFx); nonZInd = [1 nonZInd];
dFxInterp = interp1(xPDF(nonZInd), dFx(nonZInd), xPDF, 'pchip');
pdf = dFxInterp./dx;
figure(19)
plot(xPDF, pdf)
pdf100 = myCurveSmoother4(pdf, xPDF, 500, 200, 2);
figure(20)
plot(xPDF, pdf100)









 cdf2 = myCurveSmoother4(cdf, x, 250, 100, 3);
figure(18)
plot(x,cdf2)
lenX = length(x); lenPDF = lenX - 1;
xPDF = zeros(1, lenPDF);
for kG = 1:lenPDF
xPDF(kG) = x(kG);
end
dFx = diff(cdf2);
dx = diff(x);
nonZInd = find(dFx); nonZInd = [1 nonZInd];
dFxInterp = interp1(xPDF(nonZInd), dFx(nonZInd), xPDF, 'makima');
pdf = dFxInterp./dx;
figure(19)
plot(xPDF, pdf)
pdf100 = myCurveSmoother4(pdf, xPDF, 500, 200, 4);
figure(20)
plot(xPDF, pdf100)























outputArg1 = inputArg1;
outputArg2 = inputArg2;
end

