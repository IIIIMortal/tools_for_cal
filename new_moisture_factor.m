function result = moisture_factor(fungi, moisutre)
% moisture_factor - Description
%
% Syntax: result = moisture_factor(fungi, moisutre)
%
% based on the frequency choosing function to simulate the moisture factor
% given certain env moisture, the fungi traits determine the shape of the curve
% the conversion of moisture tolerance to Q, i use 10^x, since TF in [-1, 1]

    Q = exp(fungi.TF);
    result = sqrt(Q) ./ sqrt(1 + (2 * Q * (moisutre / fungi.MC - fungi.MC / moisutre)) ^ 2);
end

% moisture = 1:100;
% fungi.MC = 20;
% for Q = exp(-1:0.1:1)
%     factor = sqrt(Q) ./ sqrt(1 + (Q .* (moisture ./ fungi.MC - fungi.MC ./ moisture)) .^ 2);
%     figure(10);plot(factor);hold on;
% end
% grid on
% legend(string(-1:0.1:1))
% xlabel("moisture")
% ylabel("k")
% title("Relationship between k & moisutre & moiture tolerance")