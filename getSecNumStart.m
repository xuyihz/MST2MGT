%% function
% 
% to get the start BOX section number
% Xu Yi, 2020

%%
function NumStart = getSecNumStart(filename)
fileID = fopen(filename);

% to get the '*SECTION    ; Section' part
stringTemp = fscanf(fileID,'%s',1); % temp = fscanf(fid,'%s',1);
while ~strcmp( stringTemp, '*SECTION' ) % Compare strings
    fgetl(fileID); % ¶Áµô¸ÃÐÐ
    stringTemp = fscanf(fileID,'%s',1); % A = fscanf(fileID,formatSpec,sizeA)
end

% *ELEMENT    ; Elements





end