function myHist3(data, axisIn, varName, titleN)
%MY_HIST_2:  Plots a histogram of data with custom chart properties
%   data Input argument is a single row or single column vector
%   Create a figure as the output, so there is no output variable
%   fig and axis Input arguments are to specify which figure and 
%   axis the histogram should be plotted on.
if nargin ~= 4
    error('4 Input Arguments are Required');
else
    if strcmp(varName, 'Gaussian')
        binMeth = 'scott';
    else
        binMeth = 'auto';
    end   
    %fig = figure(figN);
    %clf('reset')
    myTitle = varName;
    switch titleN
        case 1
            myTitle = strcat(myTitle, ' Noise Characterization 1 (Noise Variance = 1)');
        case 2
            myTitle = strcat(myTitle, ' Noise Characterization 2 (Noise Variance = 0.1)');
    end
    ax = axisIn;
    hh = histogram(ax, data, 'BinMethod', binMeth);
    hh.LineWidth = 0.8;
    hh.DisplayName = 'Histogram';
    
    [cdf, x] = cdfBuild(data);
    cdf = myCurveSmoother8(cdf, x, 25, 3);
    pdf = myDeriv(x, cdf);
    if strcmp(varName, 'Gaussian')
        pdf = myCurveSmoother8(pdf, x, 10, 4);
    else
        pdf = myCurveSmoother8(pdf, x, 20, 2);
    end
        
        
    height = max(hh.Values);
    scaleFcdf = height/max(cdf);
    scaleFpdf = height/max(pdf);
    cdf = cdf.*scaleFcdf;
    pdf = pdf.*scaleFpdf;
    
    [ax, labPositions] = formatAxis(ax, x, cdf, 0.2, 0, 0.1, 0.1, 0.09, 0.06, 0.16, 0.21);
    
    %if strcmp(varName, 'Gaussian')
    %    [ax, labPositions] = formatAxis(ax, x, cdf, 0.2, 0, 0.1, 0.1, 0.09, 0.06, 0.16, 0.21);
    %end
    
    
    ax = titleAndLabel(ax, myTitle, 'X', 'Bin Counts', labPositions);
        
    hold on
    ch = plot(ax, x, cdf, '--g','DisplayName', 'cdf');
    ch.LineWidth = 2;
    ph = plot(ax, x, pdf, '--r','DisplayName', 'pdf');
    ph.LineWidth = 2;
    legend(ax, [hh, ch,ph])
    hold off
end
end


