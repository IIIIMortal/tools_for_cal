clear;
clc;

l1 = Link([0    284 0   pi/2]);
l2 = Link([0    0   225 0]);
l3 = Link([0    0   0  pi/2]);
l4 = Link([0    228.9   0   -pi/2]);
l5 = Link([0    0  0   pi/2]);
l6 = Link([0    55  0   0]);

l2.offset = pi/2;
l5.offset = -pi/2;
arm = SerialLink([l1,l2,l3,l4,l5,l6]);
arm.display();
arm.teach;
