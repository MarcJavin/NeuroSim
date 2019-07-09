function [syn_xo, io] = synrate(x, ~, ~, params)
%% Perform one time step simulation of a synapse

% from https://www.sciencedirect.com/science/article/pii/S0896627314003602#mmc2

% Inputs:
% x : [1, #neuron], current neural activity
% params :  
            % R0 : scalar or [1, #neuron], baseline rate
            % RMAX : scalar or [1, #neuron], maximum firing rate
            % W : [#neuron, #neuron], weight matrix

% Outputs:
% syn_xo : not used here
% io : [1, #neuron], resulting synaptic currents
%
% Written by Marc Javin

    syn_xo = [];
    R0 = params.R0;
    RMAX = params.RMAX;
    x = R0.*tanh(x/R0) .* (x < 0) + (RMAX - R0).*tanh(x/(RMAX-R0)) .* (x>=0);
    io = x * params.W;
    
end