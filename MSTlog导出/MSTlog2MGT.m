%% Generate MGT file
% from MST log file
% NumStart & filename need to be checked
% Xu Yi, 2019
% Xu Yi, revised. 2020

%%
close all; clear; clc;
addpath(genpath('F:\MATLAB\MST2MGT')) % ����·���м����ļ��м����������ļ���

%% load the mgt & log file
MGTfilename = 'C:\Users\Administrator\Desktop\ƹ�����3.mgt';
LOGfilename = 'C:\Users\Administrator\Desktop\ƹ�����3.log';
MGTstr = loadFile2Str(MGTfilename); MGTstrOriginal = MGTstr;
LOGstr = loadFile2Str(LOGfilename);

%% check the format of the selfweight lines
MGTstr = checkSelfweight(MGTstr);

%% get the BOX section start number from mgt file
% NumStart: box Section Start Number
% SecLine_end: Section part end line
[NumStart, SecLine_end] = getSecNumStart(MGTstr);

%% get the BOX section data from log file
[NumMatrix, SecMatrix] = getSecMSTlog(LOGstr, NumStart);

%% write the BOX section data into MGTstr
MGTstr = writeSecData(MGTstr, SecLine_end, NumMatrix, SecMatrix);

%% write MGTstr into a new mgt file
prefix = ''; % prefix of the new mgt file
suffix = 'x'; % suffix of the new mgt file
writeMGT(MGTstr, MGTfilename, prefix, suffix);
