arr = ["golden_gate", "mit", "chicago", "hoovertowernight", "tubingen"];
res = [];
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
    funcfft(fil, styl);
end