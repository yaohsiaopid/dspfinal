close all;
a = [ 1 1 1 1; 0 0 0 0; 1 1 1 1; 0 0 0 0];
t = 1
for i = 3:2:15
    a = padarray(a, [8 8], 0, 'both');
    A = fft(a);
    figure(t);
    t = t + 1;
    M = size(A,2);
    N = size(A,1); 
    [x y] = meshgrid(linspace(-M/2, M/2, M), linspace(-N/2, N/2, N));
    surf(x*2/M, y*2/N, 20*log10(abs(A(:,:,1))));
end