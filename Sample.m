
clc; clear; close all;
set(groot,'DefaultFigureRenderer','painters')

% Set the video information
videoSequence = 'Test.yuv';
width  = 352;
height = 288;
nFrame = 260;
format = '444';
vid_new = 'Test.yuv';
   
%Read the video sequence
[Y,U,V] = yuvImport(videoSequence, width, height ,nFrame,format); 
%yuvTransform1(videoSequence, width, height, nFrame,vid_new)


% Show sample frames
figure;
c = 0;  % counter
for iFrame = 1:20:260
    c = c + 1;
    subplot(4,5,c), imshow(Y(:,:,iFrame));
    title(['frame #', num2str(iFrame)]);
end

