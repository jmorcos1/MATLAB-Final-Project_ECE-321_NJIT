function [recBS,percErr] = toBits_analyze(voltStreamIn, bitStr)
%TO_BITS_ANALYZE: translate the voltages recieved back into bits (1s and 0s)
%   Then, analyze the percent error
inMatDim = size(voltStreamIn);
nBits = inMatDim(1);
nCols = inMatDim(2);
recBitStr = zeros(nBits, nCols);
for oC = 1:nCols
    q = 0;
    for v = voltStreamIn(:,oC)'
        q = q+1;
        if v > 0
            recBitStr(q,oC) = 1;
        else
            recBitStr(q,oC) = 0;
        end
    end
end

numErrors = zeros(1,nCols);
for oK = 1:nCols
    for iK = 1:nBits
        if recBitStr(iK,oK) ~= bitStr(iK)
            numErrors(1,oK) = numErrors(1,oK) + 1;
        end
    end
end
percentError = (numErrors./nBits).*100;

recBS = recBitStr;
percErr = percentError;




end

