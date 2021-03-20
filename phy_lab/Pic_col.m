data = load("phydata.txt");
f_r = data(1,:);
vbar = data(2,:);

x = 15:0.1:145;
p = polyfit(vbar,f_r,1);
y = x*p(1)+p(2);

F = figure;
P = plot(vbar,f_r,"-or",x,y,"--b");
legend('ʵ�ʽ��','��С�������');
xlabel('$\overline{v}/(cm/s)$','Interpreter','latex');
ylabel('$F_r/(10^{-3}\times N)$','interpreter','latex');
title('$F_r-\overline{v}\quad m_1 = 173.5g$','interpreter','latex');
% hold on;
% plot(x,y,"b");
grid minor;
set(gca,'XTick',15:20:145)
saveas(F,'phy_F_r_v.png');


