function result = env_change(env, type, t)
%myFun - Description
%
% Syntax: result = env_change(env, type, t)
%
% Input: env - structure of a certain environment, including moisture & temperature
%        type - temperature or moisture
%        t - time
    if strcmp(type, "temperature")
        result = env.temperature.avg + ...
            env.temperature.daliy_amp * sin(env.temperature.daliy_freq * t) + ...
            env.temperature.season_amp * sin(env.temperature.season_freq * t);
    elseif strcmp(type, "moisture")
        result = env.moisture.avg - ...
            env.moisture.daliy_amp * sin(env.moisture.daliy_freq * t) + ...
            env.moisture.season_amp * sin(env.moisture.season_freq * t);
end