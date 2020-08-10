%Calculate the total Probability of error for Gaussian Equal Probability
gaussianPercentError_EP_Theoretical = zeros(1,4);

%First, we look at our GaussNoise with Variance 1
%Taking one sample per bit
%This is the probability of a 1 mistaken for a 0:
pError1 = normcdf((estimatedGMean(1) - 1),randGaussNoiseMean,1);
%This is the probability of a 0 mistaken for a 1:
pError0 = 1 - normcdf((estimatedGMean(1) + 1),randGaussNoiseMean,1);
%So using Formula (1.4-10), The total Probability of error
%For the case#1 is:
percentError = pError1*0.5 + pError0*0.5;
gaussianPercentError_EP_Theoretical(1) = percentError;
%--------------------------------------------------------------------

%Next, we look at our GaussNoise with Variance 1
%Taking 100 sample per bit
%For this, The central Limit theorem is used.
standardErrorOfMean = 1/10;

%This is the probability of a 1 mistaken for a 0:
pError1 = normcdf((estimatedGMean(1) - 1),randGaussNoiseMean, standardErrorOfMean);
%This is the probability of a 0 mistaken for a 1:
pError0 = 1 - normcdf((estimatedGMean(1) + 1),randGaussNoiseMean, standardErrorOfMean);
%So using Formula (1.4-10), The total Probability of error
%For the case#2 is:
percentError = pError1*0.5 + pError0*0.5;
gaussianPercentError_EP_Theoretical(2) = percentError;
%--------------------------------------------------------------------
%After That, we look at our GaussNoise with Variance 0.1
%Taking one sample per bit
%This is the probability of a 1 mistaken for a 0:
pError1 = normcdf((estimatedGMean(2) - 1),randGaussNoiseMean,sqrt(0.1));
%This is the probability of a 0 mistaken for a 1:
pError0 = 1 - normcdf((estimatedGMean(2) + 1),randGaussNoiseMean,sqrt(0.1));
%So using Formula (1.4-10), The total Probability of error
%For the case#3 is:
percentError = pError1*0.5 + pError0*0.5;
gaussianPercentError_EP_Theoretical(3) = percentError;
%--------------------------------------------------------------------
%Next, we look at our GaussNoise with Variance 0.1
%Taking 100 sample per bit
%For this, The central Limit theorem is used.
standardErrorOfMean = sqrt(0.1)/10;

%This is the probability of a 1 mistaken for a 0:
pError1 = normcdf((estimatedGMean(2) - 1),randGaussNoiseMean, standardErrorOfMean);
%This is the probability of a 0 mistaken for a 1:
pError0 = 1 - normcdf((estimatedGMean(2) + 1),randGaussNoiseMean,standardErrorOfMean);
%So using Formula (1.4-10), The total Probability of error
%For the case#4 is:
percentError = pError1*0.5 + pError0*0.5;
gaussianPercentError_EP_Theoretical(4) = percentError;
%--------------------------------------------------------------------
gaussianPercentError_EP_Theoretical = gaussianPercentError_EP_Theoretical.*100
%--------------------------------------------------------------------


%Calculate the total Probability of error for Gaussian Unequal Probability
gaussianPercentError_UEP_Theoretical = zeros(1,4);

%First, we look at our GaussNoise with Variance 1
%Taking one sample per bit
%This is the probability of a 1 mistaken for a 0:
pError1 = normcdf((estimatedGMean(1) - 1),randGaussNoiseMean,1);
%This is the probability of a 0 mistaken for a 1:
pError0 = 1 - normcdf((estimatedGMean(1) + 1),randGaussNoiseMean,1);
%So using Formula (1.4-10), The total Probability of error
%For the case#5 is:
percentError = pError1*0.3 + pError0*0.7;
gaussianPercentError_UEP_Theoretical(1) = percentError;
%--------------------------------------------------------------------

%Next, we look at our GaussNoise with Variance 1
%Taking 100 sample per bit
%For this, The central Limit theorem is used.
standardErrorOfMean = 1/10;

