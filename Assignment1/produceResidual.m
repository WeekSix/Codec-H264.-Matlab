function [residualMatrix] = produceResidual(predictionMatrix,Y,frame)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

residualMatrix = (-int32(predictionMatrix)+int32(Y(:,:,frame)));

%figure; (imshow(uint8(  residualMatrix  )));
%title('Residual');

end

