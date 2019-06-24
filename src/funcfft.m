function [filter, org] = funcfft(img_path, styled_path, disp)
% clear
% close all;
img = imread(img_path);
styled = imread(styled_path);
% styled_path
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

chan = img(:,:,1);
sty_chan = styled(:,:,1);
% chan_test = test(:,:,1);
% N1 = size(chan, 1);
% N2 = size(chan, 2);
% L1 = size(chan_test, 1);
% L2 = size(chan_test, 2);
A = fftshift(fft2(chan, 64, 64));
B = fftshift(fft2(sty_chan, 64, 64));
% ang = angle(B(:,:,1))-angle(A(:,:,1));
% tmp = B./A;
% tmp(abs(20*log10(tmp)) < 10) = 1;
% final = C.*tmp;
% imshow(uint8(ifft2(ifftshift(final))));
% % % count zero
% % idx = (A == 0);
% % cnt = sum(idx(:))
M = size(B,2);
N = size(B,1); 
[x y] = meshgrid(linspace(-M/2, M/2, M), linspace(-N/2, N/2, N));
% 

org = abs(A(:,:,1));
% filter = abs(B(:,:,1)./A(:,:,1));
filter = (B(:,:,1)./A(:,:,1));
tmp = 20*log10(abs(B(:,:,1)./A(:,:,1)));
% tmp = 20*log10(abs(B(:,:,1)));
if(disp == 1) 
    figure('NumberTitle', 'off', 'Name', sprintf('analysis %s ',img_path));
    subplot(1,3,1);
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
end



