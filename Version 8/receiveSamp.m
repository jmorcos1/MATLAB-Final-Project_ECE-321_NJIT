function y = receiveSamp(m,v, bSV, N, eM, nType)
%GAUSS_SAMP: Simulates the Detection of a Transmitted BitStream, which is
%additively contaminated by Noise.
%   The Input Voltage Signal being represented as a stream of rectangular pulses.
%       bSV parameter is a VECTOR containing the idealized sequence of voltages
%       corresponding to the High (1) and Low (0) bit Sequence being
%       transmitted.  High and Low voltage values can be decided by user.
%       (each element should be one of 2 possible values)
%   The Simulated Noise Process is characterized by a Gaussian Random
%   Variable or a Laplacian R.V. with given mean and variance.
%       N parameter is the number of samples to take for each bit
%       m parameter is the mean, v is the varience. (both SCALAR)
%       eM parameter is the estimated mean of the noise, to be subtracted
%       from each sample taken, in order to reduce the noise on average
%       bSV parameter is a vector containing the bit voltages to be sampled
%       nType parameter is a string that specifies the type of noise 
%   Output is a VECTOR Representing the Detected Bit Stream Recieved, Along
%       with the simulated noise from the transmission line.
%   N is the number of samples taken within the interval of one bit
%       The samples are averaged to obtain the detected value for each bit
if nargin ~= 6
    error('6 Input Arguments are Required');
else
    y = zeros(length(bSV),1);
    c = 0;
    for b = bSV'     %For each bit, we take N samples
        c = c+1;
        if strcmp(nType, 'Gaussian')
            x = b + gaussNoise(m,v,N) - eM; %Sample Signal Combined with Noise
        else
            x = b + laprnd(N, 1, m, sqrt(v)) - eM; %Sample Signal Combined with Noise
        end
        y(c,1) = mean(x); %Populate Output Vector
    end
end
end

