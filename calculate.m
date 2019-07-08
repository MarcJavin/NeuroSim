function X = calculate(w, init, inj, dt, params)
%% Perform one time step simulation of the circuit

% Inputs:
% init : [1, #neuron], initial neural activity
% i : [#timesteps, #neuron], injected current
% dt : scalar, time step

% Outputs:
% X : [#timesteps  , #neuron], resulting neural activity
%
% Written by Marc Javin
    if isempty(init)
        init = zeros(1, size(w, 1));
    end
    if isempty(inj)
        inj = ones(100, size(w,1));
    end
    X = zeros(size(inj, 1), size(w, 1));
    X(1,:) = init;
    for i = 1:size(inj)
        X(i+1, :) = step(X(i, :), inj(i, :), w, dt, params);
    end
end


function xo = step(x, i, w, dt, params)
%% Perform one time step simulation of the circuit

% Inputs:
% x : [1, #neuron], previous neural activity
% i : [1, #neuron], injected current
% dt : scalar, time step

% Outputs:
% x : [1, #neuron], resulting neural activity
%
% Written by Marc Javin

    i = i + params.synfunc(x, w, params.syn);
    xo = params.neurfunc(x, i, dt, params.neur);
end