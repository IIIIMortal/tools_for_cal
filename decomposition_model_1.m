% decomposition model in presence of multiple fungus (2 types for instance)
% using a modified Lao Ji Si model

clc
close all
clear all

%% definition
% W: current wood mass, in percentage
% t: time
%%
% define constants
MAX_TIME = 1e4;
NUM = 2;
WOOD_AREA = 1;
INIT_AREA = 0.1 * 1 / NUM;
NORM = 1e-3;
%%
% define time
T = 1:MAX_TIME;
%%
% define env
env.moisture = 20;
env.moisture_amp = 0;
env.moisture_freq = 1e-3;
env.temperature = 10;
%%
% define fungus
% extension rate, in milimeter 
% i think it should be affected by temperature
R = [1, 5];
% mosture tolerance, in the range of [-1, 1]
TF = [-0.5, 0.5];
% center of the range of optimal moisture
moisture_optiaml = [15, 30];
% competitive factor
alpha = [-1,-0.1];


% construct a fungi structure
for i = 1:NUM
    fungi(i).R = R(i) .* env.temperature;
    fungi(i).TF = TF(i);
    fungi(i).MC = moisture_optiaml(i);
    fungi(i).alpha = alpha(i);
end

%%
% define initial model
% area of multiple type of fungus
S = INIT_AREA .* ones(NUM, 1);
% total area of the wood
S_total = WOOD_AREA;
% decomposition rate of multiple type of fungus
v = zeros(NUM, 1);
% decomposition wood mass
W = [100];
% affected factor
% for i = 1:NUM
%     k(i) = moisture_factor(fungi(i), env.moisture);
% end

%% define difference model

figure;
for t = T
    for i = 1:NUM
        k(i) = moisture_factor(fungi(i), env.moisture + env.moisture_amp * sin(env.moisture_freq * t));
        % S(i, t + 1) = S(i, t) + k(i) * R(i) * S(i, t) * ...
        % (1 - S(i, t) / (S_total - sum(S(:,t)) + S(i,t)) - [fungi(:).alpha] * (S(:, t) - S(i, t)));
        % S(i, t + 1) = S(i, t) + NORM * k(i) * R(i) * S(i, t) * ...
        % (1 - S(i, t) / (S_total - sum(S(:,t)) + S(i,t)));
        % S(i, t + 1) = S(i, t) + k(i) * R(i) * S(i, t) * ...
        % (1 - (S(i, t) - [fungi(:).alpha] * (S(:, t) - S(i, t))) / (S_total - sum(S(:,t)) + S(i,t)));
        % S(i, t + 1) = S(i, t) + NORM * k(i) * R(i) * S(i, t) * ...
        % (1 - (S(i, t)) / (S_total - sum(S(:,t)) + S(i,t)) - [fungi(:).alpha] * (k .* R - k(i) * R(i)).');
        % S(i, t + 1) = S(i, t) + NORM * k(i) * R(i) * S(i, t) * ...
        % (1 - (S(i, t)) / (S_total - sum(S(:,t)) + S(i,t)) - ([fungi(:).alpha] .* k .* R - fungi(i).alpha * k(i) * R(i)) * S(:, t));
%         S(i, t + 1) = S(i, t) + NORM * k(i) * R(i) * S(i, t) * ...
%         (1 - (S(i, t)) / (S_total - sum(S(:,t)) + S(i,t)) - (([fungi(:).alpha] .* k .* R) * S(:, t) + fungi(i).alpha * k(i) * R(i) * S(i,t))*win(sum(S(:,t))));
        % tmp = sum(NORM * k .* [fungi(:).R] * S(:,t) * W(t) * env.temperature);
        % 下面这个是 给第三项加上第二项的分母的式子
        S(i, t + 1) =S(i, t) + NORM * k(i) * R(i) * S(i, t) * ...
        (1 - ((S(i, t)) + (([fungi(:).alpha] .* k .* R) * S(:, t) - fungi(i).alpha * k(i) * R(i) * S(i,t)) * win(sum(S(:,t))) )/ (S_total - sum(S(:,t)) + S(i,t)));
        
    end
    % zh 吸收和分解的转化效率
    zh = 0.1;
    v(:, t + 1) = zh * NORM * k(:) .* R(:) .* S(:, t + 1);
    W(t + 1) = W(t) * (1 - sum(v(:, t + 1)));
    plot(t:t+1, W(t: t+1));
    hold on;
end
set(get(gca, 'Title'), 'String', "Wood Mass");
set(get(gca, 'YLabel'), 'String', "W");
set(get(gca, 'XLabel'), 'String', "t");
grid on;
%%
figure;
for i = 1:NUM
    plot(S(i,:));
    hold on;
end
ylim([0, 1]);
legend("tolerance", "domiance")
set(get(gca, 'Title'), 'String', "Area of multiple fungus");
set(get(gca, 'YLabel'), 'String', "S (%)");
set(get(gca, 'XLabel'), 'String', "t");
grid on;
%%
% check S sum
figure;
plot(S(1,:) + S(2,:));
grid on;
set(get(gca, 'Title'), 'String', "Sum of all area");
set(get(gca, 'XLabel'), 'String', "t");
set(get(gca, 'YLabel'), 'String', "S (%)");



