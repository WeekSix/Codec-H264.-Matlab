function [mv,Xmotion,Ymotion,sads] = frameMatch(fig,i,r,frame1,frame2,Xmotion,Ymotion,mv)
%UNTITLED10 此处显示有关此函数的摘要
%   此处显示详细说明
% X/Ymotion: height x width x num of frame

sizefig = size(fig(:,:,frame1));
% Xmotion = zeros(sizefig); % offset vector
% Ymotion = zeros(sizefig);
% Xpos   = zeros(sizefig);
% Ypos   = zeros(sizefig);
% [m,n]= size(fig(:,:,frame1));
% mv = cell(m/i,n/i);

sads = [];

% stepping 1:i:sizefig()
for x=1:i:sizefig(1)
    for y=1:i:sizefig(2)
        currfig = fig(:,:,frame1);
        reffig  = fig(:,:,frame2);
        if x == 97 && y == 289
            saldfj = 1;
        end
        [sad, ~, mk, ml, sads] = blockMatch(i,x,y,currfig,reffig,r);
        sads(end+1) = sad;
        
        % manipulate mk ml
        
        xl = x; xh = min(sizefig(1), x+i-1);
        yl = y; yh = min(sizefig(2), y+i-1);
        Xmotion(xl:xh,yl:yh,frame1) = mk;
        Xpos(xl:xh,yl:yh,frame1) = x;
        Ymotion(xl:xh,yl:yh,frame1) = ml;
        Ypos(xl:xh,yl:yh,frame1) = y;
        
        h = floor(x/i)+1;
        w = floor(y/i)+1;
        vector = [mk,ml];
        mv{h,w,frame1} = vector;

    end
end
sads = sum(sads);

end
