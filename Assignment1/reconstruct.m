function [reconstructedMatrix] = reconstruct(predictionMatrix,CompensatedMatrix)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

reconstructedMatrix = uint8(round(uint8(predictionMatrix)+uint8(CompensatedMatrix )));

figure; (imshow(uint8(  reconstructedMatrix  )));
title('Reconstruct');

end
