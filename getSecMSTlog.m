%% function
% import MST log file
% to get the Beam section
% Xu Yi, 2020

%%
function [NumMatrix, SecMatrix] = getSecMSTlog(LOGstr, NumStart)
% to get the '/SECTION PROPERTIES/' part
i = 1;
% sscanf Read string or character vector as formatted data
while ~strcmp( str1Temp(i, LOGstr), '/SECTION' ) % Compare strings
    i = i+1;
end
secLineStart = i;

% to get the '5' line / that is the beam section
i = secLineStart;
j = 1;
NumIndex = 3; % section index in the line.
while~strcmp( str1Temp(i, LOGstr), '##' ) % the end of section part
    while ~strcmp( str1Temp(i, LOGstr), '5' ) % Compare strings / 5 is Box sec identity
        i = i+1;
    end
    stringSplit = split( LOGstr(i) ); % split discards the space characters and returns the result as a string array.
    NumMatrix(j) = str2double(stringSplit(NumIndex));
    for k = 1:4
        SecMatrix(j,k) = str2double(stringSplit(NumIndex+k));
    end
    i = i+1;
    j = j+1;
end
NumMatrix = NumMatrix + NumStart - 1;
end