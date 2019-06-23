% downsz
clear;
close all;
fl = 'toysflash';
f = ['../img/' fl '.png'];
im = imread(f);

% Iblur = imgaussfilt(im, 2);
% 
% imshow(im);
% figure(2);
% tmp = Iblur(1:3:768, :, :);
% tmp = tmp(:, 1:5:1024, :);
% imshow(tmp);
% figure(3);
% % final = Iblur(
% imshow(imresize(im,[256,256]));
tmp = imresize(im, [256, NaN]);
out = ['../img/' fl '_rs.png'];
imwrite(tmp, out);