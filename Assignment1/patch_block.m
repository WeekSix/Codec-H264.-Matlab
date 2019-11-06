function [pad_fig] = patch_block(x, y, i, fig)
%UNTITLED7 此处显示有关此函数的摘要
%   此处显示详细说明
maxsize = size(fig);
pad_fig = uint8(ones(i)*128);
original_block = fig(x:min(x+i-1,maxsize(1)), y:min(y+i-1,maxsize(2)));
pad_fig(1:size(original_block,1), 1:size(original_block,2)) = original_block;
end

