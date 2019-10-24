function [y, u, v] = yuvImport(vid, width, height, nFrame,format)

% YUVREAD returns the Y, U and V components of a video in separate
% matrices. 


fid = fopen(vid,'r');           % Open the video file
stream = fread(fid,'*uchar');    % Read the video file

if strcmp(format,'420')
    length = 1.5 * width * height;  % Length of a single frame
elseif strcmp(format,'444')
    length = 3 * width * height;   
end

if strcmp(format,'420')
    y = uint8(zeros(height,   width,   nFrame));
    u = uint8(zeros(height/2, width/2, nFrame));
    v = uint8(zeros(height/2, width/2, nFrame));
elseif strcmp(format,'444')
    y = uint8(zeros(height, width, nFrame));
    u = uint8(zeros(height, width, nFrame));
    v = uint8(zeros(height, width, nFrame));
end

for iFrame = 1:nFrame

    frame = stream((iFrame-1)*length+1:iFrame*length);
    % Y component of the frame
    yImage = reshape(frame(1:width*height), width, height)';
    if strcmp(format,'420')
    % U and V component of the frame
        uImage = reshape(frame(width*height+1:1.25*width*height), width/2, height/2)';
        vImage = reshape(frame(1.25*width*height+1:1.5*width*height), width/2, height/2)';        
    elseif strcmp(format,'444')
        uImage = reshape(frame(width*height+1:2*width*height), width, height)';
        vImage = reshape(frame(2*width*height+1:3*width*height), width, height)'; 
    end

    
    y(:,:,iFrame) = uint8(yImage);
    u(:,:,iFrame) = uint8(uImage);
    v(:,:,iFrame) = uint8(vImage);

end
