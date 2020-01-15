%% function
%
% write MGTstr into a new mgt file
% Xu Yi, 2020

%%
function writeMGT(MGTstr, MGTfilename, prefix, suffix)
for i = 1:length(MGTfilename)
    if strcmp(MGTfilename(end+1-i), '\' )
        prefixStart = length(MGTfilename)+1-i;
        break
    end
end
newMGTfilename = [ MGTfilename(1:prefixStart), prefix,...
    MGTfilename(prefixStart+1:end-4), suffix, '.mgt' ];
fileID = fopen(newMGTfilename,'w'); % Open or create new file for writing. Discard existing contents, if any.
for i = 1:length(MGTstr)
    fprintf(fileID, '%s\n', MGTstr(i));
end
fclose('all');
end