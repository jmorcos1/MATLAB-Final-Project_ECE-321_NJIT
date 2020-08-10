function y = gaussNoise(m,v,N)
%GAUSS_NOISE: Produces N samples of a Gaussian Random Variable,
%with a given (inputs) mean and varience
%   Input parameters: m = desired mean, v = desired varience, N = number of samples 
%   Output is a Vector of sample values
%{
    This Function is built around the MATLAB function, randn()
The general theory of random variables states that if x is a random variable
whose mean is μ_x and variance is (σ_x)^2, 
then the random variable, y, defined by y=ax+b,where a and b are constants,
has mean μ_y = a*μ_x +b and variance (σ_y)^2 = (a^2)*(σ_x)^2
    The randn function produces a random random number taken from a gaussian
distribution with a mean of 0 and a varience of 1 (the standard normal
distribution)
    Therefore, we can solve the above equation to generate another random
variable with any given mean and varience.  That is what this function
does.
%}
if nargin ~= 3
    error('3 Input Arguments are Required');
else
    a = sqrt(v);
    y = a.*randn(N,1) + m;
end
end

