s_data = load('s.txt');
m_data = load('measure.txt');

s_a = s_data(1,:)+s_data(2,:);
s_a = s_a/2;
d_s = zeros(1,4);

for i = 1:4
    d_s(i) = s_a(i+4)-s_a(i);
    d_s(i) = d_s(i)/4;
end

d_s_a = sum(d_s)/4;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m_a = sum(m_data.')/5;
d_D = abs(m_data(1,:)-m_a(1));
d_b = abs(m_data(2,:)-m_a(2));
d_L = abs(m_data(3,:)-m_a(3));
d_d = abs(m_data(4,:)-m_a(4));
d_m = [d_D;d_b;d_L;d_d];
d_data = sum(d_m.')/5;
%mu_data = sqrt(sum((d_m.').^2)./4);
mu_A = zeros(1,4);
for i = 1:4
   mu_A(i) = sqrt(sum((m_data(i,:)-m_a(i)).^2)./4); 
end

