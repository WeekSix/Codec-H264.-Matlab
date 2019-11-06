% load video
Sample;

% Change frame1 and frame2
i = 8; r = 10;
n = 3;
QP = 6;
I_Period = 2;
% first frame
gray = 128*uint8(ones(size(Y,1), size(Y,2)));
Y = cat(3, gray, cat(3, gray, Y));

%Initialize
sizefig = size(Y);
Xmotion = zeros(sizefig); % offset vector
Ymotion = zeros(sizefig);
[m,n,frames]=size(Y);
mv = cell(m/i,n/i,frames);
compsensatedResiduals = zeros(size(Y));
[IDCT_Residual] = zeros(size(Y));
sads = [];

% encoder
tic;
for j=1:10 % all frames
    frame1 = j+1;
    frame2 = j;
    sads(j) = everyFrameMatch(Y,i,r,frame1,frame2,'test.mat',Xmotion,Ymotion,mv);
    load('test.mat');
    [predictionMatrix] = predictionFig(Y(:,:,frame2),Xmotion(:,:,frame1),Ymotion(:,:,frame1));
    %figure; imshow(uint8(predictionMatrix)); title(num2str(j,'prediction matrix %d'));
    residualMatrix = produceResidual(predictionMatrix,Y,frame1);
    [CompensatedMatrix] = rounding(n, residualMatrix);
    compsensatedResiduals(:,:,j) = CompensatedMatrix;
    %DCT
    [DCT_Coefficient] = DCT(CompensatedMatrix,i);
    QTC = quantization(DCT_Coefficient,i,QP);
    IDCT_Residual(:,:,j)  = IDCT(QTC,i);
    save('approximatedResidual.mat', 'compsensatedResiduals','IDCT_Residual');
    
end
toc;
plot(sads); title(strcat(num2str(n, 'sad graph n=%d'),num2str(r, ',r=%d'),num2str(i, ',i=%d')));


% change frame1 and frame2
%figure; imshow(uint8(predictionMatrix)); title('prediction matrix');
%figure; imshow(Y(:,:,frame1)); title(num2str(frame1));
%figure; imshow(Y(:,:,frame2)); title(num2str(frame2));

figure;imshow(uint8( CompensatedMatrix  ));title('compensated matrix');

