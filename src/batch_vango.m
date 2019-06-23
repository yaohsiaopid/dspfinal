filePattern = fullfile('../vangogh', '*.jpg'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
figure;
for i = 1:length(theFiles)
    fullFileName = ['../vangogh/' theFiles(i).name];
%     fil = sprintf("../img/%s_rs.png", arr(i));
%     styl = sprintf("../img/%s_starry.png", arr(i));
%     fil = fil{1};
%     styl = styl{1};
%     if(~(isfile(fil) && isfile(styl)))
%         disp(fil);
%         disp("fail");
%         continue
%     end
    img = imread(fullFileName);
    tmp = imresize(img, [256 NaN]);
    tmp = tmp(:,:,1);
    A = fftshift(fft2(tmp,  64, 64));
    M = size(A,2);
    N = size(A,1);
    [x y] = meshgrid(linspace(-M/2, M/2, M), linspace(-N/2, N/2, N));
%     figure('NumberTitle', 'off', 'Name', sprintf('analysis %s ',fullFileName));
    subplot(2,length(theFiles), i); surf(x*2/M, y*2/N, 180/pi*(angle(A(:,:,1)))); title(theFiles(i).name); view(2);
    subplot(2,length(theFiles), i+length(theFiles)); surf(x*2/M, y*2/N, 20*log10(abs(A(:,:,1)))); view(2);
    
end