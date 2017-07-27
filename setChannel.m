function Channel = setChannel(label, data)
disp('Set channel struct...');

Channel.Fp1 = data(1,:);
Channel.F3 = data(2,:);
Channel.C3 = data(3,:);
Channel.P3 = data(4,:);
Channel.O1 = data(5,:);
Channel.F7 = data(6,:);
Channel.T3 = data(7,:);
Channel.T5 = data(8,:);
Channel.Fz = data(9,:);
Channel.Fp2 = data(10,:);
Channel.F4 = data(11,:);
Channel.C4 = data(12,:);
Channel.P4 = data(13,:);
Channel.O2 = data(14,:);
Channel.F8 = data(15,:);
Channel.T4 = data(16,:);
Channel.T6 = data(17,:);
Channel.Cz = data(18,:);
Channel.Pz = data(19,:);
Channel.A2A1 = data(20,:);
Channel.A23R23 = data(21,:);
