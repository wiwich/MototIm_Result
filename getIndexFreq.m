function [FistIndex, LastIndex] = getIndexFreq(nameOfFreq, FreqData)

FIRST_DATA = 0;
LAST_DATA = 0;

switch(nameOfFreq)
    case 'DELTA'
        FIRST_DATA = 0; LAST_DATA = 4; 
    case 'THETA'
        FIRST_DATA = 4; LAST_DATA = 8; 
    case 'ALPHA'
        FIRST_DATA = 8; LAST_DATA = 13;
    case 'MU'
        FIRST_DATA = 11; LAST_DATA = 12.5; 
    case 'BETA'
        FIRST_DATA = 13; LAST_DATA = 30;
    case 'GAMMA'
        FIRST_DATA = 30; LAST_DATA = 50;     
    otherwise
        disp('Name of frequency is wrong!!!');
end

First = find(FreqData >= FIRST_DATA);
FistIndex = First(1);

Last = find(FreqData <= LAST_DATA);
LastIndex = Last(length(Last));

