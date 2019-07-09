function xo = leakint(x, i, dt, params)
%% Perform one time step simulation of a Leaky Integrate neuron

% Inputs:
% x : [1, #neuron], previous neural activity
% i : [1, #neuron], injected current
% dt : scalar, time step
% params :  
            % E : scalar or [1, #neuron], reversal potential
            % G : scalar or [1, #neuron], channel conductance
            % Cm : scalar or [1, #neuron], membrane capacitance

% Outputs:
% xo : [1, #neuron], resulting neural activity
%
% Written by Marc Javin

    dx = ((params.E - x) .* params.G + i) .* dt / params.Cm;
    xo = x + dx;

end