% downsz
clear;
close all;
fl = 'photo-1558446007-a2e07be0b0c4';
f = ['../tmp/' fl '.jpeg'];
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