
clc; clear; close all;
set(groot,'DefaultFigureRenderer','painters')

YuvTransform('tempete_cif.yuv',352,288,'420','Test_new.yuv',352,288,'444')

% Set the video information
videoSequence = 'tempete_cif.yuv';
width  = 352;
height = 288;
nFrame = 260;



% Read the video sequence
[Y,U,V] = yuvImport(videoSequence, width, height ,nFrame); 


% % Show sample frames
% figure;
% c = 0;  % counter
% for iFrame = 1:20:260
%     c = c + 1;
%     subplot(4,5,c), imshow(Y(:,:,iFrame));
%     title(['frame #', num2str(iFrame)]);
% end
