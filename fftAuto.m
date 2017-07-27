% Task:     Get Auto-Normalized Magnitude PSD from FFT function
%           (Logarithms Applied)
% Updated:  October 2016
% Original: peachiia.me/matlab/dsp/fftAuto

function [Mag, Freq] = fftAuto(Signal, Fs) % Signal = Channel Data, Fs = Sampling Rate
    nfft = max(size(Signal)); % Length of FFT
    Mag  = -20*log(fft(Signal, nfft)); % for Spectrogram
    %Mag  = fft(Signal, nfft); % for PSD Direct Plot
    Mag  = double(abs(Mag(1:floor(nfft/2)))); 
  %  All  = sum(Mag);
    Freq = (0:nfft/2-1)*Fs/nfft; 
end