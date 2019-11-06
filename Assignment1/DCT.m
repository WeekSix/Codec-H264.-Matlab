function [DCT_Coefficient] = DCT(compsensatedResiduals,i)
%
%   Detailed explanation goes hereDCT
sizefig = size(compsensatedResiduals);
DCT_Coefficient = zeros(sizefig);

for width = 1:i:sizefig(1)
    for height = 1:i:sizefig(2)
        range_w_begin = width; range_w_end = min(sizefig(1), width+i-1);
        range_h_begin = height; range_h_end = min(sizefig(2), height+i-1);
        DCT_Coefficient(range_w_begin:range_w_end,range_h_begin:range_h_end) = dct2(compsensatedResiduals(range_w_begin:range_w_end,range_h_begin:range_h_end));
        
    end
end