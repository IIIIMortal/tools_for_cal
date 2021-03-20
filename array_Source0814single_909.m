%%   %%%%%%%%%%%%  Iterative Angular Spectrum Algorithm  %%%%%%%%%%%%%%%%%
%%%
%%%    This expandable algorithm is designed for ultrasonic control array module with
%%%    versatile capability. First draft is edited by ZY.  2019.04.13
%%%
%%%
%%   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%   %%%%%%%%%%%%   Parameters   %%%%%%%%%%%%%

deltaL = 1;    % Discrete size,   unit: mm
A_L = 220;       % Field of view,    unit: mm
f = 40000;       % Frequency,       unit: Hz
w = 2*pi*f;      % Angular frequency
c = 340;         % Sound speed,  unit: m/s
km = w/c;        % Sound wave number
r0 = 4.5;          % Radius of ultrasonic transducer,  unit: mm 
L_gap = 12;      % mm
N = 5;           % Size of transducer array (N*r0 < (1/3~1/2)*A_L for less artefects)
zm = 55;         % Maximum range of z-coordinate,    unit: mm
zfoc = 48;        % z-value of focus plane,  unit:  mm
floating_point = [0,0];  %mm


%%


%%

%%   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%   % Array of transducers  (Amplitude and Phase)%%%%%%%

An = A_L/deltaL + 1;
Ac = floor(An/2) + 1;
A_lo = zeros(N*N,2);
h = 0 ;
for i = 1:N
    for j = 1:N
        h = h + 1;
        A_lo(h,:) = [-(N-1)/2*L_gap/deltaL + (i-1)*L_gap/deltaL + Ac , -(N-1)/2*L_gap/deltaL + (j-1)*L_gap/deltaL + Ac];
    end
end
A = zeros(An,An);
Aphase = zeros(An,An);

for k = 1:N*N
for i = 1:An
    for j = 1:An
        if (i - A_lo(k,1))^2 + (j - A_lo(k,2))^2 < (r0/deltaL)^2
            A(i,j) = 1;
            Aphase(i,j) = 0;
        end
    end
end
end
% figure;
% imagesc(Aphase);axis square;

%%   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% %%%%%%%%%%%%%%%% Mapping whole acoustic field  %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Phase of transducer initialization  %%

%%  %%%%%%%%%%%%%%%%%%%%



%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% %%%%%%%%%%%%%%%%%%%% Design Iteration %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


n = 2;
DesignA = zeros(An,An);
Dr = 1.0 * deltaL;
De = zeros(An,An);
de = 0.999;
Pe = zeros(An,An);


%%  Control points %%%

for i = 1:An
    for j = 1:An

        if (j - Ac + 0.5 + round((floating_point(1))/deltaL*100*2*pi/km))^2  + (i - Ac  + 0.5 + round((floating_point(2))/deltaL*100*2*pi/km) )^2 < (Dr*1.08)^2
            DesignA(i,j) = 1;
            De(i,j) = 1 + de;


        else           
            De(i,j) = 1 - de;
        end
        
    end
end

%%  %%%%%%%%%%%%

%%     Iteration     %%%%%
figure;
Rphase = zeros(An,An);
while n < 50

Afoc = zeros(An,An);     
kxm = km *A_L/sqrt(A_L^2 + zfoc^2);
kym = km *A_L/sqrt(A_L^2 + zfoc^2) ;

Hforzfoc = zeros(An,An);
Hbaczfoc = zeros(An,An);

for i = 1:An
    for j = 1:An
        if (i-Ac)^2 + (j-Ac)^2 < (km/1000*A_L/2/pi)^2

            if i  < Ac + kxm/1000*A_L/2/pi && i > Ac - kxm/1000*A_L/2/pi
                if j  < Ac + kym/1000*A_L/2/pi && j > Ac - kym/1000*A_L/2/pi
                     Hforzfoc(i,j) = exp(1j*zfoc/1000*sqrt(km^2 - ((i - Ac)*2*pi/A_L*1000).^2 - ((j - Ac)*2*pi/A_L*1000).^2));
                     Hbaczfoc(i,j) = exp(-1j*zfoc/1000*sqrt(km^2 - ((i - Ac)*2*pi/A_L*1000).^2 - ((j - Ac)*2*pi/A_L*1000).^2));
                end
            end

        end
    end
