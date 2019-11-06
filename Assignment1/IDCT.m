function [IDCT_Residual] = IDCT(QTC,i)
%
%   Detailed explanation goes here

sizefig = size(QTC);
IDCT_Residual = zeros(sizefig);

for width = 1:i:sizefig(1)
    for height = 1:i:sizefig(2)
        range_w_begin = width; range_w_end = min(sizefig(1), width+i-1);
        range_h_begin = height; range_h_end = min(sizefig(2), height+i-1);
        IDCT_Residual(range_w_begin:range_w_end,range_h_begin:range_h_end) = idct2(QTC(range_w_begin:range_w_end,range_h_begin:range_h_end));
    end
end
save('IDCT.mat');