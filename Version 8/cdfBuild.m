function [cdf, x] = cdfBuild(X)
%CDF_BUILD: creates a cumulitive distribution function of a ranndom
%variable using the actual sampled data set provided
%   Input parameter is a vector containing the sampled RV dataset
%   Output arg1 is a vector that can be plotted to produce CDF graph
%   The secound output arg is the independant variavle for the graph
%   Note that the input argument expected is a 1-D vector
len_x = 100000;
x = linspace(min(X),max(X),len_x);
N = length(X);
F_X = zeros(1, len_x);
c = 1;
for u = x                   %Numerical method treats RV data set as if it is a discrete RV
elX_LToETu = X <= u;        %logic array: each 1 corresponds to each elementary event, {X<=x}
F_X(c) = sum(elX_LToETu)/N; %F_X(x): sum of the probabilities of each elementary event
c = c + 1;                  %increment index, c
end                         %Works by counting all points that are less than small x, and dividing by N 
%now we interpolate the cdf to smoothen the "stair-case" slightly
len_xq = len_x*10;
xq = linspace(min(X),max(X),len_xq);
F_X = interp1(x, F_X, xq);
%return the result
cdf = F_X;
x = xq;
%Note that more smoothening is required, in order to take a derivative to
%produce pdf
end

