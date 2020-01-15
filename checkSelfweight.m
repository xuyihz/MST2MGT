%% function
%
% check selfweight part
% Xu Yi, 2020

%%
function newMGTstr = checkSelfweight(MGTstr)
% *SELFWEIGHT    ; Self Weight
% ; X, Y, Z, GROUP
% 0, 0, -1.1,
i = 1;
while~strcmp( str1Temp(i, MGTstr), '*SELFWEIGHT,' ) %
    if i == length(MGTstr) % no '*SELFWEIGHT,' in MGTstr
        break
    end
    i = i+1;
end
if i == length(MGTstr) % no '*SELFWEIGHT,' in MGTstr
    newMGTstr = MGTstr;
else
    j = i+1;
    charTemp1 = str2char1(j, MGTstr);
    while ~strcmp( charTemp1, '*' ) % Compare char / '*' is the next part begin identity
        if j == length(MGTstr) % no '*SELFWEIGHT,' in MGTstr
            break
        end
        j = j+1;
        charTemp1 = str2char1(j, MGTstr);
    end
    SWstr = [ "*SELFWEIGHT    ; Self Weight";
        "; X, Y, Z, GROUP";
        "0, 0, -1.1,";
        ""; ];
    newMGTstr = [ MGTstr(1:i-1); SWstr; MGTstr(j:end) ];
end
end
