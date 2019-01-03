function spectru(w,new_fs)
t=0:1/241:5;
x=w*rand(1,length(t))+2*sin(2*pi*t*5.6)+sin(2*pi*t*1.3)+sin(2*pi*t*20);

figure(1)
subplot(3,1,1);
plot(t,x);

% new_fs=15;
step=241/new_fs;
s=zeros(1,5*new_fs);

for i=1:5*new_fs
    s(i)=1+(i-1)*step;
end
s=round(s);

subplot(3,1,2);
plot(t(s),x(s))
T=t(s(3))-t(s(2))

[a1,b1]=compute_spectrum(x(s),new_fs,2);
subplot(3,1,3); 
plot(b1,a1)
F= b1(3)-b1(2)
% axis([0 25 0 1]);

range=find(b1<7 & b1>4);
  b1=b1(range);
  a1=a1(range);
 [m,ind]=max(a1);        
  [b1(ind),new_fs]  




end