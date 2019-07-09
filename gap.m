function [gap_xo, io] = gap(x, ~, ~, params)
%% Perform one time step simulation of a synapse

% Inputs:
% x : [1, #neuron], current neural activity
% params :  
            % W : [#neuron, #neuron], weight matrix (conductances)

% Outputs:
% gap_xo : not used here
% io : [1, #neuron], resulting synaptic currents
%
% Written by Marc Javin

    gap_xo = [];
    n_neur = size(x, 2);
    curs = repmat(x', 1, n_neur) - repmat(x, n_neur, 1) ;
    io = sum(params.W .* curs, 1);
    
end