%This is the probability of a 1 mistaken for a 0:
pError1 = normcdf((estimatedGMean(1) - 1),randGaussNoiseMean, standardErrorOfMean);
%This is the probability of a 0 mistaken for a 1:
pError0 = 1 - normcdf((estimatedGMean(1) + 1),randGaussNoiseMean,standardErrorOfMean);
%So using Formula (1.4-10), The total Probability of error
%For the case#6 is:
percentError = pError1*0.3 + pError0*0.7;
gaussianPercentError_UEP_Theoretical(2) = percentError;
%--------------------------------------------------------------------
%After That, we look at our GaussNoise with Variance 0.1
%Taking one sample per bit
%This is the probability of a 1 mistaken for a 0:
pError1 = normcdf((estimatedGMean(2) - 1),randGaussNoiseMean,sqrt(0.1));
%This is the probability of a 0 mistaken for a 1:
pError0 = 1 - normcdf((estimatedGMean(2) + 1),randGaussNoiseMean,sqrt(0.1));
%So using Formula (1.4-10), The total Probability of error
%For the case#7 is:
percentError = pError1*0.3 + pError0*0.7;
gaussianPercentError_UEP_Theoretical(3) = percentError;
%--------------------------------------------------------------------
%Next, we look at our GaussNoise with Variance 0.1
%Taking 100 sample per bit
%For this, The central Limit theorem is used.
standardErrorOfMean = sqrt(0.1)/10;

%This is the probability of a 1 mistaken for a 0:
pError1 = normcdf((estimatedGMean(2) - 1),randGaussNoiseMean, standardErrorOfMean);
%This is the probability of a 0 mistaken for a 1:
pError0 = 1 - normcdf((estimatedGMean(2) + 1),randGaussNoiseMean,standardErrorOfMean);
%So using Formula (1.4-10), The total Probability of error
%For the case#8 is:
percentError = pError1*0.3 + pError0*0.7;
gaussianPercentError_UEP_Theoretical(4) = percentError;
%--------------------------------------------------------------------
gaussianPercentError_UEP_Theoretical = gaussianPercentError_UEP_Theoretical.*100 
%--------------------------------------------------------------------
%--------------------------------------------------------------------
%--------------------------------------------------------------------
%--------------------------------------------------------------------
%--------------------------------------------------------------------



%Calculate the total Probability of error for Laplace Equal Probability
laplacianPercentError_EP_Theoretical = zeros(1,4);

%First, we look at our LaplaceNoise with Variance 1
%Taking one sample per bit
%This is the probability of a 1 mistaken for a 0:
pError1 = CDFlaplace(randLaplaceNoiseMean, 1, (estimatedLMean(1) - 1));
%This is the probability of a 0 mistaken for a 1:
pError0 = 1 - CDFlaplace(randLaplaceNoiseMean, 1, (estimatedLMean(1) + 1));
%So using Formula (1.4-10), The total Probability of error
%For the case#9 is:
percentError = pError1*0.5 + pError0*0.5;
laplacianPercentError_EP_Theoretical(1) = percentError;
%--------------------------------------------------------------------

%Next, we look at our LaplaceNoise with Variance 1
%Taking 100 sample per bit
%For this, The central Limit theorem is used.
standardErrorOfMean = 1/10;

%This is the probability of a 1 mistaken for a 0:
pError1 = normcdf((estimatedLMean(1) - 1),randLaplaceNoiseMean, standardErrorOfMean);
%This is the probability of a 0 mistaken for a 1:
pError0 = 1 - normcdf((estimatedLMean(1) + 1),randLaplaceNoiseMean,standardErrorOfMean);
%So using Formula (1.4-10), The total Probability of error
%For the case#10 is:
percentError = pError1*0.5 + pError0*0.5;
laplacianPercentError_EP_Theoretical(2) = percentError;
%--------------------------------------------------------------------
%After That, we look at our LaplaceNoise with Variance 0.1
%Taking one sample per bit
%This is the probability of a 1 mistaken for a 0:
pError1 = CDFlaplace(randLaplaceNoiseMean, 0.1, (estimatedLMean(2) - 1));
%This is the probability of a 0 mistaken for a 1:
pError0 = 1 - CDFlaplace(randLaplaceNoiseMean, 0.1, (estimatedLMean(2) + 1));
%So using Formula (1.4-10), The total Probability of error
%For the case#11 is:
percentError = pError1*0.5 + pError0*0.5;
laplacianPercentError_EP_Theoretical(3) = percentError;
%--------------------------------------------------------------------
%Next, we look at our LaplaceNoise with Variance 0.1
%Taking 100 sample per bit
%For this, The central Limit theorem is used.
standardErrorOfMean = sqrt(0.1)/10;

%This is the probability of a 1 mistaken for a 0:
pError1 = normcdf((estimatedLMean(2) - 1),randLaplaceNoiseMean, standardErrorOfMean);
%This is the probability of a 0 mistaken for a 1:
pError0 = 1 - normcdf((estimatedLMean(2) + 1),randLaplaceNoiseMean,standardErrorOfMean);
%So using Formula (1.4-10), The total Probability of error
%For the case#12 is:
percentError = pError1*0.5 + pError0*0.5;
laplacianPercentError_EP_Theoretical(4) = percentError;
%--------------------------------------------------------------------
laplacianPercentError_EP_Theoretical = laplacianPercentError_EP_Theoretical.*100 
%--------------------------------------------------------------------


