clc;
clear;
close all;
x = 0:63;
y = x;
s= 0;
Y = qammod(x,64,'bin','UnitAveragePower',true);%,'UnitAveragePower',true);
pos = [real(Y);imag(Y)];
x = 1.5:0.001:3;
for lambda = 1.5:0.001:3

    Px = exp(-(lambda*pos(1,:).^2))./sum(exp(-(lambda*pos(1,:).^2)));
 
    Py = exp(-(lambda*pos(2,:).^2))./sum(exp(-(lambda*pos(2,:).^2)));
    
    P = (Px.*Py);
    S = sum(sum(P));
    P = P/S;
    entro = sum(sum(-P.*log2(P)));
    
    
    if lambda == 1.5
        s = entro;
    else
        s = [s(1,:),entro];
    end
end


f1 = figure;
plot(x,s,'-xr');
hold on;
plot(x,5*ones(1,1501),'-ob');
axis([2.685,2.705,4.995,5.005]);
grid minor
ylabel('$Entropy = -plog_2(p)$','interpreter','latex');
xlabel('$\lambda$','interpreter','latex');
title('$entropy-\lambda$','Interpreter','latex');
saveas(f1,'Entropy-lambda.png');


lambda = 2.6902;
f2 = figure;
ti = -1:0.001:1;
[X1,Y1] = meshgrid(ti,ti);
P1 = griddata(pos(1,:),pos(2,:),P,X1,Y1);
result = reshape(P,8,8);
mesh(X1,Y1,P1);
hold on;
plot3(pos(1,:),pos(2,:),P,'or');
grid minor;
title('$\lambda = 2.6902\quad p_{position}$','Interpreter','latex');
ylabel('$Q$','Interpreter','latex');
xlabel('$I$','Interpreter','latex');
zlabel('$P(I,Q)$','interpreter','latex');
shading interp;
saveas(f2,'lambda = 2.6902_P.png');
saveas(result,'result_P.txt'); 
% 
% f2 = figure;
% 
% plot3(pos(1,:),pos(2,:),P,'ob');
% grid minor;
% box on;
% 
% ti = -1:0.05:1;
% [X1,Y1] = meshgrid(ti,ti);
% P1 = griddata(pos(1,:),pos(2,:),P,X1,Y1);
% 
% hold on;

% grid off;
% f3 = figure;
% surf()
