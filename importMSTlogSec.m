%% function
% import MST log file
% to get the Beam section
% Xu Yi, 2019

%%
function [NumMatrix, SecMatrix] = importMSTlogSec(filename)
fileID = fopen(filename);

% to get the '/SECTION PROPERTIES/' part
stringTemp = fscanf(fileID,'%s',1); % temp = fscanf(fid,'%s',1);
while ~strcmp( stringTemp, '/SECTION' ) % Compare strings
    fgetl(fileID); % 读掉该行
    stringTemp = fscanf(fileID,'%s',1); % A = fscanf(fileID,formatSpec,sizeA)
end

% to get the '5' line / that is the beam section
i = 0;
while~strcmp( stringTemp, '##' ) % the end of section part
    while ~strcmp( stringTemp, '5' ) % Compare strings
        fgetl(fileID); % 读掉该行
        stringTemp = fscanf(fileID,'%s',1); % A = fscanf(fileID,formatSpec,sizeA)
    end
    i = i+1;
    NumMatrix(i) = fscanf(fileID,'%d',1);
    for j = 1:4
        SecMatrix(i,j) = fscanf(fileID,'%f',1);
    end
    fgetl(fileID); % 读掉该行
    stringTemp = fscanf(fileID,'%s',1);
end

% close file
fclose(fileID);
end
