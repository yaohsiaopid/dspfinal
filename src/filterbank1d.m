% w_c = 0.1pi , Ap = 0.5 dB, As = 50 dB, wp = 0.08pi, ws = 0.12pi
% A = 50 --> Hamming window
% M is x and thus Computational complexity C = (x+1) * 50 = 16550 mults/s
close all;
clear;
clf;
figure
ws = 0.11 * pi; Ap = 0.5; wp = 0.09 * pi; As = 50;
deltap = ((10^(Ap/20))-1)/(10^(Ap/20)+1);
deltas = (1+deltap)/10^(As/(20));
delta = min(deltap,deltas); A = -20*log10(delta);
wc = (ws + wp) / 2;
% 6.6 pi / L = delw
delw = ws - wp;
L = ceil(6.6*pi/delw);
if mod(L-1,2) == 1
    L = L + 1;
end
disp(sprintf("L %d", L));

M = L - 1;
alpha = M/2; n = 0:M;
hd = sinc(wc/pi*(n-alpha))*wc/pi; 
h = hd.*hamming(L)';
subplot(2,2,1);

h_1 = [];
% h_1 = h;
k = 3;
for n = 0:length(h)-1
    
    h_1 = [h_1 h(n+1)*exp(j*2*pi/10*n*k)];
end
stem(h);

[h,w] = freqz(h_1,1, 'whole');
subplot(2,2,2);
plot(w/pi, 20*log10(abs(h)));
i = 512;
while w(i) >= ws
    i = i - 1;
end
if w(i) < ws
    i = i + 1;
end
subplot(2,2,4);
yyaxis right
plot(w(i:512)/pi, 20*log10(abs(h(i:512))));
% line([0,1], [-50,-50]);
% text(1,-50, '-50 dB');
xlabel('omega (\pi rad)');
ylabel('stopband dB');
i = 1;
while w(i) <= wp
    i = i + 1;
end
yyaxis left;
plot(w(1:i)/pi, 20*log10(abs(h(1:i))));
ylabel('passband dB');
subplot(2,2,3);
err = [];
for tmp = 1:512
    if w(tmp) > wc
        err = [err abs(h(tmp))];
    else
        err = [err 1-abs(h(tmp))];
    end
end
plot(w/pi, err);
