clear;
close all;
clc;

syms ct1 ct2 ct3 ct4 ct5 ct6;
syms st1 st2 st3 st4 st5 st6;
syms ca sa cb sb cg sg dw rw3;

sa1=1;
ca1=0;

sa2=0;
ca2=1;

sa3=1;
ca3=0;

sa4=-1;
ca4=0;

sa5=1;
ca5=0;

sa6=0;
ca6=1;

a = [0      225     0       0       0       0];
d = [284    0       0       229   0       55];
alpha = [pi/2       0       pi/2    -pi/2   pi/2    0];

t01 = [ct1 -ca1*st1 sa1*st1 a(1)*ct1; ...
    st1 ca1*ct1 -sa1*ct1 a(1)*st1; ...
    0 sa1 ca1 d(1); ...
    0 0 0 1];

t12 = [ct2 -ca2*st2 sa2*st2 a(2)*ct2; ...
    st2 ca2*ct2 -sa2*ct2 a(2)*st2; ...
    0 sa2 ca2 d(2); ...
    0 0 0 1];
t23 = [ct3 -ca3*st3 sa3*st3 a(3)*ct3; ...
    st3 ca3*ct3 -sa3*ct3 a(3)*st3; ...
    0 sa3 ca3 d(3); ...
    0 0 0 1];

t34 = [ct4 -ca4*st4 sa4*st4 a(4)*ct4; ...
    st4 ca4*ct4 -sa4*ct4 a(4)*st4; ...
    0 sa4 ca4 d(4); ...
    0 0 0 1];

t45 = [ct5 -ca5*st5 sa5*st5 a(5)*ct5; ...
    st5 ca5*ct5 -sa5*ct5 a(5)*st5; ...
    0 sa5 ca5 d(5); ...
    0 0 0 1];

t56 = [ct6 -ca6*st6 sa6*st6 a(6)*ct6; ...
    st6 ca6*ct6 -sa6*ct6 a(6)*st6; ...
    0 sa6 ca6 d(6); ...
    0 0 0 1];

t03 = t01 * t12 * t23;
t06 = t01 * t12 * t23 * t34 * t45 * t56;
t36 = t34 * t45 * t56;

R36 = t36(1:3,1:3);
% d36 = t36(1:3,4);

R03 = t03(1:3,1:3);
d03 = t03(1:3,4);

Rzt = [ca sa 0; ...
    -sa ca 0; ...
    0 0 1];

Ryt = [cb 0 -sb; ...
    0 1 0; ...
    sb 0 cb];

Rxt = [1 0 0; ...
    0 cg sg; ...
    0 -sg cg];

R0w = Rzt * Ryt * Rxt
d0w = R0w * [0;0;dw]

left = R03 * [0;0;rw3] + d03
