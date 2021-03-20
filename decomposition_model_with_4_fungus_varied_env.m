% decomposition model in presence of multiple fungus (2 types for instance)
% using a modified Lao Ji Si model

clc
close all
clear all

% definition
% W: current wood mass, in percentage
% t: time

% define constants
MAX_TIME = 3e4;
NUM = 9;
WOOD_AREA = 1;
INIT_AREA = 0.1 * 1 / NUM;
NORM = 1e-4;

% define time
T = 1:MAX_TIME;

% define env
arid.temperature.avg = 25;
arid.temperature.daliy_freq = 1e-1;
arid.temperature.season_freq = 1e-3;
arid.temperature.daliy_amp = 10;
arid.temperature.season_amp = 10;
arid.moisture.avg = 10;
arid.moisture.daliy_freq = 1e-1;
arid.moisture.season_freq = 1e-3;
arid.moisture.daliy_amp = -2;
arid.moisture.season_amp = 5;

semi_arid.temperature.avg = 25;
semi_arid.temperature.daliy_freq = 1e-1;
semi_arid.temperature.season_freq = 1e-3;
semi_arid.temperature.daliy_amp = 10;
semi_arid.temperature.season_amp = 10;
semi_arid.moisture.avg = 20;
semi_arid.moisture.daliy_freq = 1e-1;
semi_arid.moisture.season_freq = 1e-3;
semi_arid.moisture.daliy_amp = -5;
semi_arid.moisture.season_amp = 10;

temperate.temperature.avg = 20;
temperate.temperature.daliy_freq = 1e-1;
temperate.temperature.season_freq = 1e-3;
temperate.temperature.daliy_amp = 5;
temperate.temperature.season_amp = 15;
temperate.moisture.avg = 45;
temperate.moisture.daliy_freq = 1e-1;
temperate.moisture.season_freq = 1e-3;
temperate.moisture.daliy_amp = -5;
temperate.moisture.season_amp = 20;

aboreal.temperature.avg = 20;
aboreal.temperature.daliy_freq = 1e-1;
aboreal.temperature.season_freq = 1e-3;
aboreal.temperature.daliy_amp = 5;
aboreal.temperature.season_amp = 10;
aboreal.moisture.avg = 55;
aboreal.moisture.daliy_freq = 1e-1;
aboreal.moisture.season_freq = 1e-3;
aboreal.moisture.daliy_amp = -5;
aboreal.moisture.season_amp = 20;

tropical.temperature.avg = 25;
tropical.temperature.daliy_freq = 1e-1;
tropical.temperature.season_freq = 1e-3;
tropical.temperature.daliy_amp = 5;
tropical.temperature.season_amp = 0;
tropical.moisture.avg = 65;
tropical.moisture.daliy_freq = 1e-1;
tropical.moisture.season_freq = 1e-3;
tropical.moisture.daliy_amp = -5;
tropical.moisture.season_amp = 20;

env = tropical;

% define fungus
% extension rate, in milimeter 
% i think it should be affected by temperature
R = [1 , 1, 1, 1, 1, 1, 1, 1, 1];
% mosture tolerance, in the range of [-1, 1]
TF = [-0.5 ,-0.5 ,-0.5 ,0 ,0 ,0 ,0.5 ,0.5 ,0.5 ];
% center of the range of optimal moisture
moisture_optiaml = [20, 50, 80, 20, 50, 80, 20, 50, 80];
% competitive factor
alpha = [0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1];
% construct a fungi structure
for i = 1:NUM
    fungus(i).TF = TF(i);
    fungus(i).MC = moisture_optiaml(i);
    fungus(i).alpha = alpha(i);
end


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
%     k(i) = new_moisture_factor(fungus(i), env.moisture);
% end

% define difference model
for t = T
    %if t == MAX_TIME / 4
    %    env = semi_arid;
    %end
    for i = 1:NUM
        fungus(i).R = R(i) * env_change(env, "temperature", t);
        k(i) = new_moisture_factor(fungus(i), env_change(env, "moisture", t));
    end
    for i = 1:NUM
        % k(i) = new_moisture_factor(fungus(i), env.moisture + env.moisture_amp * sin(env.moisture_freq * t));
        % S(i, t + 1) = S(i, t) + k(i) * R(i) * S(i, t) * ...
        % (1 - S(i, t) / (S_total - sum(S(:,t)) + S(i,t)) - [fungi(:).alpha] * (S(:, t) - S(i, t)));
        % S(i, t + 1) = S(i, t) + NORM * k(i) * fungi(i).R * S(i, t) * ...
        % (1 - S(i, t) / (S_total - sum(S(:,t)) + S(i,t)));
        % S(i, t + 1) = S(i, t) + k(i) * R(i) * S(i, t) * ...
        % (1 - (S(i, t) - [fungi(:).alpha] * (S(:, t) - S(i, t))) / (S_total - sum(S(:,t)) + S(i,t)));
        % S(i, t + 1) = S(i, t) + NORM * k(i) * R(i) * S(i, t) * ...
        % (1 - (S(i, t)) / (S_total - sum(S(:,t)) + S(i,t)) - [fungi(:).alpha] * (k .* R - k(i) * R(i)).');
        % S(i, t + 1) = S(i, t) + NORM * k(i) * R(i) * S(i, t) * ...
        % (1 - (S(i, t)) / (S_total - sum(S(:,t)) + S(i,t)) - ([fungi(:).alpha] .* k .* R - fungi(i).alpha * k(i) * R(i)) * S(:, t));
        S(i, t + 1) = S(i, t) + NORM * k(i) * fungus(i).R * S(i, t) * ...
        (1 - (S(i, t)) / (S_total - sum(S(:,t)) + S(i,t)) - ([fungus.alpha] .* k .* [fungus.R]) * S(:, t) + fungus(i).alpha * k(i) * fungus(i).R * S(i,t));
    end
    v(:, t + 1) = 1e-1 * NORM * k(:) .* [fungus.R].' .* S(:, t + 1);
    W(t + 1) = W(t) - W(t) * sum(v(:, t + 1));
    
end
figure;
plot(W, 'linewidth', 1);
set(get(gca, 'Title'), 'String', "Loss of Wood Mass");
set(get(gca, 'YLabel'), 'String', "W");
set(get(gca, 'XLabel'), 'String', "t");
grid on;

color=[1 0 0;0 1 0;0 0 1;0.5 1 1;1 1 0.5;1 0.5 1; 0 0 0.5; 0.5 0 0;0 0.5 0];
figure;
for i = 1:NUM
    plot(S(i,:), 'linewidth', 1,  'Color', color(i,:));
    hold on;
end
ylim([0, 1]);
%legend(string(1:NUM))
legend("fungus 1", "fungus 2","fungus 3", "fungus 4", "fungus 5", "fungus 6", "fungus 7", "fungus 8", "fungus 9");
set(get(gca, 'Title'), 'String', "Size of fungal territory");
set(get(gca, 'YLabel'), 'String', "S (%)");
set(get(gca, 'XLabel'), 'String', "t");
grid on;

% check S sum
figure;
plot(sum(S, 1), 'linewidth', 1);
grid on;
set(get(gca, 'Title'), 'String', "Sum of all area");
set(get(gca, 'XLabel'), 'String', "t");
set(get(gca, 'YLabel'), 'String', "S (%)");

wood_loss = W(8e3);

