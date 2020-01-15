%% function
%
% to get the start BOX section number
% Xu Yi, 2020

%%
function [NumStart, SecLine_end] = getSecNumStart(MGTstr)
i = 1;
while~strcmp( str1Temp(i, MGTstr), '*ELEMENT' )
    if i == length(MGTstr) % no '*ELEMENT' in MGTstr
        break
    end
    i = i+1;
end
if i == length(MGTstr) % no '*ELEMENT' in MGTstr
    disp('no "*ELEMENT" in MGTstr');
end
j = i+1;
charTemp1 = str2char1(j, MGTstr);
NumStart = inf;
while ~strcmp( charTemp1, '*' ) % Compare char / '*' is the next part begin identity
    if j == length(MGTstr) % no '*ELEMENT' in MGTstr
        break
    end
    stringSplit = split( MGTstr(j) ); % split discards the space characters and returns the result as a string array.
    if length(stringSplit) <= 6
    elseif strcmp( stringSplit(3), 'BEAM' ) % BEAM
        NumTemp = char(stringSplit(6));
        NumTemp = NumTemp(1:end-1);
        NumTemp = str2double(NumTemp);
        if NumStart > NumTemp
            NumStart = NumTemp; % find the smallest number of BEAM
        end
    end
    j = j+1;
    charTemp1 = str2char1(j, MGTstr);
end
k = 1;
while~strcmp( str1Temp(k, MGTstr), '*SECTION' )
    if i == length(MGTstr) % no '*SECTION' in MGTstr
        break
    end
    k = k+1;
end
k = k+1;
charTemp1 = str2char1(k, MGTstr);
% Not consider there is no upcoming '*' part.
while ~strcmp( charTemp1, '*' ) % Compare char / '*' is the next part begin identity
    k = k+1;
    charTemp1 = str2char1(k, MGTstr);
end
SecLine_end = k-1;
end