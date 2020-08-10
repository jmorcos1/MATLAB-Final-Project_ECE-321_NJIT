function [tcksOut,minTcksOut] = tickDoubler2(tcksIn,minorTcksIn)
%TICK_DOUBLER: Adds a tick mark in between every two current ticks on any axis
%   Input parameter is a vector containing the position (values) of an
%   axis ticks.  Output is a new vector with 2n - 1 ticks, cutting the
%   distance between each labeled tick in half.

if nargin ~= 2
    error('2 Input Arguments is Reqired');
else
    ticks = tcksIn;
    nTicks = length(ticks);
    newNTicks = 2*nTicks - 1;
    minTick = min(ticks);
    maxTick = max(ticks);
    newTicks = linspace(minTick, maxTick, newNTicks);
    
    newNMinorTcks = newNTicks + 4*(newNTicks-1);
    newMTicks = linspace(minTick, maxTick, newNMinorTcks);
    
    tcksOut = newTicks;
    minTcksOut = newMTicks;
end
end

