
% [y,fs] = audioread('12-20.m4a');
% L = length(y);
% y = y(1:length(y)*0.03);
% y = y(1:round(length(y)*0.03));
% L = length(y);
% f = Fs*(0:(L/2))/L;
% f = fs*(0:(L/2))/L;
% FT = fft(y);
% P2 = abs(FT/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% P1 = P2(1:L/2+1);
% P1 = P2(1:round(L/2)+1);
% P1(2:end-1) = 2*P1(2:end-1);
% f = fs*(0:(L/2))/L;
% plot(f,P1)
% plot(f,P1(1:39475))
% plot(f(300),P1(1:300))
% j = 3000;
% plot(f(1:j),P1(1:j))