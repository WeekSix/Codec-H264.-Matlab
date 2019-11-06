function [IntraPdtBlock,mode] =  Intra_Predictor(fig,frame1,i)  
%predict the Inra Prediction Mode. 
% 0 --- Vertical
% 1 --- Horizontal
iframe = fig(:,:,frame1);
[m,n]=size(iframe);
block_height = m/i;
block_width = n/i;

for height = 1 : block_height
    for width = 1 : block_width
        
 %mode 1 vertical       
        if ( height == 1)
            v_ref = ones(1,i) * 128;
        else
            v_ref = iframe((height-1)*i, (width-1)*i+1:width*i);
        end
        v_block = uint8(ones(i,1)*double(v_ref));
        
%sad from vertical prediction block
        currtBlock = iframe((height-1)*i+1:height*i,(width-1)*i+1:width*i);
        v_sad = Compare2BlockChnlAndOutputSAD(currtBlock, v_block);       

%mode 0 horizontal
        if ( width == 1)
            h_ref = ones(i,1) * 128;
        else
            h_ref = iframe((height-1)*i+1:height*i,(width-1)*i);
        end
 %sad from horizontal predicion block    
        h_block = uint8(double(h_ref) * ones(1,i));
        h_sad = Compare2BlockChnlAndOutputSAD(currtBlock, h_block);       
        
%compare sads to chose better mode
       if(v_sad < h_sad)
           finalsad = v_sad;
           mode{height,width,frame1} = 1;
       elseif(v_sad >= h_sad)
           finalsad = h_sad;
           mode{height,width,frame1} = 0;
       end
       
%Predicted Block       
       if (mode{height,width,frame1} == 0)
            IntraPdtBlock((height-1)*i+1:height*i,(width-1)*i+1:width*i,frame1) = h_block;
       else
            IntraPdtBlock((height-1)*i+1:height*i,(width-1)*i+1:width*i,frame1) = v_block;

       end   
    end
end
end
%