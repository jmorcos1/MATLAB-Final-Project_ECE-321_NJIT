noise = gaussNoise(4.65, 1, 10000);
[cdf, x] = cdfBuild(noise);
set(0,'DefaultFigureWindowStyle','docked')
figure(1)
plot(x,cdf)

cdf_sm_me = myCurveSmoother8(cdf, x, 25, 3);
figure(2)
plot(x, cdf_sm_me)

pdf = myDeriv(x, cdf_sm_me);
figure(3)
plot(x, pdf)

pdf100 = myCurveSmoother8(pdf, x, 10, 4);
figure(4)
plot(x, pdf100)

[ball, ballX] = cdfBuildQ(4.65,1, noise);
figure(5)
plot(ballX, ball)

pdfBall = myDeriv(ballX, ball);
figure(6)
plot(ballX, pdfBall)

[cdfG, pdfG, xG] = cdfBuildG(4.65,1, noise);
figure(7)
plot(xG, cdfG)
figure(8)
plot(xG, pdfG)

figure(9)
plot(1:10);
ax = gca;
properties(ax)
for k = .01 : 0.01 : .15
  ax.TickLength = [k, k]; % Make tick marks longer.
  ax.LineWidth = 100*k; % Make tick marks thicker.
  message = sprintf('This tick length = %.2f', k);
  uiwait(helpdlg(message));
end

figure(4)