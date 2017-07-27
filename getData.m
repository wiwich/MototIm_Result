function [DataOutput] = getData (Channel, TriggerIndex, LeftShiftIndex, WindowLength)

for i=1:length(TriggerIndex)
    StartIndex = TriggerIndex(i) + LeftShiftIndex;
    EndIndex = StartIndex + WindowLength - 1;
    DataOutput(i,:) = Channel(StartIndex:EndIndex);    
end
