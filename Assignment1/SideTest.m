Sample;
i = 8;
QP = 6;
Y1 = Y(:,:,3:5);

%DCT/QUANT/RESCAL/INVERSE DCT TEST
IDCT_Residual  = zeros(size(Y1));
for j = 1:3
    [DCT_Coefficient] = DCT(Y1(:,:,j),i);
    [QTC] = quantization(DCT_Coefficient,i,QP);
    IDCT_Residual(:,:,j) = uint8(IDCT(QTC,i));

    figure;imshow(uint8(IDCT_Residual(:,:,j)));title('compensated matrix');
end

