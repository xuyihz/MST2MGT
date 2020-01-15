%% function
%
% write the BOX section data into MGTstr
% Xu Yi, 2020

%%
function newMGTstr = writeSecData(MGTstr, SecLine_end, NumMatrix, SecMatrix)
for i = 1:length(NumMatrix)
    SecName = sprintf('B %dx%dx%dx%d',SecMatrix(i,1),SecMatrix(i,2),SecMatrix(i,3),SecMatrix(i,4));
    secLOGstr(i,1) = sprintf("   %d,DBUSER,%s,CC,0,0,0,0,0,0,YES,NO,B,2,%f,%f,%f,%f,0,0,0,0,0,0",...
        NumMatrix(i),...
        SecName,...
        SecMatrix(i,2),SecMatrix(i,1),SecMatrix(i,4),SecMatrix(i,3));
end
newMGTstr = [ MGTstr(1:SecLine_end); secLOGstr; ""; MGTstr(SecLine_end+1:end) ];
end