clc;
clear;
close all;
format long;
choice = 3;
g_standard = 9.739;
D = 0.10064;

if choice ==1
    p1 = figure;
    data = load('lab_rotliq1.txt');
    %omega = data(2,:)*2*pi\60;
    del_h = (data(4,:)-data(3,:))/100;
    g = (pi^2*D^2*data(2,:).^2)./(7200*del_h);
    plot(data(1,:),g,'-m^');
    hold on;
    g1 = polyfit(data(1,:),g,0);
    plot(data(1,:),g1*ones(1,6),"--vg");
    plot(data(1,:),g_standard*ones(1,6),"--ok");
    grid minor;
    legend('g_{lab}','g_{average}','g_{杭}');%,'interpreter','latex');
    title('利用高度差法测量重力加速度');
    %choice = 2;
    saveas(p1,'利用高度差法测量重力加速度.png');
    ug = sqrt((sum((g-g1).^2))/30);
end
if choice == 2
    data = load('lab_rotliq2.txt');
    n = data(2,:);
    d = data(3,:)/1000;
    del_h = 7.6/100;
    tan1 =  d./del_h;
    theta = atan(tan1)/2;
    TAN = tan(theta);
    g = (2*pi^2*D*n.^2)./(3600*sqrt(2)*TAN);
    g2 = polyfit(data(1,:),g,0);
    tan_n = polyfit(n.^2,TAN,1);
   
    p2 = figure;
    plot(data(1,:),g,'-bo');
    hold on;
    plot(data(1,:),g2*ones(1,6),'--g^');
    plot(data(1,:),g_standard*ones(1,6),"--ok");
    ylabel('g_{method2}');
    legend('g_{lab}','g_{average}','g_{杭}');
    grid minor;
    title('利用斜率法测量重力加速度'); 
    saveas(p2,'利用斜率法测量重力加速度.png');
    ug = sqrt((sum((g-g2).^2))/30);

    p3 = figure;
    plot(n.^2,TAN,'r+');
    hold on;
    plot(n.^2,tan_n(1).*n.^2+tan_n(2),'--b');
    ylabel('$tan\theta$','interpreter','latex');
    xlabel('n^2');
    grid minor;
    title('画出tan\theta和n^2的关系');
    text(n(1)^2+2000,TAN(2),'k = 4.131e-05');
    text(n(1)^2+2000,TAN(1),'g =  9.44');
    tan_n(1);
    g3 = 2*pi^2*D/(3600*sqrt(2)*tan_n(1));
    saveas(p3,'tan和n^2的关系.png');
   % choice = 3;
end

if choice == 3
    data = load('lab_rotliq3.txt');
    g_r = 9.793;

    data1 = sortrows(data.',3);
    F = g_r./(2*(2*pi*data1(:,2)./60).^2);
    
    h = polyfit(data(2,:).^(-2),data(3,:)./100,1);
    h1 = polyfit(data1(:,2).^(-2),F,1);
    p4 = figure;

    plot(data1(:,2),F,'-ro');
    hold on;
    plot(data1(:,2),data1(:,3)./100,'--b^');
    hold on;
    %plot(data(1,6:-1:1),h(1)*data1(:,2).^(-2)+h(2),'-m');
    xlabel('n','interpreter','latex');
    ylabel('f','interpreter','latex');
    legend('f_{theoratical}','f_{lab}');
    grid minor;
    title('$f_{real}\&f_{lab}$','interpreter','latex');
    g_test = h(1)*pi^2/450;
    sa = sqrt(sum((data1(:,3)-(h(2)+h(1)*data1(:,2).^2)).^2)./4);
    r2 = 1-(sum((data1(:,3)-(h(2)+h(1)*data1(:,2))).^2))./(sum((data1(:,3)-sum(h(2)+h(1)*data1(:,2).^2)/6).^2));
    saveas(p4,'实验室测量焦距和真实焦距.png');
end
%saveas(p1,'phy_rotliq1.png');