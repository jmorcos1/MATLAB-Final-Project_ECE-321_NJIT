%********
noise = gaussNoise(4.65, 1, 10000);
[cdf, x] = cdfBuild(noise);
set(0,'DefaultFigureWindowStyle','docked')
figure(1)
plot(x,cdf)

%Matlab's
[pdfSM_mat, window] = smoothdata(cdf,'gaussian');
%^not pretty, very taxing, took tooooo long
%^ window was 442941
figure(2)
plot(x, pdfSM_mat)

%mine
cdf_sm_me = myCurveSmoother6(cdf, x, 4000, 250, 3);
%^way faster
figure(3)
plot(x, cdf_sm_me)

%mine2
cdf_sm_me = myCurveSmoother6(cdf, x, 50000, 1, 3);
%^way faster
figure(3)
plot(x, cdf_sm_me)

%*******
%mine2
cdf_sm_me = myCurveSmoother6(cdf, x, 40000, 1, 3);
%^way faster
figure(3)
plot(x, cdf_sm_me)


%mine2
cdf_sm_me = myCurveSmoother6(cdf, x, 100000, 1, 3);
%^way faster
figure(3)
plot(x, cdf_sm_me)

%********
%mine%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lenX = length(x); lenPDF = lenX - 1;
xInd = 1:lenX;
xPDFInd = 1:lenPDF;
xPDF = interp1(xInd, x, xPDFInd);
dFx = diff(cdf_sm_me);
dx = diff(x);

nonZInd = find(dFx); nonZInd = [1 nonZInd];
dFxInterp = interp1(xPDF(nonZInd), dFx(nonZInd), xPDF);
pdf = dFxInterp./dx;
figure(4)
plot(xPDF, pdf)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%*********
pdf100 = myCurveSmoother6(pdf, xPDF, 90909, 1, 4);
figure(5)
plot(xPDF, pdf100)









%mineALSO%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lenX = length(x); lenPDF = lenX - 1;
xInd = 1:lenX;
xPDFInd = 1:lenPDF;
xPDF = interp1(xInd, x, xPDFInd);
dFx = diff(cdf_sm_me);
dx = diff(x);
pdf = dFx./dx;
figure(4)
plot(xPDF, pdf)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%





pdf100 = myCurveSmoother6(pdf, xPDF, 2000, 250, 4);
figure(5)
plot(xPDF, pdf100)

pdf100 = myCurveSmoother6(pdf, xPDF, 4000, 250, 4);
figure(5)
plot(xPDF, pdf100)

pdf100 = myCurveSmoother6(pdf, xPDF, 6000, 250, 4);
figure(5)
plot(xPDF, pdf100)

pdf100 = myCurveSmoother6(pdf, xPDF, 8000, 250, 4);
figure(5)
plot(xPDF, pdf100)
%%%%

pdf100 = myCurveSmoother6(pdf, xPDF, 20000, 250, 4);
figure(5)
plot(xPDF, pdf100)

pdf100 = myCurveSmoother6(pdf, xPDF, 10000, 250, 4);
figure(5)
plot(xPDF, pdf100)
%%%%

pdf100 = myCurveSmoother6(pdf, xPDF, 20000, 500, 4);
figure(5)
plot(xPDF, pdf100)

pdf100 = myCurveSmoother6(pdf, xPDF, 10000, 500, 4);
figure(5)
plot(xPDF, pdf100)
%%%%%%%

df100 = myCurveSmoother6(pdf, xPDF, 30000, 500, 4);
figure(5)
plot(xPDF, pdf100)

df100 = myCurveSmoother6(pdf, xPDF, 300000, 500, 4);
figure(5)
plot(xPDF, pdf100)

%%%%%%%%%%%%%%%%%%%%

pdf100 = myCurveSmoother6(pdf, xPDF, 4000, 250, 4);
figure(5)
plot(xPDF, pdf100)

pdf100 = myCurveSmoother6(pdf, xPDF, 8000, 250, 4);
figure(5)
plot(xPDF, pdf100)

pdf100 = myCurveSmoother6(pdf, xPDF, 300000, 250, 4);
figure(5)
plot(xPDF, pdf100)

%%%%%%%%%%%%%%%%%%%%%%%%%
pdf100 = myCurveSmoother6(pdf, xPDF, 300000, 250, 4);
figure(5)
plot(xPDF, pdf100)

df100 = myCurveSmoother6(pdf, xPDF, 30000, 250, 4);
figure(5)
plot(xPDF, pdf100)

pdf100 = myCurveSmoother6(pdf, xPDF, 8000, 250, 4);
figure(5)
plot(xPDF, pdf100)

pdf100 = myCurveSmoother6(pdf, xPDF, 4000, 250, 4);
figure(5)
plot(xPDF, pdf100)


%%%%%%%%%%%%

pdf100 = myCurveSmoother6(pdf, xPDF, 4000, 250, 4);
figure(5)
plot(xPDF, pdf100)

pdf100 = myCurveSmoother6(pdf, xPDF, 8000, 250, 4);
figure(5)
plot(xPDF, pdf100)
%%%%%%%%%%%%%%%%%
pdf100 = myCurveSmoother6(pdf, xPDF, 3000, 250, 4);
figure(5)
plot(xPDF, pdf100)

pdf100 = myCurveSmoother6(pdf100, xPDF, 9000, 250, 4);
figure(5)
plot(xPDF, pdf100)

pdf100 = myCurveSmoother6(pdf100, xPDF, 30000, 250, 4);
figure(5)
plot(xPDF, pdf100)

%%%%%%%%%%%%%%%%
pdf100 = myCurveSmoother6(pdf, xPDF, 30000, 1, 4);
figure(5)
plot(xPDF, pdf100)


pdf100 = myCurveSmoother6(pdf, xPDF, 200000, 1, 4);
figure(5)
plot(xPDF, pdf100)
%%%%%%%%%%%%%%%%%%%%%%%%%%%

pdf100 = myCurveSmoother6(pdf, xPDF, 10000, 1, 2);
figure(5)
plot(xPDF, pdf100)

pdf100 = myCurveSmoother6(pdf100, xPDF, 100000, 1, 2);
figure(5)
plot(xPDF, pdf100)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pdf100 = myCurveSmoother6(pdf, xPDF, 200, 1, 4);
figure(5)
plot(xPDF, pdf100)

pdf100 = myCurveSmoother6(pdf100, xPDF, 2000, 1, 4);
figure(5)
plot(xPDF, pdf100)

pdf100 = myCurveSmoother6(pdf100, xPDF, 20000, 1, 4);
figure(5)
plot(xPDF, pdf100)

pdf100 = myCurveSmoother6(pdf100, xPDF, 200000, 1, 4);
figure(5)
plot(xPDF, pdf100)







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Matlab's
[pdfSM_mat, window] = smoothdata(pdf,'gaussian');
%^not pretty, very taxing, took tooooo long
%^ window was 295294
figure(6)
plot(xPDF, pdfSM_mat)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 295294








%JUNK%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
pdf100 = myCurveSmoother4(pdf, xPDF, 500, 100, 4);
figure(20)
plot(xPDF, pdf100)







