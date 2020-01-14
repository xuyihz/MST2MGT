%% Generate MGT file
% from MST log file
% NumStart & filename need to be checked
% Xu Yi, 2019
% Xu Yi, revised. 2020

%%
close all; clear; clc;
addpath(genpath('F:\MATLAB\MSTlog')) % 搜索路径中加入文件夹及其下所有文件夹

%% load the mgt & log file
% MGTfilename = 'C:\Users\Administrator\Desktop\乒乓球馆3.mgt';
% LOGfilename = 'C:\Users\Administrator\Desktop\乒乓球馆3.log';
% MGTstr = loadFile2Str(MGTfilename);
% LOGstr = loadFile2Str(LOGfilename);

%% get the BOX section start number from mgt file
NumStart = 39; % box Section Start Number <<====
% MGTfilename = 'C:\Users\Administrator\Desktop\乒乓球馆3.mgt';
% NumStart = getSecNumStart(MGTfilename); % box Section Start Number <<====

%% get the BOX section data from log file
LOGfilename = 'C:\Users\Administrator\Desktop\乒乓球馆3.log';
[NumMatrix, SecMatrix] = importMSTlogSec(LOGfilename);
NumMatrix = NumMatrix + NumStart - 1;

%% check the format of the selfweight lines
% *SELFWEIGHT, 0, 0, -1.1,

%% write the BOX section data into a new mgt file
fileID = fopen('MST.mgt','w'); % Open or create new file for writing. Discard existing contents, if any.
for i = 1:length(NumMatrix)
    SecName = sprintf('B %dx%dx%dx%d',SecMatrix(i,1),SecMatrix(i,2),SecMatrix(i,3),SecMatrix(i,4));
    fprintf(fileID,'   %d,DBUSER,%s,CC,0,0,0,0,0,0,YES,NO,B,2,%f,%f,%f,%f,0,0,0,0,0,0\n',...
    NumMatrix(i),...
    SecName,...
    SecMatrix(i,2),SecMatrix(i,1),SecMatrix(i,4),SecMatrix(i,3));
end

%%
fclose('all');
