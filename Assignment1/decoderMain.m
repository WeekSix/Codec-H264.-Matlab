% load video
Sample;

% Change frame1 and frame2
i = 8; r = 4;
n = 3;

% first frame
gray = uint8(128*ones(size(Y,1), size(Y,2)));
%Y = cat(3, gray, cat(3, gray, Y));
Y = cat(3, gray, Y);

compsensatedResiduals = zeros(size(Y));

reconstructs = [];

% decoder
for j=1:5 % only odd frames
    disp(j);
    frame1 = j+1;
    frame2 = j;
    everyFrameMatch(Y,i,r,frame1,frame2,'test.mat');
    load('test.mat');
    [predictionMatrix] = predictionFig(Y(:,:,frame1),Y(:,:,frame2),Xmotion(:,:,frame1),Ymotion(:,:,frame1));
    residualMatrix = produceResidual(predictionMatrix,Y,frame1);
    load('approximatedResidual.mat');
    CompensatedMatrix = compsensatedResiduals(:,:,j);
    [reconstructedMatrix] = reconstruct(predictionMatrix,CompensatedMatrix);
    reconstructs(:,:,j) = reconstructedMatrix;
end

%frame1 = 69; frame2 = 67;




% change frame1 and frame2
%figure; imshow(uint8(predictionMatrix)); title('prediction matrix');
%figure; imshow(Y(:,:,frame1)); title(num2str(frame1));
%figure; imshow(Y(:,:,frame2)); title(num2str(frame2));


%figure;imshow(uint8( CompensatedMatrix  ));title('compensated matrix');
