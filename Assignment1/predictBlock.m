function [predictionBlock] = predictBlock(frame2,mx,my,i)
%Prediction of each block
% frame1, frame2 are images

figsize = size(i);
predictionBlock = zeros(figsize);
for x = 1:figsize(1)
    for y=1:figsize(2)
        predictionBlock(x,y) = frame2(x+mx(x,y),y+my(x,y));
    end
end
