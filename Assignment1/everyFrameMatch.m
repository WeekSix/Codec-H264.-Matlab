function [sads] = everyFrameMatch(fig,i,r,frame1,frame2,filename,Xmotion,Ymotion,mv)
%
%

% frame1 = 67; frame2 = 69;
[mv,Xmotion,Ymotion,sads] = frameMatch(fig,i,r,frame1,frame2,Xmotion,Ymotion,mv);

save(filename, 'mv', 'Xmotion', 'Ymotion');



end
