function [diff] = Differential(frame,frame1)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
figsize = size(frame);
diff = cell(figsize);
%i frame
for height = 1:figsize(1)
    for width = 1:figsize(2)
        if (width == 1)  
            diff{height,width,frame1} = frame{height,width,frame1};
        else
            diff{height,width,frame1} = frame{height,(width-1),frame1} - frame{height,width,frame1};
        end
    end
end
save('Differential.mat','diff');
end

% Difference of complete frames (288*352)
% for height = 1:figsize(1)
%     for width = 1:figsize(2)
%         if (width == 1)  
%             diff(height:(height+i-1),width:(width+i-1),frame1) = fig(height:(height+i-1),width:(width+i-1),frame1);
%         else
%             diff(height:(height+i-1),width:(width+i-1),frame1) = fig(height:(height+i-1),width:(width+i-1),frame1) - fig(height:(height+i-1),(width-i):(width-1),frame1);
%         end
%     end
% end