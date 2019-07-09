function activity = calculate(init, inj, dt, params)
%% Perform one time step simulation of the circuit

% Inputs:
% init : [1, #neuron], initial neural activity
% inj : [#timesteps, #neuron], injected current, defines numbers of time
% steps
% dt : scalar, time step duration

% Outputs:
% activity : [#timesteps, #neuron], resulting neural activity
%
% Written by Marc Javin

    n_neur = size(params.syn.W, 1);
    if isempty(init)
        init = zeros(1, n_neur);
    end
    if isempty(inj)
        inj = zeros(100, n_neur);
    end
    activity = zeros(size(inj, 1), n_neur);
    activity(1,:) = init;
    syn_x = [];
    gap_x = [];
    for i = 1:size(inj)
        [activity(i+1, :), syn_x, gap_x] = step(activity(i, :), inj(i, :), syn_x, gap_x, dt, params);
    end
end


function [xo, syn_xo, gap_xo] = step(x, i, syn_x, gap_x, dt, params)
%% Perform one time step simulation of the circuit

% Inputs:
% x : [1, #neuron], previous neural activity
% i : [1, #neuron], injected current
% dt : scalar, time step

% Outputs:
% xo : [1, #neuron], resulting neural activity
%
% Written by Marc Javin

    [syn_xo, i_syn] = params.syn.func(x, syn_x, dt, params.syn);
    [gap_xo, i_gap] = params.gap.func(x, gap_x, dt, params.gap);
    xo = params.neur.func(x, i + i_syn + i_gap, dt, params.neur);
end