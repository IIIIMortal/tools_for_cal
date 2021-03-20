clc;
clear;
close all;
y = 0:63;
Y = qammod(y,64,'bin','UnitAveragePower',true);
X = Y;
p1 = 10^(5/10)/1000;
% Y = sqrt(5)*Y;
Y = sqrt(p1/1)*Y;
pos = [real(Y);imag(Y)];
%pos 内是星座图点的地址

min_P = 0; 
min_mu = 5;

power = 0:0.1:10;
col = size(power);
mu_result = ones(1,col(2));
for b = 1:col(2)
   dis2 = imag(X).^2+real(X).^2;
%    dis2 = pos(1,:).^2+pos(2,:).^2;
   px0 = exp(-(pos(1,:).^2).^(power(b)/2));
   py0 = exp(-(pos(2,:).^2).^(power(b)/2));
   px0 = px0/sum(px0);
   py0 = py0/sum(py0);
   p = py0.*px0;
   P = p/sum(p);
   
   %dis = sqrt(dis2);
   %mu = sum(dis.*P);
   mu4hat = sum((dis2.^2).*P)/(sum(dis2.*P)^2);
   %mu4hat = sum(((dis-mu).^4).*P)/(sum(((dis-mu).^2).*P)^2);
   
   mu_result(b) = mu4hat;
   if mu4hat<min_mu
       min_mu = mu4hat;
       min_P = power(b);
   end
end

min_mu;
min_P;
plot(power,mu_result);
ylabel('mu4hat');
xlabel('power');
title('$P_{average} = 5$','interpreter','latex');
grid minor