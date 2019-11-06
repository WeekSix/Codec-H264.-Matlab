function [CompensatedMatrix] = rounding(n, residualMatrix)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明

CompensatedMatrix = round(residualMatrix / (2^n)) * 2^n;

end

