clear
i = imread('../img/eiffel_org.png');
o = imread('../img/eiffel_starry_1.png');
subplot(211);
imshow(i);
subplot(212);
imshow(o);
figure;
I = fft2(i);
O = fft2(o);
k = O./I;
[x y] = meshgrid(1:size(k,2), 1:size(k,1));
surf(x, y, 20*log10(abs(k(:,:,1))));
figure;
surf(x, y, (angle(k(:,:,1))));