end

Ae = A.*exp(1j*(Aphase));
Aeq = fftshift(fft2(Ae));

Afoceq = Aeq.*Hforzfoc;
Afoc = ifft2(ifftshift(Afoceq));

Afoc_A = abs(Afoc);
Afoc_P =real(-1j*log(Afoc./Afoc_A));
Afoc_A = Afoc_A.* De;
Amax = max(max(Afoc_A));

pi1 = [];
pi2 = [];
for i = 1:An
    for j = 1:An
        if De(i,j) == 1+de
            
            Afoc_A(i,j) = Amax;
        end

    end
end



Afoc = Afoc_A.*exp(1j*Afoc_P);

Afocq = fftshift(fft2(Afoc));
Aeq = Afocq.*Hbaczfoc;
Ae =  ifft2(ifftshift(Aeq));

Rphase = -1j*log(Ae./abs(Ae));

for k = 1:N*N
for i = 1:An
    for j = 1:An
        if (i - A_lo(k,1))^2 + (j-A_lo(k,2))^2 < (r0/deltaL)^2
            Aphase(i,j) =real(Rphase(A_lo(k,1),A_lo(k,2)));
        end
    end
end
end
Rphase = Aphase;
n = n + 1;

 subplot(1,2,1);
 imagesc(abs(Afoc));axis square;caxis([0 0.005]);
 subplot(1,2,2);
 imagesc((Aphase));axis square;
 
 pause(0.2);
end
%%  %%%%%%%%%%%%

% 
%  figure;
%  subplot(1,2,1);
%  imagesc(abs(Afoc));axis square;
%   subplot(1,2,2);
%  imagesc(abs(DesignA));axis square;
 
 %% %%%%%%%%%%%%%
 
 Aall = zeros(An,An,zm);

for z = 1:zm    
    
kxm = km *A_L/sqrt(A_L^2 + z^2);
kym = km *A_L/sqrt(A_L^2 + z^2) ;

%%  Forward propagation kernel  %%

Hfor = zeros(An,An);
for i = 1:An
    for j = 1:An
        if (i-Ac)^2 + (j-Ac)^2 < (km/1000*A_L/2/pi)^2
            if i  < Ac + kxm/1000*A_L/2/pi && i > Ac - kxm/1000*A_L/2/pi
                if j  < Ac + kym/1000*A_L/2/pi && j > Ac - kym/1000*A_L/2/pi
                     Hfor(i,j) = exp(1j*z/1000*sqrt(km^2 - ((i - Ac)*2*pi/A_L*1000).^2 - ((j - Ac)*2*pi/A_L*1000).^2));
                end
            end
        end
    end
end

%%  %%%%%%%%%%%%%%%%%

Ae = A.*exp(1j*((Rphase)));
Aeq = fftshift(fft2(Ae));
Azeq = Aeq.*Hfor;
Aze = ifft2(ifftshift(Azeq));
Aall(:,:,z) = Aze;

end
 
Myphase = zeros(N,N);
for k = 1:N*N
    i = floor((k-1)/N)+1;
    j = k - (floor((k-1)/N)) * N;
    Myphase(i,j) = real(Rphase(A_lo(k,1),A_lo(k,2)));
end
Myphase = Myphase / 2/ pi;



figure;
imagesc(Myphase);axis square;

figure;
% as = slice(abs(Aall),Ac,0,0);
hold on;
bs = slice(abs(Aall),0,Ac,0);
cs = slice(abs(Aall),0,0,zfoc);
% set(as,'EdgeColor','none');
set(bs,'EdgeColor','none');
set(cs,'EdgeColor','none');
view([180 0]);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



