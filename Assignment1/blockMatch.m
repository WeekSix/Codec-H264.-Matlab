function [min_sad, pad_fig, mk, ml, sads] = blockMatch(i,x,y,fig,ref_fig,r)
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
% block i*i
maxsize = size(fig);

% padding block from original (could be modualized)
pad_fig = uint8(ones(i)*128);
original_block = fig(x:min(x+i-1,maxsize(1)), y:min(y+i-1,maxsize(2)));
pad_fig(1:size(original_block,1), 1:size(original_block,2)) = original_block;

min_sad = inf;
mk = 0; ml = 0;
l1norm = inf; min_y = inf;
ncount = 1;
for k = -r:r
    for l=-r:r
        
        refx = x+k;
        refy = y+l;
        if refx<1  || refy<1 || refx+i-1 >maxsize(1) || refy+i-1 >maxsize(2)
            continue
        end
        xl = refx;
        xh = refx+i-1;
        yl = refy;
        yh = refy+i-1;
        refblock = ref_fig(xl:xh,yl:yh);
        sad = Compare2BlockChnlAndOutputSAD(pad_fig, refblock);
        sads(ncount) = sad;
        ncount = ncount + 1;
        l1 = abs(k) + abs(l);
        if sad < min_sad
            min_sad = sad;
            mk = k;
            ml = l;
            l1norm = l1; min_y = refy;
        elseif sad == min_sad
            if l1 < l1norm
                min_sad = sad;
                mk = k;
                ml = l;
                l1norm = l1; min_y = refy;
            elseif l1 == l1norm
                if refy < min_y
                    min_sad = sad;
                    mk = k;
                    ml = l;
                    l1norm = l1; min_y = refy;
                end
            end
        end
    end
end

end
