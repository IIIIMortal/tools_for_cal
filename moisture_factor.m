function result = moisture_factor(fungi, moisutre)
% moisture_factor - Description
%
% Syntax: result = moisture_factor(fungi, moisutre)
%
% based on the frequency choosing function to simulate the moisture factor
% given certain env moisture, the fungi traits determine the shape of the curve
% the conversion of moisture tolerance to Q, i use 10^x, since TF in [-1, 1]

    Q = 10 ^ fungi.TF;
    result = 1 ./ sqrt(1 + (Q * (moisutre / fungi.MC - fungi.MC / moisutre)) ^ 2);
end