% tmp = imread('../img/van_gogh.jpg');
% A = fftshift(fft2(tmp,  64, 64));
% M = size(A,2);
% N = size(A,1);
% [x y] = meshgrid(linspace(-M/2, M/2, M), linspace(-N/2, N/2, N));
% figure; surf(x*2/M, y*2/N, 180/pi*(angle(A(:,:,1))));
% figure; surf(x*2/M, y*2/N, 20*log10(abs(A(:,:,1))));
close
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
r2 = [];
sse2 = [];
cnt = 0;
for idx=1:4096
    tx = imgs(:, idx);
    ty = filters(:, idx);
    disp(idx)
    if( sum(isnan(ty(:))) == 0 && sum(isnan(tx(:))) == 0  && sum(isinf(tx(:))) == 0  &&sum(isinf(ty(:))) == 0 ) 
        tx = (tx-mean(tx))/std(tx);
        ty = (ty-mean(ty))/std(ty);
        [ft, gof, output] = fit(tx, ty, 'exp2','Lower', [-1000, -1000, -1000, -1000], 'Upper',[1000,1000,1000,1000]);
        r2 = [r2; gof.rsquare];
        sse2 = [sse2; gof.sse];
    else
        cnt = cnt + 1;
        r2 = [r2; 0];
        sse2 = [sse2; 1000];
    end
end
% [X Y] = meshgrid(1:64, 1:64);
% figure;
% surf(X, Y, reshape(r2, 64, 64));
% figure;
% surf(X, Y, reshape(sse2, 64, 64));