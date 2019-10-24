function yuvTransform1(vid, width, height, nFrame,vid_new)
%Convert 420 to 444

%read yuv sequences from old 420 files
[y, u, v] = yuvImport(vid, width, height, nFrame);

new_u = uint8(zeros(height, width, nFrame));
new_v = uint8(zeros(height, width, nFrame));

for iFrame = 1:1:nFrame
    for iwidth = 1:1:width
        for iheight = 1:1:height
            new_u(iheight,iwidth,iFrame) = uint8(u(round(iheight/2),round(iwidth/2),iFrame));
            new_v(iheight,iwidth,iFrame) = uint8(v(round(iheight/2),round(iwidth/2),iFrame));
        end
    end
end  

fileID = fopen(vid_new,'w');
for i=1:nFrame
    fwrite(fileID,y(:,:,i)','uchar');    
    fwrite(fileID,new_u(:,:,i)','uchar');    
    fwrite(fileID,new_v(:,:,i)','uchar');    
end
fclose(fileID);
end

