function [mx,f]=compute_spectrum(x,Fs,P)
%P=0,1,2... cu cat e mai mare cu atat am o scala mai fina de frecvente
% Fs sampling frequency 

nfft = 2^(nextpow2(length(x))+P);

fftx = fft(x,nfft); 

NumUniquePts = ceil((nfft+1)/2);

% FFT is symmetric, throw away second half 
fftx = fftx(1:NumUniquePts); 

% Take the magnitude of fft of x and scale the fft so that it is not a function of the length of x
mx = abs(fftx)/length(x); 

mx = mx.^2; 


% Since we dropped half the FFT, we multiply mx by 2 to keep the same energy.
% The DC component and Nyquist component, if it exists, are unique and should not be multiplied by 2.

if rem(nfft, 2) % odd nfft excludes Nyquist point
  mx(2:end) = mx(2:end)*2;
else
  mx(2:end -1) = mx(2:end -1)*2;
end

% This is an evenly spaced frequency vector with NumUniquePts points. 

f = (0:NumUniquePts-1)*Fs/nfft; 

%[mx;f]


end