%Calculate the total Probability of error for Laplacian Unequal Probability
laplacianPercentError_UEP_Theoretical = zeros(1,4);

%First, we look at our LaplaceNoise with Variance 1
%Taking one sample per bit
%This is the probability of a 1 mistaken for a 0:
pError1 = CDFlaplace(randLaplaceNoiseMean, 1, (estimatedLMean(1) - 1));
%This is the probability of a 0 mistaken for a 1:
pError0 = 1 - CDFlaplace(randLaplaceNoiseMean, 1, (estimatedLMean(1) + 1));
%So using Formula (1.4-10), The total Probability of error
%For the case#13 is:
percentError = pError1*0.3 + pError0*0.7;
laplacianPercentError_UEP_Theoretical(1) = percentError;
%--------------------------------------------------------------------

%Next, we look at our LaplaceNoise with Variance 1
%Taking 100 sample per bit
%For this, The central Limit theorem is used.
standardErrorOfMean = 1/10;

%This is the probability of a 1 mistaken for a 0:
pError1 = normcdf((estimatedLMean(1) - 1),randLaplaceNoiseMean, standardErrorOfMean);
%This is the probability of a 0 mistaken for a 1:
pError0 = 1 - normcdf((estimatedLMean(1) + 1),randLaplaceNoiseMean,standardErrorOfMean);
%So using Formula (1.4-10), The total Probability of error
%For the case#14 is:
percentError = pError1*0.3 + pError0*0.7;
laplacianPercentError_UEP_Theoretical(2) = percentError;
%--------------------------------------------------------------------
%After That, we look at our LaplaceNoise with Variance 0.1
%Taking one sample per bit
%This is the probability of a 1 mistaken for a 0:
pError1 = CDFlaplace(randLaplaceNoiseMean, 0.1, (estimatedLMean(2) - 1));
%This is the probability of a 0 mistaken for a 1:
pError0 = 1 - CDFlaplace(randLaplaceNoiseMean, 0.1, (estimatedLMean(2) + 1));
%So using Formula (1.4-10), The total Probability of error
%For the case#15 is:
percentError = pError1*0.3 + pError0*0.7;
laplacianPercentError_UEP_Theoretical(3) = percentError;
%--------------------------------------------------------------------
%Next, we look at our LaplaceNoise with Variance 0.1
%Taking 100 sample per bit
%For this, The central Limit theorem is used.
standardErrorOfMean = sqrt(0.1)/10;

%This is the probability of a 1 mistaken for a 0:
pError1 = normcdf((estimatedLMean(2) - 1),randLaplaceNoiseMean, standardErrorOfMean);
%This is the probability of a 0 mistaken for a 1:
pError0 = 1 - normcdf((estimatedLMean(2) + 1),randLaplaceNoiseMean,standardErrorOfMean);
%So using Formula (1.4-10), The total Probability of error
%For the case#16 is:
percentError = pError1*0.3 + pError0*0.7;
laplacianPercentError_UEP_Theoretical(4) = percentError;
%--------------------------------------------------------------------
laplacianPercentError_UEP_Theoretical = laplacianPercentError_UEP_Theoretical.*100 
%--------------------------------------------------------------------


%------------------------------------------------------------------------------
%Display DataSet:
myData = [gaussianPercentError_EP_Theoretical;gaussianPercentError_UEP_Theoretical;...
    laplacianPercentError_EP_Theoretical; laplacianPercentError_UEP_Theoretical];
numberOfFigs = numberOfFigs + 1;
fig = figure(numberOfFigs);
clf('reset')
t = uitable('Parent', fig, 'Units', 'normalized', 'Position', [0.3/5 1.1/5 4.4/5 3/5], 'Data',...
    myData, 'ColumnName', colNames1, 'RowName', rowNames1,...
    'FontSize', 16);
t.ColumnWidth = {140,140,140,140};
annotation('textbox', 'Units', 'normalized', 'Position', [1.5/5 3.82/4 2/5 0.15/4], 'String',...
            '    Theoretically Calculated Probability of Error (in percent)',...
            'FontSize', 10, 'FontWeight', 'bold', 'LineWidth', 1,...
            'BackgroundColor', 'w');

%-------------------------------------------------------------------------------
%This function was built using the definitions of Laplace CDF found in
%research
function FxL = CDFlaplace(mean, variance, x)
b = sqrt(variance)/sqrt(2);
FxL = 0.5*(1 + sign(x-mean)*(1 - exp(-1*abs(x-mean)/b)));
end












