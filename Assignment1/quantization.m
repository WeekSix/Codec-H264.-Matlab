function [QTC] = quantization(DCT_Coefficient,i,QP)
%UNTITLED2 Summary of this function goes here
%  Quantize the ixi TC Matrix
sizefig = size(DCT_Coefficient);
QTC = zeros(sizefig);
Q = zeros(sizefig);

for width = 1:i:sizefig(1)
    for height = 1:i:sizefig(2)
        for x = width:min((i+width-1),sizefig(1))
            for y = height:min((i+height-1),sizefig(2))
                xx = abs(x-width+1);
                yy = abs(y-height+1);
                if (xx+yy) < (i-1)  
                    Q(x,y) = 2^QP;
                elseif (xx+yy) == (i-1) 
                    Q(x,y)  = 2^(QP+1);
                else
                    Q(x,y) = 2^(QP+2);
                end
                QTC(x,y) = (round(DCT_Coefficient(x,y)./Q(x,y))) .* Q(x,y);
            end
        end        
    end
end
save('Quantization.mat',"Q",'QTC');
end

