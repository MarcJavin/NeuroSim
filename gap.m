function [gap_xo, io] = gap(x, ~, ~, params)
%% Perform one time step simulation of a synapse

% Inputs:
% x : [1, #neuron], current neural activity
% w : [#neuron, #neuron], weight matrix
% params :  
            % R0 : scalar or [1, #neuron], baseline rate
            % RMAX : scalar or [1, #neuron], maximum firing rate

% Outputs:
% io : [1, #neuron], resulting synaptic currents
%
% Written by Marc Javin

    gap_xo = [];
    n_neur = size(x, 2);
    curs = repmat(x', 1, n_neur) - repmat(x, n_neur, 1) 
    io = params.W .* curs
    io = sum(io, 1)
    
end