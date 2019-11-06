function [sad] = Compare2BlockChnlAndOutputSAD(Y1, Y2)
%compare channels of two blocks
%   Y1, Y2: i*i;

sad = sum(sum(abs(int32(Y1) - int32(Y2))));

end
