%Driver Script for Laplacian half of Project
%starting with:
%   Variance = 1, then 0.1
%   mean = 5.5
%   Number of Samples/Bit = 1, then 100
%   Equal Probabilities first, then repeat process for Unequal
%   Probabilities
noiseType = 'Laplacian';
%Estimate the true mean of the noise:
[estimatedLMean, numberOfFigs] = noiseProcess_Characterization(noiseType, randLaplaceNoiseMean, noiseVariance, numberOfFigs);

%Begin Recieving the First Transmission
%First thing to do is choose the bit sample and then extend it:
bitStrSample = equalProbability;
[bSVoltage, bitStreamTransmitted, nBits] = concat_translate(bitStrSample);
%specify number of comparators to be used:
%(One comparator will take one sample per bit, the other takes 100)
nComps = length(numSamples);
%specify number of Variances for the noise processes:
nVars = length(noiseVariance);
%Specify the number of columns for the matrix to be generated
%nWays is the number of columns
nWays = nVars*nComps;

sampledVoltage = zeros(nBits, nWays); %preallocate the Recieved Voltage Matrix
%Receive The Transmitted Voltage:
k = 0;
for oC = 1:nVars
    for iC = 1:nComps
        k = k+1;
        sampledVoltage(:,k)= receiveSamp(randLaplaceNoiseMean, noiseVariance(oC), bSVoltage, numSamples(iC), estimatedLMean(oC), noiseType);
    end
end
[bitStreamRecieved, percentError] = toBits_analyze(sampledVoltage, bitStreamTransmitted);

laplacianReceivedVoltages_EP = sampledVoltage
laplacianBitStreamRecieved_EP = bitStreamRecieved
laplacianPercentError_EP = percentError
laplacianReceivedVoltage_EP_variance = var(laplacianReceivedVoltages_EP)

%------------------------------------------------------------------------------
%Display DataSet:
numberOfFigs = numberOfFigs + 1;
fig = figure(numberOfFigs);
clf('reset')
uitable('Parent', fig, 'Units', 'normalized', 'Position', [0 1/4 1/5 2.8/4], 'Data',...
    fullEqualProbBitStream, 'ColumnName', colNames2);
uitable('Parent', fig, 'Units', 'normalized', 'Position', [1/5 1/4 2/5 2.8/4], 'Data',...
    laplacianBitStreamRecieved_EP, 'ColumnName', colNames1);
uitable('Parent', fig, 'Units', 'normalized', 'Position', [3/5 1/4 2/5 2.8/4], 'Data',...
    laplacianReceivedVoltages_EP, 'ColumnName', colNames1);
uitable('Parent', fig, 'Units', 'normalized', 'Position', [1/5 .05 1.8/5 0.8/4], 'Data',...
    laplacianPercentError_EP, 'ColumnName', colNames1, 'RowName', rowNames2);
uitable('Parent', fig, 'Units', 'normalized', 'Position', [3/5 .05 1.8/5 0.8/4], 'Data',...
    laplacianReceivedVoltage_EP_variance, 'ColumnName', colNames1, 'RowName', rowNames3);
annotation('textbox', 'Units', 'normalized', 'Position', [0 .05 0.8/5 0.8/4], 'String',...
            {'Probability of error in Percent',...
            'and Variance of each voltage stream:', '    >>>>>'},...
            'FontSize', 10, 'FontWeight', 'bold', 'LineWidth', 1,...
            'BackgroundColor', 'w');
annotation('textbox', 'Units', 'normalized', 'Position', [1.5/5 3.82/4 2/5 0.15/4], 'String',...
            '                      Equal Probabilitity - Laplacian Results',...
            'FontSize', 10, 'FontWeight', 'bold', 'LineWidth', 1,...
            'BackgroundColor', 'w');

%------------------------------------------------------------------------------
%NOW, do the Unequal Probability Laplacian Case:
bitStrSample = unequalProbability;
[bSVoltage, bitStreamTransmitted, nBits] = concat_translate(bitStrSample);

sampledVoltage = zeros(nBits, nWays); %preallocate the Recieved Voltage Matrix
%Receive The Transmitted Voltage:
k = 0;
for oC = 1:nVars
    for iC = 1:nComps
        k = k+1;
        sampledVoltage(:,k)= receiveSamp(randLaplaceNoiseMean, noiseVariance(oC), bSVoltage, numSamples(iC), estimatedLMean(oC), noiseType);
    end
end
[bitStreamRecieved, percentError] = toBits_analyze(sampledVoltage, bitStreamTransmitted);

laplacianReceivedVoltages_UEP = sampledVoltage
laplacianBitStreamRecieved_UEP = bitStreamRecieved
laplacianPercentError_UEP = percentError
laplacianReceivedVoltage_UEP_variance = var(gaussianReceivedVoltages_UEP)

%------------------------------------------------------------------------------
%Display DataSet:
numberOfFigs = numberOfFigs + 1;
fig = figure(numberOfFigs);
clf('reset')
uitable('Parent', fig, 'Units', 'normalized', 'Position', [0 1/4 1/5 2.8/4], 'Data',...
    fullUnequalProbBitStream, 'ColumnName', colNames2);
uitable('Parent', fig, 'Units', 'normalized', 'Position', [1/5 1/4 2/5 2.8/4], 'Data',...
    laplacianBitStreamRecieved_UEP, 'ColumnName', colNames1);
uitable('Parent', fig, 'Units', 'normalized', 'Position', [3/5 1/4 2/5 2.8/4], 'Data',...
    laplacianReceivedVoltages_UEP, 'ColumnName', colNames1);
uitable('Parent', fig, 'Units', 'normalized', 'Position', [1/5 .05 1.8/5 0.8/4], 'Data',...
    laplacianPercentError_UEP, 'ColumnName', colNames1, 'RowName', rowNames2);
uitable('Parent', fig, 'Units', 'normalized', 'Position', [3/5 .05 1.8/5 0.8/4], 'Data',...
    laplacianReceivedVoltage_UEP_variance, 'ColumnName', colNames1, 'RowName', rowNames3);
annotation('textbox', 'Units', 'normalized', 'Position', [0 .05 0.8/5 0.8/4], 'String',...
            {'Probability of error in Percent',...
            'and Variance of each voltage stream:', '    >>>>>'},...
            'FontSize', 10, 'FontWeight', 'bold', 'LineWidth', 1,...
            'BackgroundColor', 'w');
annotation('textbox', 'Units', 'normalized', 'Position', [1.5/5 3.82/4 2/5 0.15/4], 'String',...
            '                    Unequal Probabilitity - Laplacian Results',...
            'FontSize', 10, 'FontWeight', 'bold', 'LineWidth', 1,...
            'BackgroundColor', 'w');
