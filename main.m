%% clear old data
clc; clear; close all;

%% read *.edf file

FILENAME = 'MI_Ben 03.001.01 AGE 21  EO';
[Header,Data] = edfread(strcat(FILENAME,'.edf'));

%% set label channel

Channel = setChannel(Header.label, Data);

%% set trigger data

TRIGGER_START_LEFTSIDE_MIN = '00:00:29'; 
TRIGGER_START_RIGHTSIDE_MIN = '00:05:15';

SAMPLINGRATE_DATA_PER_SEC = Header.frequency(1);

%% write trigger time(min) to *.csv file% 
% FileWriteName = strcat(FILENAME,'.csv');
% writeTriggerFile(TRIGGER_START_LEFTSIDE_MIN, TRIGGER_START_RIGHTSIDE_MIN,FileWriteName);

%% get trigger (index)

TriggerIndex = getTrigger(TRIGGER_START_LEFTSIDE_MIN,TRIGGER_START_RIGHTSIDE_MIN, SAMPLINGRATE_DATA_PER_SEC);

%% set data 
LEFT_SHIFT_SEC = 0.5;
WINDOW_LENGTH_SEC = 5;

%% get data
LeftShiftIndex = LEFT_SHIFT_SEC * SAMPLINGRATE_DATA_PER_SEC * -1;
WindowLength = WINDOW_LENGTH_SEC * SAMPLINGRATE_DATA_PER_SEC;

% DataPosition = getData(RawChannel, TriggerIndex, LeftShiftIndex, WindowLength)
DataTrigger.C3 = getData(Channel.C3, TriggerIndex, LeftShiftIndex, WindowLength);  
DataTrigger.C4 = getData(Channel.C4, TriggerIndex, LeftShiftIndex, WindowLength);

%% get FFT (sum frequency band) // timeDomain -> frequecyDomain

PointGraph = zeros(60,2);

for i=1:size(DataTrigger.C3)
    
    % get power spectrum
    [PowerSpectrum.C3.Mag(i,:), PowerSpectrum.C3.Freq(i,:)] = fftAuto(DataTrigger.C3(i,:), SAMPLINGRATE_DATA_PER_SEC);
    [PowerSpectrum.C4.Mag(i,:), PowerSpectrum.C4.Freq(i,:)] = fftAuto(DataTrigger.C4(i,:), SAMPLINGRATE_DATA_PER_SEC);
 
    % get during index frequency band
    [IndexFreq.MU(1), IndexFreq.MU(2)] = getIndexFreq('MU', PowerSpectrum.C3.Freq(1,:));
    
    % get sum all magnitude each band
    AllSum.C3 = sum(PowerSpectrum.C3.Mag(i,:));
    AllSum.C4 = sum(PowerSpectrum.C4.Mag(i,:));
    
    % get sum frequency band each channel
    SumFreq.MU.C3 = sum(PowerSpectrum.C3.Mag(i,IndexFreq.MU(1):IndexFreq.MU(2)));
    SumFreq.MU.C4 = sum(PowerSpectrum.C4.Mag(i,IndexFreq.MU(1):IndexFreq.MU(2)));
    
    % get percent of sum frequency band each channel
    PercentSumFreq.MU.C3(i) = (SumFreq.MU.C3 * 100) / AllSum.C3;
    PercentSumFreq.MU.C4(i) = (SumFreq.MU.C4 * 100) / AllSum.C4;
    
end

x1 = PercentSumFreq.MU.C3(1:30);
y1 = PercentSumFreq.MU.C4(1:30);
scatter(x1,y1,'filled');
hold on;
x2 = PercentSumFreq.MU.C3(31:60);
y2 = PercentSumFreq.MU.C4(31:60);
scatter(x2,y2);
