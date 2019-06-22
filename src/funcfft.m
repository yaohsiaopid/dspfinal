function funcfft(img_path, styled_path)
% clear
% close all;
img = imread(img_path);
styled = imread(styled_path);
% figure('NumberTitle', 'off', 'Name', img_path);
% subplot(2,3,1);
% imshow(img(:,:,1));
% subplot(2,3,2);
% imshow(img(:,:,2));
% subplot(2,3,3);
% imshow(img(:,:,3));
% subplot(2,3,4);
% imshow(styled(:,:,1));
% subplot(2,3,5);
% imshow(styled(:,:,2));
% subplot(2,3,6);
% imshow(styled(:,:,3));

% --------------------------------------------
figure('NumberTitle', 'off', 'Name', sprintf('analysis %s ',img_path));
chan = img(:,:,1);
sty_chan = styled(:,:,1);
A = fftshift(fft2(chan,  64, 64));
B = fftshift(fft2(sty_chan, 64, 64));
% % count zero
% idx = (A == 0);
% cnt = sum(idx(:))
M = size(B,2);
N = size(B,1); 
[x y] = meshgrid(linspace(-M/2, M/2, M), linspace(-N/2, N/2, N));

subplot(1,3,1);
tmp = 20*log10(abs(B(:,:,1)./A(:,:,1)));
surf(x*2/M, y*2/N, tmp);
view(2);
title('styl/im (dB)');
rotate3d on;


tmp = 20*log10(abs(B(:,:,1)-A(:,:,1)));
subplot(1,3,2);
surf(x*2/M, y*2/N, tmp);
view(2);
title('styl- im (dB)');
rotate3d on;

ang = angle(B(:,:,1))-angle(A(:,:,1));
subplot(1,3,3);
surf(x*2/M, y*2/N, 180*ang/pi);
view(2);
title('styl- im angle');
rotate3d on;




