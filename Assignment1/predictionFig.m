function [predictionMatrix] = predictionFig(frame2,mx,my,i)
%UNTITLED12 此处显示有关此函数的摘要
%   此处显示详细说明    % stepping 1:i:sizefig()

% frame1, frame2 are images

figsize = size(frame2);

predictionMatrix = zeros(figsize);
for a = 1:figsize(1)
    for b=1:figsize(2)
        predictionMatrix(a,b) = frame2(a+mx(a,b),b+my(a,b));
    end
end
