function Trigger = getTrigger(START_LEFTSIDE_MIN, START_RIGHTSIDE_MIN, SAMPLINGRATE)

disp('Set trigger data...');
WAITING_SEC = 9;

[LY, LM, LD, LH, LMN, LS]  = datevec(START_LEFTSIDE_MIN);
[RY, RM, RD, RH, RMN, RS]  = datevec(START_RIGHTSIDE_MIN);

for i=1:30
   if i==1
       Trigger(i) = ((LMN*60) + LS) * SAMPLINGRATE;
   else 
       Trigger(i) = Trigger(i-1) + (WAITING_SEC * SAMPLINGRATE);
   end
end

for i=31:60
    if i==31
        Trigger(i) = ((RMN*60) + RS) * SAMPLINGRATE;
    else
        Trigger(i) = Trigger(i-1) + (WAITING_SEC * SAMPLINGRATE);
    end
end
