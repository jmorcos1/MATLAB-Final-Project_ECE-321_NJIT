function [bSV, bS, numBits] = concat_translate(bitSamp)
%CONCAT_TRANSLATE: Take a sample of bits, extend it, translate to voltage
%   repeatedly concatinate it.  then translate each 0 to -1 and each 1 to
%   +1 volt
nSampleBits = length(bitSamp); %number of bits in the given sample
nBits = 500;  %Desired total numer of bits to be transmitted
%^can be decided by user
nBits = nBits - (mod(nBits,nSampleBits));
%^But... it mst be a multiple of the number of bits in the sample...
f = nBits/nSampleBits;
%Concatinate!!:
bitStr = zeros(1,nBits);    %Preallocate memory for the bit stream
c = 0;
for k = 1:f
    for p = 1:nSampleBits
        c = c+1;
        bitStr(c) = bitSamp(p);
    end
end
%Translate to desired voltage for high and low:
bitStr = bitStr';
bSVoltage = zeros(nBits, 1);  %Prealloacate a column vector for voltage
k = 0;
for b = bitStr'
    k = k+1;
    switch b
        case 0
            bSVoltage(k) = -1;
        case 1
            bSVoltage(k) = 1;
    end
end

%Output the Column Vector of Voltages
bSV = bSVoltage;
bS = bitStr;
numBits = nBits;
end

