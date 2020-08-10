%{
    This is the Main Script for the MATLAB Project
%-------------------------------------------------------------------
TO THE USER:
    1.) Please Run this script, and allow it to complete
        1.a) If an error, occurs, just ignore it and press run again 
                (this is rare)
    2.) Examine the output in the figure window
        2.a) The figure window will be docked
        2.b) All relevant output is layed out in the figures
                From Left to Right.  Start with Figure 1.
        2.c) Aside from the figure windows, you can view the variables and
                see thier contents by double-clicking them in the workspace
    3.) This script calls one or more other scripts
        3.a) To follow along, open any other script being called by this 1
        3.b) There are also several functions that are called within the
        scripts.  Some functions also call other functions.
        3.c) Some functions are very essential, while others just do some
        busy work such as formatting.
        3.d) If the user cares to examine them, each contains a description

Eplaination of the Project and Program:
%-------------------------------------------------------------------
THE PURPOSE:
    To simulate several different scenerios involving a
telecomunication or control system in which data is
being transmitted and recieved in the form of a binary
sequence, or a bit stream.
    The transmitted voltage signal is represented by a 
series of rectangular pulses of height +/- 1 V.  This
digital system uses positive one volt as the "high" voltage
representing binary 1, and uses negative one volt as "low",
representing binary 0.
    In the following simulation, it is being assumed that
some kind of random noise process within the transmission line
is additively interfering with the recieved signals.  The purpose
of the project is examine how 2 different types of random processes
will effect the probability of error in the recieved signal compared
to the trasnmitted signal.

HOW IT WORKS:
    In this MATLAB program, the noise itself is being simulated.
However, this program also simulates the work done by the engineers
who have to deal with understanding the characteristics of the noise,
as well as deal with the effects it has on the communication protocol.
    To that end, there are two functions deticated to producing the noise.
One noise type has a Gaussian probability distribution, while the other is
Laplacian.  For each noise type, an arbitrary value of the mean is chosen.
This value is assumed to be unknown to the engineers.
    For each noise type, several cases are examined.  In the first case,
the transmitted signal is composed of an equal number of 1s and 0s
(equal probability).  In the second case, there are more 0s than 1s
(unequal probability).
    For the bit-detection scheme, the threshold is set to 0, so that a
recieved voltage higher greater than 0 will be interpreted as binary 1 and
otherwise, it will be considered a binary 0.
    Aside from having 2 noise types, there will also be 2 versions of noise
for each type.  The difference being that the noise variance will be either
0.1 or 1.
    Last but not least, there will be two different methods of sampling
used to aquire the recieved voltage values.  One method is to take one one
sample of the reciever for every bit being recieved.  The socond method is
to take 100 samples for each bit, and average them together to determine
the voltage value of the bit recieved.
    Given all of the information above, this leads to a total of 16 sets of
results to be analyzed.

THE PROCEDURE:
    The first task was to learn how to generate each type of noise with the
the ability of choosing a desired mean and variance for each noise type.
Once that was accomplished, the first task of the engineers is to
characterize the noise they are dealing with.  The program will generate
each noise type with an arbitrarily chosen mean.  This mean will not
change, it is to be decided by "the universe".  That being said, it is the
job of the engineer to characterize the noise by taking a large number of
samples, producing a histogram, and estimating the mean value of the noise.
    Once that has been accomplished, the engineer can then counteract the
noise, on average, by bringing the mean to 0.  This is done by
incorporating a DC voltage offset equal to the negative of the estimated
mean.  In other words, each time a sample of a bit is taken, the estimated
noise mean is subtracted from the measured signal.  This way, the noise
will now have an average very close to zero, which is the value used as the
threshold for decoding the signal.
    Next, the transmition and detection scheme is established.  For this, a
sample sequence of 1s and 0s must be repeated a large number of times to
produce a longer sequence of bits.  After that, the binary stream is then
converted to a chain of corresponding voltages of -1 and 1 V, according to
the information laid out previously.
    Now that the voltage values being transmitted have been generated, the
reciever is simulated to detect the incoming voltage which is contaminated
by the noise.  To do this, there are two cases.  First, one sample of the
transmission line is taken for every bit voltage being sent.  To achive
this, the voltage value of each bit is added to by a random voltage
produced by the noise.  Simultaniousely, the estimated mean of the noise is
subtracted from the total measured voltage, producing the voltage of the
recieved bit.  The other case works the same way, except now 100 samples of
the measured voltage are taken and then averaged to produce the final
voltage reading for each bit.
    Finaly, for each of the 16 total cases, the stream of recieved voltage
values are converted back to binary numbers and then compared with the
original sequence of bits.  At this point, the probability of error is
found.
%}
%-----------------------------------------------------------------------
%THE CODE:
%Set Up the Environment (UI):
%-----------------------------------------------------------------------
warning('off','Arrow3:WarpToFill')  %Eliminate a warning from being shown (caused by use of Arrow3)
figWinStyle = get(0,'DefaultFigureWindowStyle');
if ~strcmp(figWinStyle,'docked')    %Set figure window style to: "docked
    clear %clear the workspace to start Fresh
    clc
    close all
    set(0,'DefaultFigureWindowStyle','docked')  %To make this permanent, place this line into startup.m file
end
numberOfFigs = 0;   %to keep track of Current number of Figures generated

%Declare Major Variables of the project:
%(Noise process parameters, trasmission, and sampling processes)
%-----------------------------------------------------------------------
randGaussNoiseMean = 4.65;  %Arbitrary (theoretical) Mean of the simulated noise
randLaplaceNoiseMean = 5.5;  %Arbitrary (theoretical) Mean of the simulated noise
noiseVariance = [1 0.1];    %GIVEN Variances for the noise
numSamples = [1 100];       %Given number of samples to take for each bit
colNames1 = {' V=1 , N=1 ', ' V=1 , N=100 ', ' V=0.1 , N=1 ', ' V=0.1 , N=100 '};
colNames2 = {'Transmitted Bit Stream'};
rowNames1 = {'Gaussian - Equal Probability', 'Gaussian - Unequal Probability',...
    'Laplacian - Equal Probability', 'Laplacian - Unequal Probability'};
rowNames2 = {'Err'};
rowNames3 = {'Var'};
%Define the Two Sample Bit Sequences:
equalProbability = [1 0 0 0 1 1 0 0 0 1 0 1 1 1 1 0 1 0 0 1];
unequalProbability = [1 0 0 0 1 0 0 0 0 1 1 0 0 0 0 0 1 0 0 1];

%Run the Gaussian Half of the Project:
gaussDriver;

%Run the Laplacian Half of the Project:
laplaceDriver;

%Calculate The Theoretical Probability of Error for all 16 cases:
calculateTheoreticalProbError;



figure(1)



