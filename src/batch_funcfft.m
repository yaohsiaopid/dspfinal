% tmp = imread('../img/van_gogh.jpg');
% A = fftshift(fft2(tmp,  64, 64));
% M = size(A,2);
% N = size(A,1);
% [x y] = meshgrid(linspace(-M/2, M/2, M), linspace(-N/2, N/2, N));
% figure; surf(x*2/M, y*2/N, 180/pi*(angle(A(:,:,1))));
% figure; surf(x*2/M, y*2/N, 20*log10(abs(A(:,:,1))));
arr = ["car1"
,"car2"
,"chicago"
,"foggysf1"
,"foosball"
,"golden_gate"
,"hoovertowernight"
,"micromarket"
,"mit"
,"toysflash"
,"trailer"
,"tubingen"];
filters = [];
imgs = [];
for i = 1:length(arr)
    fil = sprintf("../img/%s_rs.png", arr(i));
    styl = sprintf("../img/%s_starry.png", arr(i));
    fil = fil{1};
    styl = styl{1};
    if(~(isfile(fil) && isfile(styl)))
        disp(fil);
        disp("fail");
        continue
    end
    [F imgX] = funcfft(fil, styl, 0);
    filters = [filters; F(:)'];
    imgs = [imgs; imgX(:)'];
end

t = 1;
for i = 1:12
    idx = randi(4096);
    tx = imgs(:, idx);
    ty = filters(:, idx);
    tx = (tx-mean(tx))/std(tx);
    tx = tx - min(tx);
    ty = (ty-mean(ty))/std(ty);
    subplot(4,3,t);
    t = t + 1;
    scatter(tx, ty);
    title(idx);
end
