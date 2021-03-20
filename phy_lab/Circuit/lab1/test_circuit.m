c = load("lab_test_diode_withR.txt");
d = load("lab_test_diode_noR.txt");
e = load("lab_test_SVDiode_withR.txt");
a = c(1,:);
b = c(2,:);
A = d(1,:);
B = d(2,:);
eu = e(1,:);
ei = e(2,:);


x_i = load('lab_test_dianliu.txt');
i = x_i(1,:);
u = x_i(2,:);


%%%%%%
p1 = figure;
plot(a,b,"-ob");
axis([-1 1 -0.5 80]);
xlabel("U/V");
ylabel("I/mA");
grid on;
grid minor;
box on;
title("���ñ����������ͨ�����ܷ�����������");
% f=getframe();
saveas(p1,'���ñ����������ͨ�����ܷ�����������.png');

%%%%%%
p2 = figure ;
plot(A,B,"-+r");
axis([-1 1 -0.5 105]);
xlabel("U/V");
ylabel("I/mA");
grid on;
grid minor;
box on;
title("δ���ñ����������ͨ�����ܷ����������߶Ա�ͼ");
%f=getframe();
saveas(p2,'δ���ñ����������ͨ�����ܷ����������߶Ա�ͼ.png');

%%%%%%%
p3 = figure ;
plot(a,b,"-o");
hold on;
plot(A,B,"-+");
axis([-1 1 -0.5 105]);
plot(u,i,'-*');
xlabel("U/V");
ylabel("I/mA");
grid on;
grid minor;
box on;
legend('�б�������','û�б�������', 'ʹ�ú���Դ');
title("���ñ�������������ͨ�����ܷ����������߶Ա�ͼ");
% f=getframe();
saveas(p3,'���ñ�������������ͨ�����ܷ����������߶Ա�ͼ.png');

%%%%%%
p4 = figure;
plot(eu,ei,'-*m');
axis([-6 1.2 -200 200]);
xlabel("U/V");
ylabel("I/mA");
grid on;
grid minor;
box on;
 title("���ñ����������ѹ�ܷ�����������");
% f=getframe();
saveas(p4,'���ñ����������ѹ�ܷ�����������.png');

p5 = figure;
plot(u,i,'-*c');
axis([-6 1.2 -0.1 200]);
xlabel("U/V");
ylabel("I/mA");
grid on;
grid minor;
box on;
 title("����Դ������ͨ�����ܵķ�����������");
% f=getframe();
saveas(p5,'����Դ������ͨ�����ܵķ�����������.png');