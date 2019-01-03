function fourier(w,new_fs)
t=0:1/241:5;  %initial_fs =241
P=2;
x=w*rand(1,length(t))+sin(2*pi*t*5.6)+2*sin(2*pi*t*1.3);  %signal


subplot(3,1,1);
plot(t,x);
% hold on;

%resampling with new_fs
step=241/new_fs;
s=zeros(1,5*new_fs);

for i=1:5*new_fs
    s(i)=1+(i-1)*step;
end
s=round(s);
subplot(3,1,2);
plot(t(s),x(s))

x=x(s);

nfft= 2^(nextpow2(length(x))+P)     %the number of points for FFT is power of 2
NumUniquePts = ceil((nfft+1)/2);


fftx = fft(x,nfft) ;
fftx(1)
fftx(NumUniquePts)
 [fftx(2:NumUniquePts-1);fftx(nfft:-1:NumUniquePts+1)]


subplot(3,1,3); 
plot(fftx(1:NumUniquePts-1),'.','Color','red')
hold on;
plot(fftx(nfft:-1:NumUniquePts),'.','Color','blue')
 axis([-40 40 -10 10]);
end